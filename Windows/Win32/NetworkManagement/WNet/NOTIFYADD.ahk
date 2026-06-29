#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NET_RESOURCE_TYPE.ahk" { NET_RESOURCE_TYPE }
#Import ".\NET_RESOURCE_SCOPE.ahk" { NET_RESOURCE_SCOPE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NET_CONNECT_FLAGS.ahk" { NET_CONNECT_FLAGS }
#Import ".\NETRESOURCEA.ahk" { NETRESOURCEA }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The NOTIFYADD structure contains the details of a network connect operation. It is used by the AddConnectNotify function.
 * @see https://learn.microsoft.com/windows/win32/api/npapi/ns-npapi-notifyadd
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct NOTIFYADD {
    #StructPack 8

    /**
     * A handle to a window which should own any messages or dialog boxes the application receiving the notification might display.
     */
    hwndOwner : HWND

    /**
     * Specifies the network resource to connect to. The valid fields are the same as for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npaddconnection">NPAddConnection</a> function.
     */
    NetResource : NETRESOURCEA

    dwAddFlags : NET_CONNECT_FLAGS

}
