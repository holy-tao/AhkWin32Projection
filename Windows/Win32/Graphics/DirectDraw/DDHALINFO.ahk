#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_DDSURFACECALLBACKS.ahk" { DDHAL_DDSURFACECALLBACKS }
#Import ".\DDHAL_DDEXEBUFCALLBACKS.ahk" { DDHAL_DDEXEBUFCALLBACKS }
#Import ".\VIDMEM.ahk" { VIDMEM }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\DDCORECAPS.ahk" { DDCORECAPS }
#Import ".\DDHALMODEINFO.ahk" { DDHALMODEINFO }
#Import ".\DDHAL_DDCALLBACKS.ahk" { DDHAL_DDCALLBACKS }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\VIDMEMINFO.ahk" { VIDMEMINFO }
#Import ".\DDHAL_DDPALETTECALLBACKS.ahk" { DDHAL_DDPALETTECALLBACKS }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHALINFO {
    #StructPack 8

    dwSize : UInt32

    lpDDCallbacks : DDHAL_DDCALLBACKS.Ptr

    lpDDSurfaceCallbacks : DDHAL_DDSURFACECALLBACKS.Ptr

    lpDDPaletteCallbacks : DDHAL_DDPALETTECALLBACKS.Ptr

    vmiData : VIDMEMINFO

    ddCaps : DDCORECAPS

    dwMonitorFrequency : UInt32

    GetDriverInfo : IntPtr

    dwModeIndex : UInt32

    lpdwFourCC : IntPtr

    dwNumModes : UInt32

    lpModeInfo : DDHALMODEINFO.Ptr

    dwFlags : UInt32

    lpPDevice : IntPtr

    hInstance : UInt32

    lpD3DGlobalDriverData : IntPtr

    lpD3DHALCallbacks : IntPtr

    lpDDExeBufCallbacks : DDHAL_DDEXEBUFCALLBACKS.Ptr

}
