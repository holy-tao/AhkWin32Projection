#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct INDIRECT_DISPLAY_INFO {
    #StructPack 4

    DisplayAdapterLuid : LUID

    Flags : UInt32

    NumMonitors : UInt32

    DisplayAdapterTargetBase : UInt32

    DriverVersionMajor : UInt32

    DriverVersionMinor : UInt32

}
