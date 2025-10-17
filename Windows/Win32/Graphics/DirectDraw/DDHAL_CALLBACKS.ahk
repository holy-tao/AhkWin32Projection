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
                this.__cbDDCallbacks := DDHAL_DDCALLBACKS(0, this)
            return this.__cbDDCallbacks
        }
    }

    /**
     * @type {DDHAL_DDSURFACECALLBACKS}
     */
    cbDDSurfaceCallbacks{
        get {
            if(!this.HasProp("__cbDDSurfaceCallbacks"))
                this.__cbDDSurfaceCallbacks := DDHAL_DDSURFACECALLBACKS(88, this)
            return this.__cbDDSurfaceCallbacks
        }
    }

    /**
     * @type {DDHAL_DDPALETTECALLBACKS}
     */
    cbDDPaletteCallbacks{
        get {
            if(!this.HasProp("__cbDDPaletteCallbacks"))
                this.__cbDDPaletteCallbacks := DDHAL_DDPALETTECALLBACKS(208, this)
            return this.__cbDDPaletteCallbacks
        }
    }

    /**
     * @type {DDHAL_DDCALLBACKS}
     */
    HALDD{
        get {
            if(!this.HasProp("__HALDD"))
                this.__HALDD := DDHAL_DDCALLBACKS(232, this)
            return this.__HALDD
        }
    }

    /**
     * @type {DDHAL_DDSURFACECALLBACKS}
     */
    HALDDSurface{
        get {
            if(!this.HasProp("__HALDDSurface"))
                this.__HALDDSurface := DDHAL_DDSURFACECALLBACKS(320, this)
            return this.__HALDDSurface
        }
    }

    /**
     * @type {DDHAL_DDPALETTECALLBACKS}
     */
    HALDDPalette{
        get {
            if(!this.HasProp("__HALDDPalette"))
                this.__HALDDPalette := DDHAL_DDPALETTECALLBACKS(440, this)
            return this.__HALDDPalette
        }
    }

    /**
     * @type {DDHAL_DDCALLBACKS}
     */
    HELDD{
        get {
            if(!this.HasProp("__HELDD"))
                this.__HELDD := DDHAL_DDCALLBACKS(464, this)
            return this.__HELDD
        }
    }

    /**
     * @type {DDHAL_DDSURFACECALLBACKS}
     */
    HELDDSurface{
        get {
            if(!this.HasProp("__HELDDSurface"))
                this.__HELDDSurface := DDHAL_DDSURFACECALLBACKS(552, this)
            return this.__HELDDSurface
        }
    }

    /**
     * @type {DDHAL_DDPALETTECALLBACKS}
     */
    HELDDPalette{
        get {
            if(!this.HasProp("__HELDDPalette"))
                this.__HELDDPalette := DDHAL_DDPALETTECALLBACKS(672, this)
            return this.__HELDDPalette
        }
    }

    /**
     * @type {DDHAL_DDEXEBUFCALLBACKS}
     */
    cbDDExeBufCallbacks{
        get {
            if(!this.HasProp("__cbDDExeBufCallbacks"))
                this.__cbDDExeBufCallbacks := DDHAL_DDEXEBUFCALLBACKS(696, this)
            return this.__cbDDExeBufCallbacks
        }
    }

    /**
     * @type {DDHAL_DDEXEBUFCALLBACKS}
     */
    HALDDExeBuf{
        get {
            if(!this.HasProp("__HALDDExeBuf"))
                this.__HALDDExeBuf := DDHAL_DDEXEBUFCALLBACKS(744, this)
            return this.__HALDDExeBuf
        }
    }

    /**
     * @type {DDHAL_DDEXEBUFCALLBACKS}
     */
    HELDDExeBuf{
        get {
            if(!this.HasProp("__HELDDExeBuf"))
                this.__HELDDExeBuf := DDHAL_DDEXEBUFCALLBACKS(792, this)
            return this.__HELDDExeBuf
        }
    }

    /**
     * @type {DDHAL_DDVIDEOPORTCALLBACKS}
     */
    cbDDVideoPortCallbacks{
        get {
            if(!this.HasProp("__cbDDVideoPortCallbacks"))
                this.__cbDDVideoPortCallbacks := DDHAL_DDVIDEOPORTCALLBACKS(840, this)
            return this.__cbDDVideoPortCallbacks
        }
    }

    /**
     * @type {DDHAL_DDVIDEOPORTCALLBACKS}
     */
    HALDDVideoPort{
        get {
            if(!this.HasProp("__HALDDVideoPort"))
                this.__HALDDVideoPort := DDHAL_DDVIDEOPORTCALLBACKS(976, this)
            return this.__HALDDVideoPort
        }
    }

    /**
     * @type {DDHAL_DDCOLORCONTROLCALLBACKS}
     */
    cbDDColorControlCallbacks{
        get {
            if(!this.HasProp("__cbDDColorControlCallbacks"))
                this.__cbDDColorControlCallbacks := DDHAL_DDCOLORCONTROLCALLBACKS(1112, this)
            return this.__cbDDColorControlCallbacks
        }
    }

    /**
     * @type {DDHAL_DDCOLORCONTROLCALLBACKS}
     */
    HALDDColorControl{
        get {
            if(!this.HasProp("__HALDDColorControl"))
                this.__HALDDColorControl := DDHAL_DDCOLORCONTROLCALLBACKS(1128, this)
            return this.__HALDDColorControl
        }
    }

    /**
     * @type {DDHAL_DDMISCELLANEOUSCALLBACKS}
     */
    cbDDMiscellaneousCallbacks{
        get {
            if(!this.HasProp("__cbDDMiscellaneousCallbacks"))
                this.__cbDDMiscellaneousCallbacks := DDHAL_DDMISCELLANEOUSCALLBACKS(1144, this)
            return this.__cbDDMiscellaneousCallbacks
        }
    }

    /**
     * @type {DDHAL_DDMISCELLANEOUSCALLBACKS}
     */
    HALDDMiscellaneous{
        get {
            if(!this.HasProp("__HALDDMiscellaneous"))
                this.__HALDDMiscellaneous := DDHAL_DDMISCELLANEOUSCALLBACKS(1184, this)
            return this.__HALDDMiscellaneous
        }
    }

    /**
     * @type {DDHAL_DDKERNELCALLBACKS}
     */
    cbDDKernelCallbacks{
        get {
            if(!this.HasProp("__cbDDKernelCallbacks"))
                this.__cbDDKernelCallbacks := DDHAL_DDKERNELCALLBACKS(1224, this)
            return this.__cbDDKernelCallbacks
        }
    }

    /**
     * @type {DDHAL_DDKERNELCALLBACKS}
     */
    HALDDKernel{
        get {
            if(!this.HasProp("__HALDDKernel"))
                this.__HALDDKernel := DDHAL_DDKERNELCALLBACKS(1248, this)
            return this.__HALDDKernel
        }
    }

    /**
     * @type {DDHAL_DDMOTIONCOMPCALLBACKS}
     */
    cbDDMotionCompCallbacks{
        get {
            if(!this.HasProp("__cbDDMotionCompCallbacks"))
                this.__cbDDMotionCompCallbacks := DDHAL_DDMOTIONCOMPCALLBACKS(1272, this)
            return this.__cbDDMotionCompCallbacks
        }
    }

    /**
     * @type {DDHAL_DDMOTIONCOMPCALLBACKS}
     */
    HALDDMotionComp{
        get {
            if(!this.HasProp("__HALDDMotionComp"))
                this.__HALDDMotionComp := DDHAL_DDMOTIONCOMPCALLBACKS(1360, this)
            return this.__HALDDMotionComp
        }
    }
}
