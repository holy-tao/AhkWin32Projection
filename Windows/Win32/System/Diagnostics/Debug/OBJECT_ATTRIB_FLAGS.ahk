#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class OBJECT_ATTRIB_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_NO_ATTRIB => 0

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_NO_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_NO_TYPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_NO_VALUE => 4

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_VALUE_IS_INVALID => 8

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_VALUE_IS_OBJECT => 16

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_VALUE_IS_ENUM => 32

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_VALUE_IS_CUSTOM => 64

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_OBJECT_IS_EXPANDABLE => 112

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_VALUE_HAS_CODE => 128

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_TYPE_IS_OBJECT => 256

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_TYPE_HAS_CODE => 512

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_TYPE_IS_EXPANDABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_SLOT_IS_CATEGORY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_VALUE_READONLY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_ACCESS_PUBLIC => 4096

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_ACCESS_PRIVATE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_ACCESS_PROTECTED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_ACCESS_FINAL => 32768

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_STORAGE_GLOBAL => 65536

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_STORAGE_STATIC => 131072

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_STORAGE_FIELD => 262144

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_STORAGE_VIRTUAL => 524288

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_TYPE_IS_CONSTANT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_TYPE_IS_SYNCHRONIZED => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_TYPE_IS_VOLATILE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_HAS_EXTENDED_ATTRIBS => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_IS_CLASS => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_IS_FUNCTION => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_IS_VARIABLE => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_IS_PROPERTY => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_IS_MACRO => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_IS_TYPE => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_IS_INHERITED => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ATTRIB_IS_INTERFACE => -2147483648
}
