#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEVPROP_OPERATOR extends Win32BitflagEnum {

    /**
     * Native name: DEVPROP_OPERATOR_MODIFIER_NOT
     * @type {Integer (UInt32)}
     */
    static MODIFIER_NOT => 65536

    /**
     * Native name: DEVPROP_OPERATOR_MODIFIER_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static MODIFIER_IGNORE_CASE => 131072

    /**
     * Native name: DEVPROP_OPERATOR_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: DEVPROP_OPERATOR_EXISTS
     * @type {Integer (UInt32)}
     */
    static EXISTS => 1

    /**
     * Native name: DEVPROP_OPERATOR_NOT_EXISTS
     * @type {Integer (UInt32)}
     */
    static NOT_EXISTS => 65537

    /**
     * Native name: DEVPROP_OPERATOR_EQUALS
     * @type {Integer (UInt32)}
     */
    static EQUALS => 2

    /**
     * Native name: DEVPROP_OPERATOR_NOT_EQUALS
     * @type {Integer (UInt32)}
     */
    static NOT_EQUALS => 65538

    /**
     * Native name: DEVPROP_OPERATOR_GREATER_THAN
     * @type {Integer (UInt32)}
     */
    static GREATER_THAN => 3

    /**
     * Native name: DEVPROP_OPERATOR_LESS_THAN
     * @type {Integer (UInt32)}
     */
    static LESS_THAN => 4

    /**
     * Native name: DEVPROP_OPERATOR_GREATER_THAN_EQUALS
     * @type {Integer (UInt32)}
     */
    static GREATER_THAN_EQUALS => 5

    /**
     * Native name: DEVPROP_OPERATOR_LESS_THAN_EQUALS
     * @type {Integer (UInt32)}
     */
    static LESS_THAN_EQUALS => 6

    /**
     * Native name: DEVPROP_OPERATOR_EQUALS_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static EQUALS_IGNORE_CASE => 131074

    /**
     * Native name: DEVPROP_OPERATOR_NOT_EQUALS_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static NOT_EQUALS_IGNORE_CASE => 196610

    /**
     * Native name: DEVPROP_OPERATOR_BITWISE_AND
     * @type {Integer (UInt32)}
     */
    static BITWISE_AND => 7

    /**
     * Native name: DEVPROP_OPERATOR_BITWISE_OR
     * @type {Integer (UInt32)}
     */
    static BITWISE_OR => 8

    /**
     * Native name: DEVPROP_OPERATOR_BEGINS_WITH
     * @type {Integer (UInt32)}
     */
    static BEGINS_WITH => 9

    /**
     * Native name: DEVPROP_OPERATOR_ENDS_WITH
     * @type {Integer (UInt32)}
     */
    static ENDS_WITH => 10

    /**
     * Native name: DEVPROP_OPERATOR_CONTAINS
     * @type {Integer (UInt32)}
     */
    static CONTAINS => 11

    /**
     * Native name: DEVPROP_OPERATOR_BEGINS_WITH_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static BEGINS_WITH_IGNORE_CASE => 131081

    /**
     * Native name: DEVPROP_OPERATOR_ENDS_WITH_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static ENDS_WITH_IGNORE_CASE => 131082

    /**
     * Native name: DEVPROP_OPERATOR_CONTAINS_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static CONTAINS_IGNORE_CASE => 131083

    /**
     * Native name: DEVPROP_OPERATOR_LIST_CONTAINS
     * @type {Integer (UInt32)}
     */
    static LIST_CONTAINS => 4096

    /**
     * Native name: DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH
     * @type {Integer (UInt32)}
     */
    static LIST_ELEMENT_BEGINS_WITH => 8192

    /**
     * Native name: DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH
     * @type {Integer (UInt32)}
     */
    static LIST_ELEMENT_ENDS_WITH => 12288

    /**
     * Native name: DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS
     * @type {Integer (UInt32)}
     */
    static LIST_ELEMENT_CONTAINS => 16384

    /**
     * Native name: DEVPROP_OPERATOR_LIST_CONTAINS_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static LIST_CONTAINS_IGNORE_CASE => 135168

    /**
     * Native name: DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static LIST_ELEMENT_BEGINS_WITH_IGNORE_CASE => 139264

    /**
     * Native name: DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static LIST_ELEMENT_ENDS_WITH_IGNORE_CASE => 143360

    /**
     * Native name: DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS_IGNORE_CASE
     * @type {Integer (UInt32)}
     */
    static LIST_ELEMENT_CONTAINS_IGNORE_CASE => 147456

    /**
     * Native name: DEVPROP_OPERATOR_AND_OPEN
     * @type {Integer (UInt32)}
     */
    static AND_OPEN => 1048576

    /**
     * Native name: DEVPROP_OPERATOR_AND_CLOSE
     * @type {Integer (UInt32)}
     */
    static AND_CLOSE => 2097152

    /**
     * Native name: DEVPROP_OPERATOR_OR_OPEN
     * @type {Integer (UInt32)}
     */
    static OR_OPEN => 3145728

    /**
     * Native name: DEVPROP_OPERATOR_OR_CLOSE
     * @type {Integer (UInt32)}
     */
    static OR_CLOSE => 4194304

    /**
     * Native name: DEVPROP_OPERATOR_NOT_OPEN
     * @type {Integer (UInt32)}
     */
    static NOT_OPEN => 5242880

    /**
     * Native name: DEVPROP_OPERATOR_NOT_CLOSE
     * @type {Integer (UInt32)}
     */
    static NOT_CLOSE => 6291456

    /**
     * Native name: DEVPROP_OPERATOR_ARRAY_CONTAINS
     * @type {Integer (UInt32)}
     */
    static ARRAY_CONTAINS => 268435456

    /**
     * Native name: DEVPROP_OPERATOR_MASK_EVAL
     * @type {Integer (UInt32)}
     */
    static MASK_EVAL => 4095

    /**
     * Native name: DEVPROP_OPERATOR_MASK_LIST
     * @type {Integer (UInt32)}
     */
    static MASK_LIST => 61440

    /**
     * Native name: DEVPROP_OPERATOR_MASK_MODIFIER
     * @type {Integer (UInt32)}
     */
    static MASK_MODIFIER => 983040

    /**
     * Native name: DEVPROP_OPERATOR_MASK_NOT_LOGICAL
     * @type {Integer (UInt32)}
     */
    static MASK_NOT_LOGICAL => 4027580415

    /**
     * Native name: DEVPROP_OPERATOR_MASK_LOGICAL
     * @type {Integer (UInt32)}
     */
    static MASK_LOGICAL => 267386880

    /**
     * Native name: DEVPROP_OPERATOR_MASK_ARRAY
     * @type {Integer (UInt32)}
     */
    static MASK_ARRAY => 4026531840
}
