#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class DBGPROP_ATTRIB_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DBGPROP_ATTRIB_NO_ATTRIB
     * @type {Integer (Int32)}
     */
    static NO_ATTRIB => 0

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_IS_INVALID
     * @type {Integer (Int32)}
     */
    static VALUE_IS_INVALID => 8

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_IS_EXPANDABLE
     * @type {Integer (Int32)}
     */
    static VALUE_IS_EXPANDABLE => 16

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_IS_FAKE
     * @type {Integer (Int32)}
     */
    static VALUE_IS_FAKE => 32

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_IS_METHOD
     * @type {Integer (Int32)}
     */
    static VALUE_IS_METHOD => 256

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_IS_EVENT
     * @type {Integer (Int32)}
     */
    static VALUE_IS_EVENT => 512

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_IS_RAW_STRING
     * @type {Integer (Int32)}
     */
    static VALUE_IS_RAW_STRING => 1024

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_READONLY
     * @type {Integer (Int32)}
     */
    static VALUE_READONLY => 2048

    /**
     * Native name: DBGPROP_ATTRIB_ACCESS_PUBLIC
     * @type {Integer (Int32)}
     */
    static ACCESS_PUBLIC => 4096

    /**
     * Native name: DBGPROP_ATTRIB_ACCESS_PRIVATE
     * @type {Integer (Int32)}
     */
    static ACCESS_PRIVATE => 8192

    /**
     * Native name: DBGPROP_ATTRIB_ACCESS_PROTECTED
     * @type {Integer (Int32)}
     */
    static ACCESS_PROTECTED => 16384

    /**
     * Native name: DBGPROP_ATTRIB_ACCESS_FINAL
     * @type {Integer (Int32)}
     */
    static ACCESS_FINAL => 32768

    /**
     * Native name: DBGPROP_ATTRIB_STORAGE_GLOBAL
     * @type {Integer (Int32)}
     */
    static STORAGE_GLOBAL => 65536

    /**
     * Native name: DBGPROP_ATTRIB_STORAGE_STATIC
     * @type {Integer (Int32)}
     */
    static STORAGE_STATIC => 131072

    /**
     * Native name: DBGPROP_ATTRIB_STORAGE_FIELD
     * @type {Integer (Int32)}
     */
    static STORAGE_FIELD => 262144

    /**
     * Native name: DBGPROP_ATTRIB_STORAGE_VIRTUAL
     * @type {Integer (Int32)}
     */
    static STORAGE_VIRTUAL => 524288

    /**
     * Native name: DBGPROP_ATTRIB_TYPE_IS_CONSTANT
     * @type {Integer (Int32)}
     */
    static TYPE_IS_CONSTANT => 1048576

    /**
     * Native name: DBGPROP_ATTRIB_TYPE_IS_SYNCHRONIZED
     * @type {Integer (Int32)}
     */
    static TYPE_IS_SYNCHRONIZED => 2097152

    /**
     * Native name: DBGPROP_ATTRIB_TYPE_IS_VOLATILE
     * @type {Integer (Int32)}
     */
    static TYPE_IS_VOLATILE => 4194304

    /**
     * Native name: DBGPROP_ATTRIB_HAS_EXTENDED_ATTRIBS
     * @type {Integer (Int32)}
     */
    static HAS_EXTENDED_ATTRIBS => 8388608

    /**
     * Native name: DBGPROP_ATTRIB_FRAME_INTRYBLOCK
     * @type {Integer (Int32)}
     */
    static FRAME_INTRYBLOCK => 16777216

    /**
     * Native name: DBGPROP_ATTRIB_FRAME_INCATCHBLOCK
     * @type {Integer (Int32)}
     */
    static FRAME_INCATCHBLOCK => 33554432

    /**
     * Native name: DBGPROP_ATTRIB_FRAME_INFINALLYBLOCK
     * @type {Integer (Int32)}
     */
    static FRAME_INFINALLYBLOCK => 67108864

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_IS_RETURN_VALUE
     * @type {Integer (Int32)}
     */
    static VALUE_IS_RETURN_VALUE => 134217728

    /**
     * Native name: DBGPROP_ATTRIB_VALUE_PENDING_MUTATION
     * @type {Integer (Int32)}
     */
    static VALUE_PENDING_MUTATION => 268435456
}
