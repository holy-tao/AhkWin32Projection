#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The CAPDRIVERCAPS structure defines the capabilities of the capture driver.An application should use the WM_CAP_DRIVER_GET_CAPS message or capDriverGetCaps macro to place a copy of the driver capabilities in a CAPDRIVERCAPS structure whenever the application connects a capture window to a capture driver.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-capdrivercaps
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class CAPDRIVERCAPS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Index of the capture driver. An index value can range from 0 to 9.
     * @type {Integer}
     */
    wDeviceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Video-overlay flag. The value of this member is <b>TRUE</b> if the device supports video overlay.
     * @type {BOOL}
     */
    fHasOverlay{
        get {
            if(!this.HasProp("__fHasOverlay"))
                this.__fHasOverlay := BOOL(this.ptr + 4)
            return this.__fHasOverlay
        }
    }

    /**
     * Video source dialog flag. The value of this member is <b>TRUE</b> if the device supports a dialog box for selecting and controlling the video source.
     * @type {BOOL}
     */
    fHasDlgVideoSource{
        get {
            if(!this.HasProp("__fHasDlgVideoSource"))
                this.__fHasDlgVideoSource := BOOL(this.ptr + 8)
            return this.__fHasDlgVideoSource
        }
    }

    /**
     * Video format dialog flag. The value of this member is <b>TRUE</b> if the device supports a dialog box for selecting the video format.
     * @type {BOOL}
     */
    fHasDlgVideoFormat{
        get {
            if(!this.HasProp("__fHasDlgVideoFormat"))
                this.__fHasDlgVideoFormat := BOOL(this.ptr + 12)
            return this.__fHasDlgVideoFormat
        }
    }

    /**
     * Video display dialog flag. The value of this member is <b>TRUE</b> if the device supports a dialog box for controlling the redisplay of video from the capture frame buffer.
     * @type {BOOL}
     */
    fHasDlgVideoDisplay{
        get {
            if(!this.HasProp("__fHasDlgVideoDisplay"))
                this.__fHasDlgVideoDisplay := BOOL(this.ptr + 16)
            return this.__fHasDlgVideoDisplay
        }
    }

    /**
     * Capture initialization flag. The value of this member is <b>TRUE</b> if a capture device has been successfully connected.
     * @type {BOOL}
     */
    fCaptureInitialized{
        get {
            if(!this.HasProp("__fCaptureInitialized"))
                this.__fCaptureInitialized := BOOL(this.ptr + 20)
            return this.__fCaptureInitialized
        }
    }

    /**
     * Driver palette flag. The value of this member is <b>TRUE</b> if the driver can create palettes.
     * @type {BOOL}
     */
    fDriverSuppliesPalettes{
        get {
            if(!this.HasProp("__fDriverSuppliesPalettes"))
                this.__fDriverSuppliesPalettes := BOOL(this.ptr + 24)
            return this.__fDriverSuppliesPalettes
        }
    }

    /**
     * Not used in Win32 applications.
     * @type {HANDLE}
     */
    hVideoIn{
        get {
            if(!this.HasProp("__hVideoIn"))
                this.__hVideoIn := HANDLE(this.ptr + 32)
            return this.__hVideoIn
        }
    }

    /**
     * Not used in Win32 applications.
     * @type {HANDLE}
     */
    hVideoOut{
        get {
            if(!this.HasProp("__hVideoOut"))
                this.__hVideoOut := HANDLE(this.ptr + 40)
            return this.__hVideoOut
        }
    }

    /**
     * Not used in Win32 applications.
     * @type {HANDLE}
     */
    hVideoExtIn{
        get {
            if(!this.HasProp("__hVideoExtIn"))
                this.__hVideoExtIn := HANDLE(this.ptr + 48)
            return this.__hVideoExtIn
        }
    }

    /**
     * Not used in Win32 applications.
     * @type {HANDLE}
     */
    hVideoExtOut{
        get {
            if(!this.HasProp("__hVideoExtOut"))
                this.__hVideoExtOut := HANDLE(this.ptr + 56)
            return this.__hVideoExtOut
        }
    }
}
