#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct STINOTIFY {
    #StructPack 4

    dwSize : UInt32

    guidNotificationCode : Guid

    abNotificationData : Int8[64]

}
