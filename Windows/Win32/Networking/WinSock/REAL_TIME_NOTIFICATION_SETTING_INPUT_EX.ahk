#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\TRANSPORT_SETTING_ID.ahk" { TRANSPORT_SETTING_ID }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct REAL_TIME_NOTIFICATION_SETTING_INPUT_EX {
    #StructPack 4

    TransportSettingId : TRANSPORT_SETTING_ID

    BrokerEventGuid : Guid

    Unmark : BOOLEAN

}
