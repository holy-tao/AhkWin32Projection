#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of a security identifier (SID).
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-sid_name_use
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SID_NAME_USE extends Win32Enum{

    /**
     * A user SID.
     * @type {Integer (Int32)}
     */
    static SidTypeUser => 1

    /**
     * A group SID.
     * @type {Integer (Int32)}
     */
    static SidTypeGroup => 2

    /**
     * A domain SID.
     * @type {Integer (Int32)}
     */
    static SidTypeDomain => 3

    /**
     * An alias SID.
     * @type {Integer (Int32)}
     */
    static SidTypeAlias => 4

    /**
     * A SID for a well-known group.
     * @type {Integer (Int32)}
     */
    static SidTypeWellKnownGroup => 5

    /**
     * A SID for a deleted account.
     * @type {Integer (Int32)}
     */
    static SidTypeDeletedAccount => 6

    /**
     * A SID that is not valid.
     * @type {Integer (Int32)}
     */
    static SidTypeInvalid => 7

    /**
     * A SID of unknown type.
     * @type {Integer (Int32)}
     */
    static SidTypeUnknown => 8

    /**
     * A SID for a computer.
     * @type {Integer (Int32)}
     */
    static SidTypeComputer => 9

    /**
     * A mandatory integrity label SID.
     * @type {Integer (Int32)}
     */
    static SidTypeLabel => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SidTypeLogonSession => 11
}
