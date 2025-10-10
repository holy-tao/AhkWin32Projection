#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure contains blob information for the EV compensation feedback for the photo captured.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-capturedmetadataexposurecompensation
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class CapturedMetadataExposureCompensation extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A KSCAMERA_EXTENDEDPROP_EVCOMP_XXX step flag.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The EV compensation value in units of the step specified.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
