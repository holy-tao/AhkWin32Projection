#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Beep
 */
export default struct BEEP_SET_PARAMETERS {
    #StructPack 4

    Frequency : UInt32

    Duration : UInt32

}
