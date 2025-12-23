#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorMethodSemanticsAttr extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msSetter => 1

    /**
     * @type {Integer (Int32)}
     */
    static msGetter => 2

    /**
     * @type {Integer (Int32)}
     */
    static msOther => 4

    /**
     * @type {Integer (Int32)}
     */
    static msAddOn => 8

    /**
     * @type {Integer (Int32)}
     */
    static msRemoveOn => 16

    /**
     * @type {Integer (Int32)}
     */
    static msFire => 32
}
