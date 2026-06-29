#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the NAMESPROPERTIES enumeration type enumerate properties related to the name of the user requesting network access.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-namesproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct NAMESPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * <b>Note</b>  Specifies a set of "search text" and "replacement text" pairs in a <b>VARIANT</b> array. This is the equivalent of attribute manipulation in Windows XP. More documentation on the Realms functionality and the use of regular expressions is included in the online help for IAS.
     * @type {Integer (Int32)}
     */
    static PROPERTY_NAMES_REALMS => 1026
}
