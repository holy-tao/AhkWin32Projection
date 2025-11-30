#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies component enumeration options.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wiccomponentenumerateoptions
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICComponentEnumerateOptions extends Win32Enum{

    /**
     * Enumerate any components that are not disabled. Because this value is 0x0, it is always included with the other options.
     * @type {Integer (Int32)}
     */
    static WICComponentEnumerateDefault => 0

    /**
     * Force a read of the registry before enumerating components.
     * @type {Integer (Int32)}
     */
    static WICComponentEnumerateRefresh => 1

    /**
     * Include disabled components in the enumeration. The set of disabled components is disjoint with the set of default enumerated components
     * @type {Integer (Int32)}
     */
    static WICComponentEnumerateDisabled => -2147483648

    /**
     * Include unsigned components in the enumeration. This option has no effect.
     * @type {Integer (Int32)}
     */
    static WICComponentEnumerateUnsigned => 1073741824

    /**
     * At the end of component enumeration, filter out any components that are not Windows provided.
     * @type {Integer (Int32)}
     */
    static WICComponentEnumerateBuiltInOnly => 536870912
}
