#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct APPLICATIONLAUNCH_SETTING_VALUE {
    #StructPack 8

    ActivationTime : Int64

    Flags : UInt32

    ButtonInstanceID : UInt32

}
