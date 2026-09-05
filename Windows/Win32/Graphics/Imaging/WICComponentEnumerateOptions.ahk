#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies component enumeration options.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wiccomponentenumerateoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICComponentEnumerateOptions extends Win32Enum {

    /**
     * Enumerate any components that are not disabled. Because this value is 0x0, it is always included with the other options.
     * Native name: WICComponentEnumerateDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Force a read of the registry before enumerating components.
     * Native name: WICComponentEnumerateRefresh
     * @type {Integer (Int32)}
     */
    static Refresh => 1

    /**
     * Include disabled components in the enumeration. The set of disabled components is disjoint with the set of default enumerated components
     * Native name: WICComponentEnumerateDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => -2147483648

    /**
     * Include unsigned components in the enumeration. This option has no effect.
     * Native name: WICComponentEnumerateUnsigned
     * @type {Integer (Int32)}
     */
    static Unsigned => 1073741824

    /**
     * At the end of component enumeration, filter out any components that are not Windows provided.
     * Native name: WICComponentEnumerateBuiltInOnly
     * @type {Integer (Int32)}
     */
    static BuiltInOnly => 536870912
}
