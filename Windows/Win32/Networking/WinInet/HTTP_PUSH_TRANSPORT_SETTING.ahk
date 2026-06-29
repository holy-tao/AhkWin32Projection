#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_PUSH_TRANSPORT_SETTING {
    #StructPack 4

    TransportSettingId : Guid

    BrokerEventId : Guid

}
