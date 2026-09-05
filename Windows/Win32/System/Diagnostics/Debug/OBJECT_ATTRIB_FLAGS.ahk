#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class OBJECT_ATTRIB_FLAGS extends Win32Enum {

    /**
     * Native name: OBJECT_ATTRIB_NO_ATTRIB
     * @type {Integer (Int32)}
     */
    static NO_ATTRIB => 0

    /**
     * Native name: OBJECT_ATTRIB_NO_NAME
     * @type {Integer (Int32)}
     */
    static NO_NAME => 1

    /**
     * Native name: OBJECT_ATTRIB_NO_TYPE
     * @type {Integer (Int32)}
     */
    static NO_TYPE => 2

    /**
     * Native name: OBJECT_ATTRIB_NO_VALUE
     * @type {Integer (Int32)}
     */
    static NO_VALUE => 4

    /**
     * Native name: OBJECT_ATTRIB_VALUE_IS_INVALID
     * @type {Integer (Int32)}
     */
    static VALUE_IS_INVALID => 8

    /**
     * Native name: OBJECT_ATTRIB_VALUE_IS_OBJECT
     * @type {Integer (Int32)}
     */
    static VALUE_IS_OBJECT => 16

    /**
     * Native name: OBJECT_ATTRIB_VALUE_IS_ENUM
     * @type {Integer (Int32)}
     */
    static VALUE_IS_ENUM => 32

    /**
     * Native name: OBJECT_ATTRIB_VALUE_IS_CUSTOM
     * @type {Integer (Int32)}
     */
    static VALUE_IS_CUSTOM => 64

    /**
     * Native name: OBJECT_ATTRIB_OBJECT_IS_EXPANDABLE
     * @type {Integer (Int32)}
     */
    static OBJECT_IS_EXPANDABLE => 112

    /**
     * Native name: OBJECT_ATTRIB_VALUE_HAS_CODE
     * @type {Integer (Int32)}
     */
    static VALUE_HAS_CODE => 128

    /**
     * Native name: OBJECT_ATTRIB_TYPE_IS_OBJECT
     * @type {Integer (Int32)}
     */
    static TYPE_IS_OBJECT => 256

    /**
     * Native name: OBJECT_ATTRIB_TYPE_HAS_CODE
     * @type {Integer (Int32)}
     */
    static TYPE_HAS_CODE => 512

    /**
     * Native name: OBJECT_ATTRIB_TYPE_IS_EXPANDABLE
     * @type {Integer (Int32)}
     */
    static TYPE_IS_EXPANDABLE => 256

    /**
     * Native name: OBJECT_ATTRIB_SLOT_IS_CATEGORY
     * @type {Integer (Int32)}
     */
    static SLOT_IS_CATEGORY => 1024

    /**
     * Native name: OBJECT_ATTRIB_VALUE_READONLY
     * @type {Integer (Int32)}
     */
    static VALUE_READONLY => 2048

    /**
     * Native name: OBJECT_ATTRIB_ACCESS_PUBLIC
     * @type {Integer (Int32)}
     */
    static ACCESS_PUBLIC => 4096

    /**
     * Native name: OBJECT_ATTRIB_ACCESS_PRIVATE
     * @type {Integer (Int32)}
     */
    static ACCESS_PRIVATE => 8192

    /**
     * Native name: OBJECT_ATTRIB_ACCESS_PROTECTED
     * @type {Integer (Int32)}
     */
    static ACCESS_PROTECTED => 16384

    /**
     * Native name: OBJECT_ATTRIB_ACCESS_FINAL
     * @type {Integer (Int32)}
     */
    static ACCESS_FINAL => 32768

    /**
     * Native name: OBJECT_ATTRIB_STORAGE_GLOBAL
     * @type {Integer (Int32)}
     */
    static STORAGE_GLOBAL => 65536

    /**
     * Native name: OBJECT_ATTRIB_STORAGE_STATIC
     * @type {Integer (Int32)}
     */
    static STORAGE_STATIC => 131072

    /**
     * Native name: OBJECT_ATTRIB_STORAGE_FIELD
     * @type {Integer (Int32)}
     */
    static STORAGE_FIELD => 262144

    /**
     * Native name: OBJECT_ATTRIB_STORAGE_VIRTUAL
     * @type {Integer (Int32)}
     */
    static STORAGE_VIRTUAL => 524288

    /**
     * Native name: OBJECT_ATTRIB_TYPE_IS_CONSTANT
     * @type {Integer (Int32)}
     */
    static TYPE_IS_CONSTANT => 1048576

    /**
     * Native name: OBJECT_ATTRIB_TYPE_IS_SYNCHRONIZED
     * @type {Integer (Int32)}
     */
    static TYPE_IS_SYNCHRONIZED => 2097152

    /**
     * Native name: OBJECT_ATTRIB_TYPE_IS_VOLATILE
     * @type {Integer (Int32)}
     */
    static TYPE_IS_VOLATILE => 4194304

    /**
     * Native name: OBJECT_ATTRIB_HAS_EXTENDED_ATTRIBS
     * @type {Integer (Int32)}
     */
    static HAS_EXTENDED_ATTRIBS => 8388608

    /**
     * Native name: OBJECT_ATTRIB_IS_CLASS
     * @type {Integer (Int32)}
     */
    static IS_CLASS => 16777216

    /**
     * Native name: OBJECT_ATTRIB_IS_FUNCTION
     * @type {Integer (Int32)}
     */
    static IS_FUNCTION => 33554432

    /**
     * Native name: OBJECT_ATTRIB_IS_VARIABLE
     * @type {Integer (Int32)}
     */
    static IS_VARIABLE => 67108864

    /**
     * Native name: OBJECT_ATTRIB_IS_PROPERTY
     * @type {Integer (Int32)}
     */
    static IS_PROPERTY => 134217728

    /**
     * Native name: OBJECT_ATTRIB_IS_MACRO
     * @type {Integer (Int32)}
     */
    static IS_MACRO => 268435456

    /**
     * Native name: OBJECT_ATTRIB_IS_TYPE
     * @type {Integer (Int32)}
     */
    static IS_TYPE => 536870912

    /**
     * Native name: OBJECT_ATTRIB_IS_INHERITED
     * @type {Integer (Int32)}
     */
    static IS_INHERITED => 1073741824

    /**
     * Native name: OBJECT_ATTRIB_IS_INTERFACE
     * @type {Integer (Int32)}
     */
    static IS_INTERFACE => -2147483648
}
