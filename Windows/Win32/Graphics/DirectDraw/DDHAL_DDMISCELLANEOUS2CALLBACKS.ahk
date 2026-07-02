#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPDDHAL_CREATESURFACEEX.ahk" { LPDDHAL_CREATESURFACEEX }
#Import ".\LPDDHAL_GETDRIVERSTATE.ahk" { LPDDHAL_GETDRIVERSTATE }
#Import ".\LPDDHAL_DESTROYDDLOCAL.ahk" { LPDDHAL_DESTROYDDLOCAL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDMISCELLANEOUS2CALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    Reserved : IntPtr

    CreateSurfaceEx : LPDDHAL_CREATESURFACEEX

    GetDriverState : LPDDHAL_GETDRIVERSTATE

    DestroyDDLocal : LPDDHAL_DESTROYDDLOCAL

}
