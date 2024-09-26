#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "background" asset catalog image resource.
static NSString * const ACImageNameBackground AC_SWIFT_PRIVATE = @"background";

/// The "ship" asset catalog image resource.
static NSString * const ACImageNameShip AC_SWIFT_PRIVATE = @"ship";

#undef AC_SWIFT_PRIVATE
