#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DXGK_WIN32K_PARAM_DATA {
    #StructPack 8

    PathsArray : IntPtr

    ModesArray : IntPtr

    NumPathArrayElements : UInt32

    NumModeArrayElements : UInt32

    SDCFlags : UInt32

}
