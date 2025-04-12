#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void onClick(char *argv) {
	printf("%c\n", argv[0]);
	// switch (*argv[0]) {
	// }

}

int main(int argc, char *argv[]) {
	if (argc > 1) {
		char* token = strtok(*argv, " ");
		token = strtok(token, " ");
		printf(" % s\n", token);
		// onClick(token);
	}

	if (system("grep -xq 'up' /sys/class/net/w*/operstate 2>/dev/null") == 0) {
		system("printf \"%s%s%s\" \"$(sed \"s/.*/ /\" /sys/class/net/tun*/operstate 2>/dev/null)\" \"$(sed \"s/down//;s/up/ /\" /sys/class/net/e*/operstate 2>/dev/null)\" \"\"");
	} else if (system("grep -xq 'down' /sys/class/net/w*/operstate 2>/dev/null") == 0) {
		if (system("grep -xq '0x1003' /sys/class/net/w*/flags") == 0) {
			system("printf \"%s%s%s\" \"$(sed \"s/.*/ /\" /sys/class/net/tun*/operstate 2>/dev/null)\" \"$(sed \"s/down//;s/up/ /\" /sys/class/net/e*/operstate 2>/dev/null)\" \"\"");
		} else {
			system("printf \"%s%s%s\" \"$(sed \"s/.*/ /\" /sys/class/net/tun*/operstate 2>/dev/null)\" \"$(sed \"s/down//;s/up/ /\" /sys/class/net/e*/operstate 2>/dev/null)\" \"❌\"");
		}
	}

	return 0;
}
