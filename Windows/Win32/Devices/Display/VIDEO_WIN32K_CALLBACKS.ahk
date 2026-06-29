#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_WIN32K_CALLBACKS {
    #StructPack 8

    PhysDisp : IntPtr

    Callout : IntPtr

    bACPI : UInt32

    pPhysDeviceObject : HANDLE

    DualviewFlags : UInt32

}
