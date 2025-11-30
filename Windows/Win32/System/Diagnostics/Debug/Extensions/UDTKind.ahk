#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class UDTKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDTStruct => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDTClass => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDTUnion => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDTInterface => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDTTaggedUnion => 4
}
