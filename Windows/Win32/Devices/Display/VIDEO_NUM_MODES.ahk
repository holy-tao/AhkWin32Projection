#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_NUM_MODES {
    #StructPack 4

    NumModes : UInt32

    ModeInformationLength : UInt32

}
