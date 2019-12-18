#line 1 "Tweak.x"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class NSFileManager; 
static BOOL (*_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$)(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL (*_logos_orig$_ungrouped$NSFileManager$removeItemAtPath$error$)(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *, NSError * _Nullable *); static BOOL _logos_method$_ungrouped$NSFileManager$removeItemAtPath$error$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *, NSError * _Nullable *); 

#line 1 "Tweak.x"

	static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * path) {
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

		return _logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$(self, _cmd, path);
	}


	static BOOL _logos_method$_ungrouped$NSFileManager$removeItemAtPath$error$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * path, NSError * _Nullable * error) {
		NSLog(@"Removing item at path: %@", path);
		
		if ([@"/var/mobile/Applications/JailbreakChecking" isEqualToString: path]) {
			NSLog(@"JB Detecion tries remove item at path: %@", path);
		}

		return _logos_orig$_ungrouped$NSFileManager$removeItemAtPath$error$(self, _cmd, path, error);
	}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NSFileManager = objc_getClass("NSFileManager"); MSHookMessageEx(_logos_class$_ungrouped$NSFileManager, @selector(fileExistsAtPath:), (IMP)&_logos_method$_ungrouped$NSFileManager$fileExistsAtPath$, (IMP*)&_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$);MSHookMessageEx(_logos_class$_ungrouped$NSFileManager, @selector(removeItemAtPath:error:), (IMP)&_logos_method$_ungrouped$NSFileManager$removeItemAtPath$error$, (IMP*)&_logos_orig$_ungrouped$NSFileManager$removeItemAtPath$error$);} }
#line 80 "Tweak.x"
