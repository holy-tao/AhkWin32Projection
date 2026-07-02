#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\PVIDEO_WIN32K_CALLOUT.ahk" { PVIDEO_WIN32K_CALLOUT }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_WIN32K_CALLBACKS {
    #StructPack 8

    PhysDisp : IntPtr

    Callout : PVIDEO_WIN32K_CALLOUT

    bACPI : UInt32

    pPhysDeviceObject : HANDLE

    DualviewFlags : UInt32

}
