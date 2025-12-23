#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ADDRESS_CAPABILITY_STRING enum is used to check on address capabilities which are described by strings.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-address_capability_string
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ADDRESS_CAPABILITY_STRING extends Win32Enum{

    /**
     * Describes a protocol-specific capability. The value is returned as a GUID in string format. For possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapiprotocol--constants">TAPIPROTOCOL_</a>. A TSP may define additional values. Corresponds to the <b>ProtocolGuid</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static ACS_PROTOCOL => 0

    /**
     * Describes an address device-specific capability. The value is TSP dependent and can be a structure, a string, or some other type. An application should use the <b>BSTR</b> pointer received from Tapi3.dll as a pointer to an array of bytes (a buffer), and then interpret the buffer according to TSP specifications. Corresponds to the <b>dwDevSpecific</b> and <b>dwDevSpecificSize</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineaddresscaps">LINEADDRESSCAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static ACS_ADDRESSDEVICESPECIFIC => 1

    /**
     * Describes a line device-specific capability. The value is TSP dependent and can be a structure, a string, or some other type. An application should use the <b>BSTR</b> pointer received from Tapi3.dll as a pointer to an array of bytes (a buffer), and then interpret the buffer according to TSP specifications. Corresponds to the <b>dwDevSpecific</b> and <b>dwDevSpecificSize</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static ACS_LINEDEVICESPECIFIC => 2

    /**
     * Describes a provider-specific capability. The value is a plain string. It can be used with regular <b>BSTR</b> functions for operations such as printing and concatenating. A specific TSP might included embedded <b>NULL</b> characters inside these strings. If so, an application should take care when printing the value. If the embedded <b>NULL</b> characters are not replaced with blanks, the strings will appear truncated when printed. Corresponds to the <b>dwProviderInfoSize</b> and <b>dwProviderInfoOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static ACS_PROVIDERSPECIFIC => 3

    /**
     * Describes a switch-specific capability. The value is a plain string. It can be used with regular <b>BSTR</b> functions for operations such as printing and concatenating. A specific TSP might included embedded <b>NULL</b> characters inside these strings. If so, an application should take care when printing the value. If the embedded <b>NULL</b> characters are not replaced with blanks, the strings will appear truncated when printed. Corresponds to the <b>dwSwitchInfoSize</b> and <b>dwSwitchInfoOffset</b> members of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static ACS_SWITCHSPECIFIC => 4

    /**
     * Describes the GUID of a permanent device. The value is returned as a GUID in string format. This identifier must remain stable throughout, including operating system upgrades. Corresponds to the <b>PermanentLineGuid</b> member of TAPI 2's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static ACS_PERMANENTDEVICEGUID => 5
}
