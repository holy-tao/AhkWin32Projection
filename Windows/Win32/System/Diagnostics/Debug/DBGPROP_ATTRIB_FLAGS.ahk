#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DBGPROP_ATTRIB_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_NO_ATTRIB => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_IS_INVALID => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_IS_EXPANDABLE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_IS_FAKE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_IS_METHOD => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_IS_EVENT => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_IS_RAW_STRING => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_READONLY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_ACCESS_PUBLIC => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_ACCESS_PRIVATE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_ACCESS_PROTECTED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_ACCESS_FINAL => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_STORAGE_GLOBAL => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_STORAGE_STATIC => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_STORAGE_FIELD => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_STORAGE_VIRTUAL => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_TYPE_IS_CONSTANT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_TYPE_IS_SYNCHRONIZED => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_TYPE_IS_VOLATILE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_HAS_EXTENDED_ATTRIBS => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_FRAME_INTRYBLOCK => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_FRAME_INCATCHBLOCK => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_FRAME_INFINALLYBLOCK => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_IS_RETURN_VALUE => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DBGPROP_ATTRIB_VALUE_PENDING_MUTATION => 268435456
}
