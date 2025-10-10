#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the NAMESPROPERTIES enumeration type enumerate properties related to the name of the user requesting network access.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-namesproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class NAMESPROPERTIES{

    /**
     * <b>Note</b>  Specifies a set of "search text" and "replacement text" pairs in a <b>VARIANT</b> array. This is the equivalent of attribute manipulation in Windows XP. More documentation on the Realms functionality and the use of regular expressions is included in the online help for IAS.
     * @type {Integer (Int32)}
     */
    static PROPERTY_NAMES_REALMS => 1026
}
