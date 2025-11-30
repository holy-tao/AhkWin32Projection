#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the SHVTEMPLATEPROPERTIES enumeration type enumerate the properties of a System Health Validator (SHV) template.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-shvtemplateproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class SHVTEMPLATEPROPERTIES extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_SHV_COMBINATION_TYPE => 1024

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_SHV_LIST => 1025

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_SHVCONFIG_LIST => 1026
}
