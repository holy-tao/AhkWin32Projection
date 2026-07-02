#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDMEMINFO.ahk" { VIDMEMINFO }
#Import ".\LPDDHAL_GETDRIVERINFO.ahk" { LPDDHAL_GETDRIVERINFO }
#Import ".\DDHAL_DDCALLBACKS.ahk" { DDHAL_DDCALLBACKS }
#Import ".\DDHALMODEINFO.ahk" { DDHALMODEINFO }
#Import ".\DDHAL_DDPALETTECALLBACKS.ahk" { DDHAL_DDPALETTECALLBACKS }
#Import ".\DDCORECAPS.ahk" { DDCORECAPS }
#Import ".\VIDMEM.ahk" { VIDMEM }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDHAL_DDSURFACECALLBACKS.ahk" { DDHAL_DDSURFACECALLBACKS }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\DDHAL_DDEXEBUFCALLBACKS.ahk" { DDHAL_DDEXEBUFCALLBACKS }

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

    GetDriverInfo : LPDDHAL_GETDRIVERINFO

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
