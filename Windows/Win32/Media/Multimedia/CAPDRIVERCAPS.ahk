#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The CAPDRIVERCAPS structure defines the capabilities of the capture driver.An application should use the WM_CAP_DRIVER_GET_CAPS message or capDriverGetCaps macro to place a copy of the driver capabilities in a CAPDRIVERCAPS structure whenever the application connects a capture window to a capture driver.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-capdrivercaps
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CAPDRIVERCAPS {
    #StructPack 8

    /**
     * Index of the capture driver. An index value can range from 0 to 9.
     */
    wDeviceIndex : UInt32

    /**
     * Video-overlay flag. The value of this member is <b>TRUE</b> if the device supports video overlay.
     */
    fHasOverlay : BOOL

    /**
     * Video source dialog flag. The value of this member is <b>TRUE</b> if the device supports a dialog box for selecting and controlling the video source.
     */
    fHasDlgVideoSource : BOOL

    /**
     * Video format dialog flag. The value of this member is <b>TRUE</b> if the device supports a dialog box for selecting the video format.
     */
    fHasDlgVideoFormat : BOOL

    /**
     * Video display dialog flag. The value of this member is <b>TRUE</b> if the device supports a dialog box for controlling the redisplay of video from the capture frame buffer.
     */
    fHasDlgVideoDisplay : BOOL

    /**
     * Capture initialization flag. The value of this member is <b>TRUE</b> if a capture device has been successfully connected.
     */
    fCaptureInitialized : BOOL

    /**
     * Driver palette flag. The value of this member is <b>TRUE</b> if the driver can create palettes.
     */
    fDriverSuppliesPalettes : BOOL

    /**
     * Not used in Win32 applications.
     */
    hVideoIn : HANDLE

    /**
     * Not used in Win32 applications.
     */
    hVideoOut : HANDLE

    /**
     * Not used in Win32 applications.
     */
    hVideoExtIn : HANDLE

    /**
     * Not used in Win32 applications.
     */
    hVideoExtOut : HANDLE

}
