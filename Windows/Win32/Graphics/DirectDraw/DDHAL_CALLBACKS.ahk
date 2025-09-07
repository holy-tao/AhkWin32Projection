#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDHAL_DDCALLBACKS.ahk
#Include .\DDHAL_DDSURFACECALLBACKS.ahk
#Include .\DDHAL_DDPALETTECALLBACKS.ahk
#Include .\DDHAL_DDEXEBUFCALLBACKS.ahk
#Include .\DDHAL_DDVIDEOPORTCALLBACKS.ahk
#Include .\DDHAL_DDCOLORCONTROLCALLBACKS.ahk
#Include .\DDHAL_DDMISCELLANEOUSCALLBACKS.ahk
#Include .\DDHAL_DDKERNELCALLBACKS.ahk
#Include .\DDHAL_DDMOTIONCOMPCALLBACKS.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_CALLBACKS extends Win32Struct
{
    static sizeof => 1448

    static packingSize => 8

    /**
     * @type {DDHAL_DDCALLBACKS}
     */
    cbDDCallbacks{
        get {
            if(!this.HasProp("__cbDDCallbacks"))
                this.__cbDDCallbacks := DDHAL_DDCALLBACKS(this.ptr + 0)
            return this.__cbDDCallbacks
        }
    }

    /**
     * @type {DDHAL_DDSURFACECALLBACKS}
     */
    cbDDSurfaceCallbacks{
        get {
            if(!this.HasProp("__cbDDSurfaceCallbacks"))
                this.__cbDDSurfaceCallbacks := DDHAL_DDSURFACECALLBACKS(this.ptr + 88)
            return this.__cbDDSurfaceCallbacks
        }
    }

    /**
     * @type {DDHAL_DDPALETTECALLBACKS}
     */
    cbDDPaletteCallbacks{
        get {
            if(!this.HasProp("__cbDDPaletteCallbacks"))
                this.__cbDDPaletteCallbacks := DDHAL_DDPALETTECALLBACKS(this.ptr + 208)
            return this.__cbDDPaletteCallbacks
        }
    }

    /**
     * @type {DDHAL_DDCALLBACKS}
     */
    HALDD{
        get {
            if(!this.HasProp("__HALDD"))
                this.__HALDD := DDHAL_DDCALLBACKS(this.ptr + 232)
            return this.__HALDD
        }
    }

    /**
     * @type {DDHAL_DDSURFACECALLBACKS}
     */
    HALDDSurface{
        get {
            if(!this.HasProp("__HALDDSurface"))
                this.__HALDDSurface := DDHAL_DDSURFACECALLBACKS(this.ptr + 320)
            return this.__HALDDSurface
        }
    }

    /**
     * @type {DDHAL_DDPALETTECALLBACKS}
     */
    HALDDPalette{
        get {
            if(!this.HasProp("__HALDDPalette"))
                this.__HALDDPalette := DDHAL_DDPALETTECALLBACKS(this.ptr + 440)
            return this.__HALDDPalette
        }
    }

    /**
     * @type {DDHAL_DDCALLBACKS}
     */
    HELDD{
        get {
            if(!this.HasProp("__HELDD"))
                this.__HELDD := DDHAL_DDCALLBACKS(this.ptr + 464)
            return this.__HELDD
        }
    }

    /**
     * @type {DDHAL_DDSURFACECALLBACKS}
     */
    HELDDSurface{
        get {
            if(!this.HasProp("__HELDDSurface"))
                this.__HELDDSurface := DDHAL_DDSURFACECALLBACKS(this.ptr + 552)
            return this.__HELDDSurface
        }
    }

    /**
     * @type {DDHAL_DDPALETTECALLBACKS}
     */
    HELDDPalette{
        get {
            if(!this.HasProp("__HELDDPalette"))
                this.__HELDDPalette := DDHAL_DDPALETTECALLBACKS(this.ptr + 672)
            return this.__HELDDPalette
        }
    }

    /**
     * @type {DDHAL_DDEXEBUFCALLBACKS}
     */
    cbDDExeBufCallbacks{
        get {
            if(!this.HasProp("__cbDDExeBufCallbacks"))
                this.__cbDDExeBufCallbacks := DDHAL_DDEXEBUFCALLBACKS(this.ptr + 696)
            return this.__cbDDExeBufCallbacks
        }
    }

    /**
     * @type {DDHAL_DDEXEBUFCALLBACKS}
     */
    HALDDExeBuf{
        get {
            if(!this.HasProp("__HALDDExeBuf"))
                this.__HALDDExeBuf := DDHAL_DDEXEBUFCALLBACKS(this.ptr + 744)
            return this.__HALDDExeBuf
        }
    }

    /**
     * @type {DDHAL_DDEXEBUFCALLBACKS}
     */
    HELDDExeBuf{
        get {
            if(!this.HasProp("__HELDDExeBuf"))
                this.__HELDDExeBuf := DDHAL_DDEXEBUFCALLBACKS(this.ptr + 792)
            return this.__HELDDExeBuf
        }
    }

    /**
     * @type {DDHAL_DDVIDEOPORTCALLBACKS}
     */
    cbDDVideoPortCallbacks{
        get {
            if(!this.HasProp("__cbDDVideoPortCallbacks"))
                this.__cbDDVideoPortCallbacks := DDHAL_DDVIDEOPORTCALLBACKS(this.ptr + 840)
            return this.__cbDDVideoPortCallbacks
        }
    }

    /**
     * @type {DDHAL_DDVIDEOPORTCALLBACKS}
     */
    HALDDVideoPort{
        get {
            if(!this.HasProp("__HALDDVideoPort"))
                this.__HALDDVideoPort := DDHAL_DDVIDEOPORTCALLBACKS(this.ptr + 976)
            return this.__HALDDVideoPort
        }
    }

    /**
     * @type {DDHAL_DDCOLORCONTROLCALLBACKS}
     */
    cbDDColorControlCallbacks{
        get {
            if(!this.HasProp("__cbDDColorControlCallbacks"))
                this.__cbDDColorControlCallbacks := DDHAL_DDCOLORCONTROLCALLBACKS(this.ptr + 1112)
            return this.__cbDDColorControlCallbacks
        }
    }

    /**
     * @type {DDHAL_DDCOLORCONTROLCALLBACKS}
     */
    HALDDColorControl{
        get {
            if(!this.HasProp("__HALDDColorControl"))
                this.__HALDDColorControl := DDHAL_DDCOLORCONTROLCALLBACKS(this.ptr + 1128)
            return this.__HALDDColorControl
        }
    }

    /**
     * @type {DDHAL_DDMISCELLANEOUSCALLBACKS}
     */
    cbDDMiscellaneousCallbacks{
        get {
            if(!this.HasProp("__cbDDMiscellaneousCallbacks"))
                this.__cbDDMiscellaneousCallbacks := DDHAL_DDMISCELLANEOUSCALLBACKS(this.ptr + 1144)
            return this.__cbDDMiscellaneousCallbacks
        }
    }

    /**
     * @type {DDHAL_DDMISCELLANEOUSCALLBACKS}
     */
    HALDDMiscellaneous{
        get {
            if(!this.HasProp("__HALDDMiscellaneous"))
                this.__HALDDMiscellaneous := DDHAL_DDMISCELLANEOUSCALLBACKS(this.ptr + 1184)
            return this.__HALDDMiscellaneous
        }
    }

    /**
     * @type {DDHAL_DDKERNELCALLBACKS}
     */
    cbDDKernelCallbacks{
        get {
            if(!this.HasProp("__cbDDKernelCallbacks"))
                this.__cbDDKernelCallbacks := DDHAL_DDKERNELCALLBACKS(this.ptr + 1224)
            return this.__cbDDKernelCallbacks
        }
    }

    /**
     * @type {DDHAL_DDKERNELCALLBACKS}
     */
    HALDDKernel{
        get {
            if(!this.HasProp("__HALDDKernel"))
                this.__HALDDKernel := DDHAL_DDKERNELCALLBACKS(this.ptr + 1248)
            return this.__HALDDKernel
        }
    }

    /**
     * @type {DDHAL_DDMOTIONCOMPCALLBACKS}
     */
    cbDDMotionCompCallbacks{
        get {
            if(!this.HasProp("__cbDDMotionCompCallbacks"))
                this.__cbDDMotionCompCallbacks := DDHAL_DDMOTIONCOMPCALLBACKS(this.ptr + 1272)
            return this.__cbDDMotionCompCallbacks
        }
    }

    /**
     * @type {DDHAL_DDMOTIONCOMPCALLBACKS}
     */
    HALDDMotionComp{
        get {
            if(!this.HasProp("__HALDDMotionComp"))
                this.__HALDDMotionComp := DDHAL_DDMOTIONCOMPCALLBACKS(this.ptr + 1360)
            return this.__HALDDMotionComp
        }
    }
}
