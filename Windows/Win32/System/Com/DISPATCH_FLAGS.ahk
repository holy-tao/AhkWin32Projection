#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class DISPATCH_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static DISPATCH_METHOD => 1

    /**
     * @type {Integer (UInt16)}
     */
    static DISPATCH_PROPERTYGET => 2

    /**
     * @type {Integer (UInt16)}
     */
    static DISPATCH_PROPERTYPUT => 4

    /**
     * @type {Integer (UInt16)}
     */
    static DISPATCH_PROPERTYPUTREF => 8
}
