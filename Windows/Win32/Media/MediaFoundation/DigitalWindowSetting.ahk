#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the bounds settings of the digital window for video capture.
 * @remarks
 * 
  * This struct is used with the [MF_CAPTURE_METADATA_DIGITALWINDOW](/windows/win32/medfound/mf-capture-metadata-digitalwindow) attribute.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-digitalwindowsetting
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DigitalWindowSetting extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The x-axis value of the left side of the digital window bounds.
     * @type {Float}
     */
    OriginX {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The y-axis value of the top side of the digital window bounds.
     * @type {Float}
     */
    OriginY {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * A value specifying the scale of the digital window bounds.
     * @type {Float}
     */
    WindowSize {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }
}
