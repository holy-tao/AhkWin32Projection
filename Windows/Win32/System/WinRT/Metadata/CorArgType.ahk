#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorArgType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_END => 0

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_VOID => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_I4 => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_I8 => 3

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_R4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_R8 => 5

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_PTR => 6

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_OBJECT => 7

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_STRUCT4 => 8

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_STRUCT32 => 9

    /**
     * @type {Integer (Int32)}
     */
    static IMAGE_CEE_CS_BYVALUE => 10
}
