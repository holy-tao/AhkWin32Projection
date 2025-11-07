#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of information requested about a Safer object.
 * @remarks
 * 
 * The <b>SAFER_OBJECT_INFO_CLASS</b> enumeration type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-safergetlevelinformation">SaferGetLevelInformation</a> function.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsafer/ne-winsafer-safer_object_info_class
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_OBJECT_INFO_CLASS{

    /**
     * Queries for the LEVELID constant.
     * @type {Integer (Int32)}
     */
    static SaferObjectLevelId => 1

    /**
     * Queries for the user or machine scope.
     * @type {Integer (Int32)}
     */
    static SaferObjectScopeId => 2

    /**
     * Queries for the display name.
     * @type {Integer (Int32)}
     */
    static SaferObjectFriendlyName => 3

    /**
     * Queries for the description.
     * @type {Integer (Int32)}
     */
    static SaferObjectDescription => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectBuiltin => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectDisallowed => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectDisableMaxPrivilege => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectInvertDeletedPrivileges => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectDeletedPrivileges => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectDefaultOwner => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectSidsToDisable => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectRestrictedSidsInverted => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferObjectRestrictedSidsAdded => 13

    /**
     * Queries for all levels.
     * @type {Integer (Int32)}
     */
    static SaferObjectAllIdentificationGuids => 14

    /**
     * Queries for a single additional rule.
     * @type {Integer (Int32)}
     */
    static SaferObjectSingleIdentification => 15

    /**
     * Queries for additional error codes set during rule processing.
     * @type {Integer (Int32)}
     */
    static SaferObjectExtendedError => 16
}
