#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of information requested about a Safer object.
 * @remarks
 * The <b>SAFER_OBJECT_INFO_CLASS</b> enumeration type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-safergetlevelinformation">SaferGetLevelInformation</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ne-winsafer-safer_object_info_class
 * @namespace Windows.Win32.Security.AppLocker
 */
class SAFER_OBJECT_INFO_CLASS extends Win32Enum {

    /**
     * Queries for the LEVELID constant.
     * Native name: SaferObjectLevelId
     * @type {Integer (Int32)}
     */
    static LevelId => 1

    /**
     * Queries for the user or machine scope.
     * Native name: SaferObjectScopeId
     * @type {Integer (Int32)}
     */
    static ScopeId => 2

    /**
     * Queries for the display name.
     * Native name: SaferObjectFriendlyName
     * @type {Integer (Int32)}
     */
    static FriendlyName => 3

    /**
     * Queries for the description.
     * Native name: SaferObjectDescription
     * @type {Integer (Int32)}
     */
    static Description => 4

    /**
     * Native name: SaferObjectBuiltin
     * @type {Integer (Int32)}
     */
    static Builtin => 5

    /**
     * Native name: SaferObjectDisallowed
     * @type {Integer (Int32)}
     */
    static Disallowed => 6

    /**
     * Native name: SaferObjectDisableMaxPrivilege
     * @type {Integer (Int32)}
     */
    static DisableMaxPrivilege => 7

    /**
     * Native name: SaferObjectInvertDeletedPrivileges
     * @type {Integer (Int32)}
     */
    static InvertDeletedPrivileges => 8

    /**
     * Native name: SaferObjectDeletedPrivileges
     * @type {Integer (Int32)}
     */
    static DeletedPrivileges => 9

    /**
     * Native name: SaferObjectDefaultOwner
     * @type {Integer (Int32)}
     */
    static DefaultOwner => 10

    /**
     * Native name: SaferObjectSidsToDisable
     * @type {Integer (Int32)}
     */
    static SidsToDisable => 11

    /**
     * Native name: SaferObjectRestrictedSidsInverted
     * @type {Integer (Int32)}
     */
    static RestrictedSidsInverted => 12

    /**
     * Native name: SaferObjectRestrictedSidsAdded
     * @type {Integer (Int32)}
     */
    static RestrictedSidsAdded => 13

    /**
     * Queries for all levels.
     * Native name: SaferObjectAllIdentificationGuids
     * @type {Integer (Int32)}
     */
    static AllIdentificationGuids => 14

    /**
     * Queries for a single additional rule.
     * Native name: SaferObjectSingleIdentification
     * @type {Integer (Int32)}
     */
    static SingleIdentification => 15

    /**
     * Queries for additional error codes set during rule processing.
     * Native name: SaferObjectExtendedError
     * @type {Integer (Int32)}
     */
    static ExtendedError => 16
}
