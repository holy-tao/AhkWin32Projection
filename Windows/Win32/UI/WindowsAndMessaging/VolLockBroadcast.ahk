#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEV_BROADCAST_HDR.ahk" { DEV_BROADCAST_HDR }
#Import ".\DEV_BROADCAST_HDR_DEVICE_TYPE.ahk" { DEV_BROADCAST_HDR_DEVICE_TYPE }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct VolLockBroadcast {
    #StructPack 4

    vlb_dbh : DEV_BROADCAST_HDR

    vlb_owner : UInt32

    vlb_perms : Int8

    vlb_lockType : Int8

    vlb_drive : Int8

    vlb_flags : Int8

}
