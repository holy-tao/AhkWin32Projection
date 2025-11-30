#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class DEVPROP_OPERATOR extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_MODIFIER_NOT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_MODIFIER_IGNORE_CASE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_NOT_EXISTS => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_EQUALS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_NOT_EQUALS => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_GREATER_THAN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LESS_THAN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_GREATER_THAN_EQUALS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LESS_THAN_EQUALS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_EQUALS_IGNORE_CASE => 131074

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_NOT_EQUALS_IGNORE_CASE => 196610

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_BITWISE_AND => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_BITWISE_OR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_BEGINS_WITH => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_ENDS_WITH => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_CONTAINS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_BEGINS_WITH_IGNORE_CASE => 131081

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_ENDS_WITH_IGNORE_CASE => 131082

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_CONTAINS_IGNORE_CASE => 131083

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LIST_CONTAINS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LIST_CONTAINS_IGNORE_CASE => 135168

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH_IGNORE_CASE => 139264

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH_IGNORE_CASE => 143360

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS_IGNORE_CASE => 147456

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_AND_OPEN => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_AND_CLOSE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_OR_OPEN => 3145728

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_OR_CLOSE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_NOT_OPEN => 5242880

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_NOT_CLOSE => 6291456

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_ARRAY_CONTAINS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_MASK_EVAL => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_MASK_LIST => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_MASK_MODIFIER => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_MASK_NOT_LOGICAL => 4027580415

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_MASK_LOGICAL => 267386880

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_OPERATOR_MASK_ARRAY => 4026531840
}
