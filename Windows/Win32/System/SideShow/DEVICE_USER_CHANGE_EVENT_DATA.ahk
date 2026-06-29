#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct DEVICE_USER_CHANGE_EVENT_DATA {
    #StructPack 4

    cbDeviceUserChangeEventData : UInt32

    wszUser : Int8

}
