#!/usr/bin/perl
my $acpi;
my $status;
my $percent;
my $full_text;

# read the first line of the "acpi" command output
open (ACPI, "acpi -b | grep -wv unavailable |") or die;
$acpi = <ACPI>;
close(ACPI);

# fail on unexpected output
if ($acpi !~ /: (\w+), (\d+)%/) {
	die "$acpi\n";
}

$status = $1;
$percent = $2;
$full_text = "$percent%";

if ($status eq 'Discharging') {
        if ($percent < 20) {
              system("sh", "/home/user/.local/bin/bat-low-notify", "$full_text");
        }
        if ($percent < 10) {
				system("sh", "sleep 3 && loginctl poweroff")
        }
	$full_text .= ' ';
} else {
	$full_text .= ' ';
}

# print text
print "$full_text";

exit(0);
#$full_text .= ' ';
#$full_text .= ' ';
