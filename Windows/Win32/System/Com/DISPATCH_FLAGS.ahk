#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class DISPATCH_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DISPATCH_METHOD
     * @type {Integer (UInt16)}
     */
    static METHOD => 1

    /**
     * Native name: DISPATCH_PROPERTYGET
     * @type {Integer (UInt16)}
     */
    static PROPERTYGET => 2

    /**
     * Native name: DISPATCH_PROPERTYPUT
     * @type {Integer (UInt16)}
     */
    static PROPERTYPUT => 4

    /**
     * Native name: DISPATCH_PROPERTYPUTREF
     * @type {Integer (UInt16)}
     */
    static PROPERTYPUTREF => 8
}
