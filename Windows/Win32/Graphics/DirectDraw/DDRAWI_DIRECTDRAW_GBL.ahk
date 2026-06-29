#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_CALLBACKS.ahk" { DDHAL_CALLBACKS }
#Import ".\HEAPALIASINFO.ahk" { HEAPALIASINFO }
#Import ".\DDRAWI_DDMOTIONCOMP_INT.ahk" { DDRAWI_DDMOTIONCOMP_INT }
#Import ".\DDRAWI_DIRECTDRAW_LCL.ahk" { DDRAWI_DIRECTDRAW_LCL }
#Import ".\DDRAWI_DDVIDEOPORT_INT.ahk" { DDRAWI_DDVIDEOPORT_INT }
#Import ".\DDRAWI_DDRAWPALETTE_INT.ahk" { DDRAWI_DDRAWPALETTE_INT }
#Import ".\DBLNODE.ahk" { DBLNODE }
#Import ".\DDVIDEOPORTCAPS.ahk" { DDVIDEOPORTCAPS }
#Import ".\VIDMEM.ahk" { VIDMEM }
#Import ".\DDRAWI_DDRAWSURFACE_INT.ahk" { DDRAWI_DDRAWSURFACE_INT }
#Import ".\DDSCAPSEX.ahk" { DDSCAPSEX }
#Import ".\PROCESS_LIST.ahk" { PROCESS_LIST }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDKERNELCAPS.ahk" { DDKERNELCAPS }
#Import ".\DDCORECAPS.ahk" { DDCORECAPS }
#Import ".\DDRAWI_DDRAWCLIPPER_INT.ahk" { DDRAWI_DDRAWCLIPPER_INT }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\VIDMEMINFO.ahk" { VIDMEMINFO }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDNONLOCALVIDMEMCAPS.ahk" { DDNONLOCALVIDMEMCAPS }
#Import ".\DDRAWI_DDRAWSURFACE_LCL.ahk" { DDRAWI_DDRAWSURFACE_LCL }
#Import ".\DDHALMODEINFO.ahk" { DDHALMODEINFO }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDRAWI_DIRECTDRAW_GBL {
    #StructPack 8

    dwRefCnt : UInt32

    dwFlags : UInt32

    fpPrimaryOrig : IntPtr

    ddCaps : DDCORECAPS

    dwInternal1 : UInt32

    dwUnused1 : UInt32[9]

    lpDDCBtmp : DDHAL_CALLBACKS.Ptr

    __dsList_ptr : IntPtr
    dsList {
        get => (addr := this.__dsList_ptr) ? DDRAWI_DDRAWSURFACE_INT.At(addr) : unset
        set => this.__dsList_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __palList_ptr : IntPtr
    palList {
        get => (addr := this.__palList_ptr) ? DDRAWI_DDRAWPALETTE_INT.At(addr) : unset
        set => this.__palList_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __clipperList_ptr : IntPtr
    clipperList {
        get => (addr := this.__clipperList_ptr) ? DDRAWI_DDRAWCLIPPER_INT.At(addr) : unset
        set => this.__clipperList_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lp16DD : DDRAWI_DIRECTDRAW_GBL.Ptr

    dwMaxOverlays : UInt32

    dwCurrOverlays : UInt32

    dwMonitorFrequency : UInt32

    ddHELCaps : DDCORECAPS

    dwUnused2 : UInt32[50]

    ddckCKDestOverlay : DDCOLORKEY

    ddckCKSrcOverlay : DDCOLORKEY

    vmiData : VIDMEMINFO

    lpDriverHandle : IntPtr

    __lpExclusiveOwner_ptr : IntPtr
    lpExclusiveOwner {
        get => (addr := this.__lpExclusiveOwner_ptr) ? DDRAWI_DIRECTDRAW_LCL.At(addr) : unset
        set => this.__lpExclusiveOwner_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwModeIndex : UInt32

    dwModeIndexOrig : UInt32

    dwNumFourCC : UInt32

    lpdwFourCC : IntPtr

    dwNumModes : UInt32

    lpModeInfo : DDHALMODEINFO.Ptr

    plProcessList : PROCESS_LIST

    dwSurfaceLockCount : UInt32

    dwAliasedLockCnt : UInt32

    dwReserved3 : IntPtr

    hDD : IntPtr

    cObsolete : CHAR[12]

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    dbnOverlayRoot : DBLNODE

    lpwPDeviceFlags : IntPtr

    dwPDevice : UInt32

    dwWin16LockCnt : UInt32

    dwUnused3 : UInt32

    hInstance : UInt32

    dwEvent16 : UInt32

    dwSaveNumModes : UInt32

    lpD3DGlobalDriverData : IntPtr

    lpD3DHALCallbacks : IntPtr

    ddBothCaps : DDCORECAPS

    lpDDVideoPortCaps : DDVIDEOPORTCAPS.Ptr

    __dvpList_ptr : IntPtr
    dvpList {
        get => (addr := this.__dvpList_ptr) ? DDRAWI_DDVIDEOPORT_INT.At(addr) : unset
        set => this.__dvpList_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    lpD3DHALCallbacks2 : IntPtr

    rectDevice : RECT

    cMonitors : UInt32

    gpbmiSrc : IntPtr

    gpbmiDest : IntPtr

    phaiHeapAliases : HEAPALIASINFO.Ptr

    hKernelHandle : IntPtr

    pfnNotifyProc : IntPtr

    lpDDKernelCaps : DDKERNELCAPS.Ptr

    lpddNLVCaps : DDNONLOCALVIDMEMCAPS.Ptr

    lpddNLVHELCaps : DDNONLOCALVIDMEMCAPS.Ptr

    lpddNLVBothCaps : DDNONLOCALVIDMEMCAPS.Ptr

    lpD3DExtendedCaps : IntPtr

    dwDOSBoxEvent : UInt32

    rectDesktop : RECT

    cDriverName : CHAR[32]

    lpD3DHALCallbacks3 : IntPtr

    dwNumZPixelFormats : UInt32

    lpZPixelFormats : DDPIXELFORMAT.Ptr

    __mcList_ptr : IntPtr
    mcList {
        get => (addr := this.__mcList_ptr) ? DDRAWI_DDMOTIONCOMP_INT.At(addr) : unset
        set => this.__mcList_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    hDDVxd : UInt32

    ddsCapsMore : DDSCAPSEX

}
