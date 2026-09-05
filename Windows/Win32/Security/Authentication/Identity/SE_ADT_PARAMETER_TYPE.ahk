#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SE_ADT_PARAMETER_TYPE extends Win32Enum {

    /**
     * Native name: SeAdtParmTypeNone
     * @type {Integer (Int32)}
     */
    static ParmTypeNone => 0

    /**
     * Native name: SeAdtParmTypeString
     * @type {Integer (Int32)}
     */
    static ParmTypeString => 1

    /**
     * Native name: SeAdtParmTypeFileSpec
     * @type {Integer (Int32)}
     */
    static ParmTypeFileSpec => 2

    /**
     * Native name: SeAdtParmTypeUlong
     * @type {Integer (Int32)}
     */
    static ParmTypeUlong => 3

    /**
     * Native name: SeAdtParmTypeSid
     * @type {Integer (Int32)}
     */
    static ParmTypeSid => 4

    /**
     * Native name: SeAdtParmTypeLogonId
     * @type {Integer (Int32)}
     */
    static ParmTypeLogonId => 5

    /**
     * Native name: SeAdtParmTypeNoLogonId
     * @type {Integer (Int32)}
     */
    static ParmTypeNoLogonId => 6

    /**
     * Native name: SeAdtParmTypeAccessMask
     * @type {Integer (Int32)}
     */
    static ParmTypeAccessMask => 7

    /**
     * Native name: SeAdtParmTypePrivs
     * @type {Integer (Int32)}
     */
    static ParmTypePrivs => 8

    /**
     * Native name: SeAdtParmTypeObjectTypes
     * @type {Integer (Int32)}
     */
    static ParmTypeObjectTypes => 9

    /**
     * Native name: SeAdtParmTypeHexUlong
     * @type {Integer (Int32)}
     */
    static ParmTypeHexUlong => 10

    /**
     * Native name: SeAdtParmTypePtr
     * @type {Integer (Int32)}
     */
    static ParmTypePtr => 11

    /**
     * Native name: SeAdtParmTypeTime
     * @type {Integer (Int32)}
     */
    static ParmTypeTime => 12

    /**
     * Native name: SeAdtParmTypeGuid
     * @type {Integer (Int32)}
     */
    static ParmTypeGuid => 13

    /**
     * Native name: SeAdtParmTypeLuid
     * @type {Integer (Int32)}
     */
    static ParmTypeLuid => 14

    /**
     * Native name: SeAdtParmTypeHexInt64
     * @type {Integer (Int32)}
     */
    static ParmTypeHexInt64 => 15

    /**
     * Native name: SeAdtParmTypeStringList
     * @type {Integer (Int32)}
     */
    static ParmTypeStringList => 16

    /**
     * Native name: SeAdtParmTypeSidList
     * @type {Integer (Int32)}
     */
    static ParmTypeSidList => 17

    /**
     * Native name: SeAdtParmTypeDuration
     * @type {Integer (Int32)}
     */
    static ParmTypeDuration => 18

    /**
     * Native name: SeAdtParmTypeUserAccountControl
     * @type {Integer (Int32)}
     */
    static ParmTypeUserAccountControl => 19

    /**
     * Native name: SeAdtParmTypeNoUac
     * @type {Integer (Int32)}
     */
    static ParmTypeNoUac => 20

    /**
     * Native name: SeAdtParmTypeMessage
     * @type {Integer (Int32)}
     */
    static ParmTypeMessage => 21

    /**
     * Native name: SeAdtParmTypeDateTime
     * @type {Integer (Int32)}
     */
    static ParmTypeDateTime => 22

    /**
     * Native name: SeAdtParmTypeSockAddr
     * @type {Integer (Int32)}
     */
    static ParmTypeSockAddr => 23

    /**
     * Native name: SeAdtParmTypeSD
     * @type {Integer (Int32)}
     */
    static ParmTypeSD => 24

    /**
     * Native name: SeAdtParmTypeLogonHours
     * @type {Integer (Int32)}
     */
    static ParmTypeLogonHours => 25

    /**
     * Native name: SeAdtParmTypeLogonIdNoSid
     * @type {Integer (Int32)}
     */
    static ParmTypeLogonIdNoSid => 26

    /**
     * Native name: SeAdtParmTypeUlongNoConv
     * @type {Integer (Int32)}
     */
    static ParmTypeUlongNoConv => 27

    /**
     * Native name: SeAdtParmTypeSockAddrNoPort
     * @type {Integer (Int32)}
     */
    static ParmTypeSockAddrNoPort => 28

    /**
     * Native name: SeAdtParmTypeAccessReason
     * @type {Integer (Int32)}
     */
    static ParmTypeAccessReason => 29

    /**
     * Native name: SeAdtParmTypeStagingReason
     * @type {Integer (Int32)}
     */
    static ParmTypeStagingReason => 30

    /**
     * Native name: SeAdtParmTypeResourceAttribute
     * @type {Integer (Int32)}
     */
    static ParmTypeResourceAttribute => 31

    /**
     * Native name: SeAdtParmTypeClaims
     * @type {Integer (Int32)}
     */
    static ParmTypeClaims => 32

    /**
     * Native name: SeAdtParmTypeLogonIdAsSid
     * @type {Integer (Int32)}
     */
    static ParmTypeLogonIdAsSid => 33

    /**
     * Native name: SeAdtParmTypeMultiSzString
     * @type {Integer (Int32)}
     */
    static ParmTypeMultiSzString => 34

    /**
     * Native name: SeAdtParmTypeLogonIdEx
     * @type {Integer (Int32)}
     */
    static ParmTypeLogonIdEx => 35
}
