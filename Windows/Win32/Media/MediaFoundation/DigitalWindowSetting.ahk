#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the bounds settings of the digital window for video capture.
 * @remarks
 * This struct is used with the [MF_CAPTURE_METADATA_DIGITALWINDOW](/windows/win32/medfound/mf-capture-metadata-digitalwindow) attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-digitalwindowsetting
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DigitalWindowSetting {
    #StructPack 8

    /**
     * The x-axis value of the left side of the digital window bounds.
     */
    OriginX : Float64

    /**
     * The y-axis value of the top side of the digital window bounds.
     */
    OriginY : Float64

    /**
     * A value specifying the scale of the digital window bounds.
     */
    WindowSize : Float64

}
