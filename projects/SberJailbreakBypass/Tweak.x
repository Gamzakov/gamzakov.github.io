/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

%hook NSFileManager
	- (BOOL)fileExistsAtPath:(NSString *)path {
		NSArray *jbChecks = [NSArray arrayWithObjects:
								@"/Applications/Cydia.app",
								@"/Library/MobileSubstrate/MobileSubstrate.dylib",
								@"/bin/bash",
								@"/usr/sbin/sshd",
								@"/etc/apt",
								@"/usr/bin/ssh",
								@"/bin/sh",
								@"/Applications/RockApp.app",
								@"/Applications/Icy.app",
								@"/usr/bin/sshd",
								@"/usr/libexec/sftp-server",
								@"/Applications/WinterBoard.app",
								@"/Applications/SBSettings.app",
								@"/Applications/MxTube.app",
								@"/Applications/IntelliScreen.app",
								@"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
								@"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
								@"/private/var/lib/apt",
								@"/private/var/stash",
								@"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
								@"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
								@"/private/var/tmp/cydia.log",
								@"/private/var/lib/cydia",
								@"/etc/clutch.conf",
								@"/var/cache/clutch.plist",
								@"/etc/clutch_cracked.plist",
								@"/var/cache/clutch_cracked.plist",
								@"/var/lib/clutch/overdrive.dylib",
								@"/var/root/Documents/Cracked/",
								@"/var/mobile/Applications/JailbreakChecking",
								@"/System/Library/Frameworks/Foundation.framework/Foundation",
								@"/Applications/FakeCarrier.app",
								@"/Applications/blackra1n.app",
								@"/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate",
								@"/Library/Frameworks/CydiaSubstrate.framework/Libraries/SubstrateLoader.dylib",
								@"/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
								@"/Library/MobileSubstrate/DynamicLibraries/ProtectMyPrivacy.dylib",
								@"/Library/MobileSubstrate/DynamicLibraries/WeeLoader.dylib",
								@"/Library/MobileSubstrate/DynamicLibraries/xCon.dylib",
								@"/etc/ssh/sshd_config",
								@"/usr/binsshd",
								@"/usr/libexec/cydia",
								@"/usr/libexec/ssh-keysign",
								@"/usr/sbinsshd",
								@"/var/cache/apt",
								@"/var/lib/apt",
								@"/var/lib/cydia",
								@"/system/app/Superuser.apk",
								@"/private/var/mobileLibrary/SBSettingsThemes",
								@"/private/var/mobile/Library/SBSettings/Themes",
								@"/var/log/syslog",
								@"/var/tmp/cydia.log",
								nil
							];

		for (NSString *check in jbChecks) {
			if ([check isEqualToString: path]) {
				NSLog(@"JB Check return NO for path: %@", path);
				return NO;
			}
		}

		return %orig;
	}

	- (BOOL)createDirectoryAtPath:(NSString *)path 
                   attributes:(NSDictionary *)attributes {
		
		%log;

		return %orig;
	}
%end

%hook TuneUtils
	+ (BOOL)checkJailBreak {
		NSLog(@"TuneUtils+checkJailBreak was called. Returned NO.");
		return NO;
	}
%end