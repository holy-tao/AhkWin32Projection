#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NETCON_MEDIATYPE.ahk" { NETCON_MEDIATYPE }
#Import ".\NETCON_STATUS.ahk" { NETCON_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The NETCON_PROPERTIES structure stores values that describe the properties of a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/ns-netcon-netcon_properties
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NETCON_PROPERTIES {
    #StructPack 8

    /**
     * Globally-unique identifier (GUID) for this connection.
     */
    guidId : Guid

    /**
     * Name of the connection itself.
     */
    pszwName : PWSTR

    /**
     * Name of the device associated with the connection.
     */
    pszwDeviceName : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_status">Current status</a> of the connection.
     */
    Status : NETCON_STATUS

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_mediatype">Media type</a> associated with this connection.
     */
    MediaType : NETCON_MEDIATYPE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_characteristic_flags">Characteristics</a> for this connection.
     */
    dwCharacter : UInt32

    /**
     * Class identifier for the connection object.
     */
    clsidThisObject : Guid

    /**
     * Class identifier for the user-interface object.
     */
    clsidUiObject : Guid

}
