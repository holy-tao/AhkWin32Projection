#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of a security identifier (SID).
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-sid_name_use
 * @namespace Windows.Win32.Security
 */
class SID_NAME_USE extends Win32Enum {

    /**
     * A user SID.
     * Native name: SidTypeUser
     * @type {Integer (Int32)}
     */
    static TypeUser => 1

    /**
     * A group SID.
     * Native name: SidTypeGroup
     * @type {Integer (Int32)}
     */
    static TypeGroup => 2

    /**
     * A domain SID.
     * Native name: SidTypeDomain
     * @type {Integer (Int32)}
     */
    static TypeDomain => 3

    /**
     * An alias SID.
     * Native name: SidTypeAlias
     * @type {Integer (Int32)}
     */
    static TypeAlias => 4

    /**
     * A SID for a well-known group.
     * Native name: SidTypeWellKnownGroup
     * @type {Integer (Int32)}
     */
    static TypeWellKnownGroup => 5

    /**
     * A SID for a deleted account.
     * Native name: SidTypeDeletedAccount
     * @type {Integer (Int32)}
     */
    static TypeDeletedAccount => 6

    /**
     * A SID that is not valid.
     * Native name: SidTypeInvalid
     * @type {Integer (Int32)}
     */
    static TypeInvalid => 7

    /**
     * A SID of unknown type.
     * Native name: SidTypeUnknown
     * @type {Integer (Int32)}
     */
    static TypeUnknown => 8

    /**
     * A SID for a computer.
     * Native name: SidTypeComputer
     * @type {Integer (Int32)}
     */
    static TypeComputer => 9

    /**
     * A mandatory integrity label SID.
     * Native name: SidTypeLabel
     * @type {Integer (Int32)}
     */
    static TypeLabel => 10

    /**
     * Native name: SidTypeLogonSession
     * @type {Integer (Int32)}
     */
    static TypeLogonSession => 11
}
