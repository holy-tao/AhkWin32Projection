#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEVICE_EVENT_RBC_DATA {
    #StructPack 4

    EventNumber : UInt32

    SenseQualifier : Int8

    SenseCode : Int8

    SenseKey : Int8

    Reserved : Int8

    Information : UInt32

}
