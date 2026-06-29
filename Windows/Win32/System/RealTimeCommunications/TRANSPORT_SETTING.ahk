#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Networking\WinSock\TRANSPORT_SETTING_ID.ahk" { TRANSPORT_SETTING_ID }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct TRANSPORT_SETTING {
    #StructPack 8

    SettingId : TRANSPORT_SETTING_ID

    Length : IntPtr

    Value : IntPtr

}
