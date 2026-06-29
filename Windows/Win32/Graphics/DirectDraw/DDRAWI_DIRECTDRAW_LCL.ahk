#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_CALLBACKS.ahk" { DDHAL_CALLBACKS }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DDRAWI_DDRAWSURFACE_INT.ahk" { DDRAWI_DDRAWSURFACE_INT }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DIRECTDRAW_LCL {
    #StructPack 8

    lpDDMore : UInt32

    __lpGbl_ptr : IntPtr
    lpGbl {
        get => (addr := this.__lpGbl_ptr) ? DDRAWI_DIRECTDRAW_GBL.At(addr) : unset
        set => this.__lpGbl_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwUnused0 : UInt32

    dwLocalFlags : UInt32

    dwLocalRefCnt : UInt32

    dwProcessId : UInt32

    pUnkOuter : IUnknown

    dwObsolete1 : UInt32

    hWnd : IntPtr

    hDC : IntPtr

    dwErrorMode : UInt32

    __lpPrimary_ptr : IntPtr
    lpPrimary {
        get => (addr := this.__lpPrimary_ptr) ? DDRAWI_DDRAWSURFACE_INT.At(addr) : unset
        set => this.__lpPrimary_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpCB_ptr : IntPtr
    lpCB {
        get => (addr := this.__lpCB_ptr) ? DDRAWI_DDRAWSURFACE_INT.At(addr) : unset
        set => this.__lpCB_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwPreferredMode : UInt32

    hD3DInstance : HINSTANCE

    pD3DIUnknown : IUnknown

    lpDDCB : DDHAL_CALLBACKS.Ptr

    hDDVxd : IntPtr

    dwAppHackFlags : UInt32

    hFocusWnd : IntPtr

    dwHotTracking : UInt32

    dwIMEState : UInt32

    hWndPopup : IntPtr

    hDD : IntPtr

    hGammaCalibrator : IntPtr

    lpGammaCalibrator : IntPtr

}
