#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class UDTKind extends Win32Enum {

    /**
     * Native name: UDTStruct
     * @type {Integer (Int32)}
     */
    static Struct => 0

    /**
     * Native name: UDTClass
     * @type {Integer (Int32)}
     */
    static Class => 1

    /**
     * Native name: UDTUnion
     * @type {Integer (Int32)}
     */
    static Union => 2

    /**
     * Native name: UDTInterface
     * @type {Integer (Int32)}
     */
    static Interface => 3

    /**
     * Native name: UDTTaggedUnion
     * @type {Integer (Int32)}
     */
    static TaggedUnion => 4
}
