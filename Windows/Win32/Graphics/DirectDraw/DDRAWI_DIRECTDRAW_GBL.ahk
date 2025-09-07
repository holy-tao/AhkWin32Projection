#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDCORECAPS.ahk
#Include .\DDCOLORKEY.ahk
#Include .\DDPIXELFORMAT.ahk
#Include .\VIDMEMINFO.ahk
#Include .\PROCESS_LIST.ahk
#Include .\DBLNODE.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\DDSCAPSEX.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDRAWI_DIRECTDRAW_GBL extends Win32Struct
{
    static sizeof => 1864

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwRefCnt {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    fpPrimaryOrig {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {DDCORECAPS}
     */
    ddCaps{
        get {
            if(!this.HasProp("__ddCaps"))
                this.__ddCaps := DDCORECAPS(this.ptr + 16)
            return this.__ddCaps
        }
    }

    /**
     * @type {Integer}
     */
    dwInternal1 {
        get => NumGet(this, 332, "uint")
        set => NumPut("uint", value, this, 332)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwUnused1{
        get {
            if(!this.HasProp("__dwUnused1ProxyArray"))
                this.__dwUnused1ProxyArray := Win32FixedArray(this.ptr + 336, 4, Primitive, "uint")
            return this.__dwUnused1ProxyArray
        }
    }

    /**
     * @type {Pointer<DDHAL_CALLBACKS>}
     */
    lpDDCBtmp {
        get => NumGet(this, 376, "ptr")
        set => NumPut("ptr", value, this, 376)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    dsList {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWPALETTE_INT>}
     */
    palList {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWCLIPPER_INT>}
     */
    clipperList {
        get => NumGet(this, 400, "ptr")
        set => NumPut("ptr", value, this, 400)
    }

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_GBL>}
     */
    lp16DD {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * @type {Integer}
     */
    dwMaxOverlays {
        get => NumGet(this, 416, "uint")
        set => NumPut("uint", value, this, 416)
    }

    /**
     * @type {Integer}
     */
    dwCurrOverlays {
        get => NumGet(this, 420, "uint")
        set => NumPut("uint", value, this, 420)
    }

    /**
     * @type {Integer}
     */
    dwMonitorFrequency {
        get => NumGet(this, 424, "uint")
        set => NumPut("uint", value, this, 424)
    }

    /**
     * @type {DDCORECAPS}
     */
    ddHELCaps{
        get {
            if(!this.HasProp("__ddHELCaps"))
                this.__ddHELCaps := DDCORECAPS(this.ptr + 432)
            return this.__ddHELCaps
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    dwUnused2{
        get {
            if(!this.HasProp("__dwUnused2ProxyArray"))
                this.__dwUnused2ProxyArray := Win32FixedArray(this.ptr + 748, 4, Primitive, "uint")
            return this.__dwUnused2ProxyArray
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKDestOverlay{
        get {
            if(!this.HasProp("__ddckCKDestOverlay"))
                this.__ddckCKDestOverlay := DDCOLORKEY(this.ptr + 952)
            return this.__ddckCKDestOverlay
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKSrcOverlay{
        get {
            if(!this.HasProp("__ddckCKSrcOverlay"))
                this.__ddckCKSrcOverlay := DDCOLORKEY(this.ptr + 960)
            return this.__ddckCKSrcOverlay
        }
    }

    /**
     * @type {VIDMEMINFO}
     */
    vmiData{
        get {
            if(!this.HasProp("__vmiData"))
                this.__vmiData := VIDMEMINFO(this.ptr + 968)
            return this.__vmiData
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDriverHandle {
        get => NumGet(this, 1056, "ptr")
        set => NumPut("ptr", value, this, 1056)
    }

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpExclusiveOwner {
        get => NumGet(this, 1064, "ptr")
        set => NumPut("ptr", value, this, 1064)
    }

    /**
     * @type {Integer}
     */
    dwModeIndex {
        get => NumGet(this, 1072, "uint")
        set => NumPut("uint", value, this, 1072)
    }

    /**
     * @type {Integer}
     */
    dwModeIndexOrig {
        get => NumGet(this, 1076, "uint")
        set => NumPut("uint", value, this, 1076)
    }

    /**
     * @type {Integer}
     */
    dwNumFourCC {
        get => NumGet(this, 1080, "uint")
        set => NumPut("uint", value, this, 1080)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    lpdwFourCC {
        get => NumGet(this, 1088, "ptr")
        set => NumPut("ptr", value, this, 1088)
    }

    /**
     * @type {Integer}
     */
    dwNumModes {
        get => NumGet(this, 1096, "uint")
        set => NumPut("uint", value, this, 1096)
    }

    /**
     * @type {Pointer<DDHALMODEINFO>}
     */
    lpModeInfo {
        get => NumGet(this, 1104, "ptr")
        set => NumPut("ptr", value, this, 1104)
    }

    /**
     * @type {PROCESS_LIST}
     */
    plProcessList{
        get {
            if(!this.HasProp("__plProcessList"))
                this.__plProcessList := PROCESS_LIST(this.ptr + 1112)
            return this.__plProcessList
        }
    }

    /**
     * @type {Integer}
     */
    dwSurfaceLockCount {
        get => NumGet(this, 1136, "uint")
        set => NumPut("uint", value, this, 1136)
    }

    /**
     * @type {Integer}
     */
    dwAliasedLockCnt {
        get => NumGet(this, 1140, "uint")
        set => NumPut("uint", value, this, 1140)
    }

    /**
     * @type {Pointer}
     */
    dwReserved3 {
        get => NumGet(this, 1144, "ptr")
        set => NumPut("ptr", value, this, 1144)
    }

    /**
     * @type {Pointer}
     */
    hDD {
        get => NumGet(this, 1152, "ptr")
        set => NumPut("ptr", value, this, 1152)
    }

    /**
     * @type {String}
     */
    cObsolete {
        get => StrGet(this.ptr + 1160, 11, "UTF-16")
        set => StrPut(value, this.ptr + 1160, 11, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 1184, "uint")
        set => NumPut("uint", value, this, 1184)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 1188, "uint")
        set => NumPut("uint", value, this, 1188)
    }

    /**
     * @type {DBLNODE}
     */
    dbnOverlayRoot{
        get {
            if(!this.HasProp("__dbnOverlayRoot"))
                this.__dbnOverlayRoot := DBLNODE(this.ptr + 1192)
            return this.__dbnOverlayRoot
        }
    }

    /**
     * @type {Pointer<UInt16>}
     */
    lpwPDeviceFlags {
        get => NumGet(this, 1224, "ptr")
        set => NumPut("ptr", value, this, 1224)
    }

    /**
     * @type {Integer}
     */
    dwPDevice {
        get => NumGet(this, 1232, "uint")
        set => NumPut("uint", value, this, 1232)
    }

    /**
     * @type {Integer}
     */
    dwWin16LockCnt {
        get => NumGet(this, 1236, "uint")
        set => NumPut("uint", value, this, 1236)
    }

    /**
     * @type {Integer}
     */
    dwUnused3 {
        get => NumGet(this, 1240, "uint")
        set => NumPut("uint", value, this, 1240)
    }

    /**
     * @type {Integer}
     */
    hInstance {
        get => NumGet(this, 1244, "uint")
        set => NumPut("uint", value, this, 1244)
    }

    /**
     * @type {Integer}
     */
    dwEvent16 {
        get => NumGet(this, 1248, "uint")
        set => NumPut("uint", value, this, 1248)
    }

    /**
     * @type {Integer}
     */
    dwSaveNumModes {
        get => NumGet(this, 1252, "uint")
        set => NumPut("uint", value, this, 1252)
    }

    /**
     * @type {Pointer}
     */
    lpD3DGlobalDriverData {
        get => NumGet(this, 1256, "ptr")
        set => NumPut("ptr", value, this, 1256)
    }

    /**
     * @type {Pointer}
     */
    lpD3DHALCallbacks {
        get => NumGet(this, 1264, "ptr")
        set => NumPut("ptr", value, this, 1264)
    }

    /**
     * @type {DDCORECAPS}
     */
    ddBothCaps{
        get {
            if(!this.HasProp("__ddBothCaps"))
                this.__ddBothCaps := DDCORECAPS(this.ptr + 1272)
            return this.__ddBothCaps
        }
    }

    /**
     * @type {Pointer<DDVIDEOPORTCAPS>}
     */
    lpDDVideoPortCaps {
        get => NumGet(this, 1592, "ptr")
        set => NumPut("ptr", value, this, 1592)
    }

    /**
     * @type {Pointer<DDRAWI_DDVIDEOPORT_INT>}
     */
    dvpList {
        get => NumGet(this, 1600, "ptr")
        set => NumPut("ptr", value, this, 1600)
    }

    /**
     * @type {Pointer}
     */
    lpD3DHALCallbacks2 {
        get => NumGet(this, 1608, "ptr")
        set => NumPut("ptr", value, this, 1608)
    }

    /**
     * @type {RECT}
     */
    rectDevice{
        get {
            if(!this.HasProp("__rectDevice"))
                this.__rectDevice := RECT(this.ptr + 1616)
            return this.__rectDevice
        }
    }

    /**
     * @type {Integer}
     */
    cMonitors {
        get => NumGet(this, 1632, "uint")
        set => NumPut("uint", value, this, 1632)
    }

    /**
     * @type {Pointer<Void>}
     */
    gpbmiSrc {
        get => NumGet(this, 1640, "ptr")
        set => NumPut("ptr", value, this, 1640)
    }

    /**
     * @type {Pointer<Void>}
     */
    gpbmiDest {
        get => NumGet(this, 1648, "ptr")
        set => NumPut("ptr", value, this, 1648)
    }

    /**
     * @type {Pointer<HEAPALIASINFO>}
     */
    phaiHeapAliases {
        get => NumGet(this, 1656, "ptr")
        set => NumPut("ptr", value, this, 1656)
    }

    /**
     * @type {Pointer}
     */
    hKernelHandle {
        get => NumGet(this, 1664, "ptr")
        set => NumPut("ptr", value, this, 1664)
    }

    /**
     * @type {Pointer}
     */
    pfnNotifyProc {
        get => NumGet(this, 1672, "ptr")
        set => NumPut("ptr", value, this, 1672)
    }

    /**
     * @type {Pointer<DDKERNELCAPS>}
     */
    lpDDKernelCaps {
        get => NumGet(this, 1680, "ptr")
        set => NumPut("ptr", value, this, 1680)
    }

    /**
     * @type {Pointer<DDNONLOCALVIDMEMCAPS>}
     */
    lpddNLVCaps {
        get => NumGet(this, 1688, "ptr")
        set => NumPut("ptr", value, this, 1688)
    }

    /**
     * @type {Pointer<DDNONLOCALVIDMEMCAPS>}
     */
    lpddNLVHELCaps {
        get => NumGet(this, 1696, "ptr")
        set => NumPut("ptr", value, this, 1696)
    }

    /**
     * @type {Pointer<DDNONLOCALVIDMEMCAPS>}
     */
    lpddNLVBothCaps {
        get => NumGet(this, 1704, "ptr")
        set => NumPut("ptr", value, this, 1704)
    }

    /**
     * @type {Pointer}
     */
    lpD3DExtendedCaps {
        get => NumGet(this, 1712, "ptr")
        set => NumPut("ptr", value, this, 1712)
    }

    /**
     * @type {Integer}
     */
    dwDOSBoxEvent {
        get => NumGet(this, 1720, "uint")
        set => NumPut("uint", value, this, 1720)
    }

    /**
     * @type {RECT}
     */
    rectDesktop{
        get {
            if(!this.HasProp("__rectDesktop"))
                this.__rectDesktop := RECT(this.ptr + 1728)
            return this.__rectDesktop
        }
    }

    /**
     * @type {String}
     */
    cDriverName {
        get => StrGet(this.ptr + 1744, 31, "UTF-16")
        set => StrPut(value, this.ptr + 1744, 31, "UTF-16")
    }

    /**
     * @type {Pointer}
     */
    lpD3DHALCallbacks3 {
        get => NumGet(this, 1808, "ptr")
        set => NumPut("ptr", value, this, 1808)
    }

    /**
     * @type {Integer}
     */
    dwNumZPixelFormats {
        get => NumGet(this, 1816, "uint")
        set => NumPut("uint", value, this, 1816)
    }

    /**
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpZPixelFormats {
        get => NumGet(this, 1824, "ptr")
        set => NumPut("ptr", value, this, 1824)
    }

    /**
     * @type {Pointer<DDRAWI_DDMOTIONCOMP_INT>}
     */
    mcList {
        get => NumGet(this, 1832, "ptr")
        set => NumPut("ptr", value, this, 1832)
    }

    /**
     * @type {Integer}
     */
    hDDVxd {
        get => NumGet(this, 1840, "uint")
        set => NumPut("uint", value, this, 1840)
    }

    /**
     * @type {DDSCAPSEX}
     */
    ddsCapsMore{
        get {
            if(!this.HasProp("__ddsCapsMore"))
                this.__ddsCapsMore := DDSCAPSEX(this.ptr + 1848)
            return this.__ddsCapsMore
        }
    }
}
