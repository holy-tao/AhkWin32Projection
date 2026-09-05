#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class TypeKind extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TypeUDT => 0

    /**
     * Native name: TypePointer
     * @type {Integer (Int32)}
     */
    static Pointer => 1

    /**
     * Native name: TypeMemberPointer
     * @type {Integer (Int32)}
     */
    static MemberPointer => 2

    /**
     * Native name: TypeArray
     * @type {Integer (Int32)}
     */
    static Array => 3

    /**
     * Native name: TypeFunction
     * @type {Integer (Int32)}
     */
    static Function => 4

    /**
     * Native name: TypeTypedef
     * @type {Integer (Int32)}
     */
    static Typedef => 5

    /**
     * Native name: TypeEnum
     * @type {Integer (Int32)}
     */
    static Enum => 6

    /**
     * Native name: TypeIntrinsic
     * @type {Integer (Int32)}
     */
    static Intrinsic => 7

    /**
     * Native name: TypeExtendedArray
     * @type {Integer (Int32)}
     */
    static ExtendedArray => 8
}
