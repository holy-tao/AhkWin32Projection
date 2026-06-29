#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure contains blob information for the EV compensation feedback for the photo captured.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-capturedmetadataexposurecompensation
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct CapturedMetadataExposureCompensation {
    #StructPack 8

    /**
     * A KSCAMERA_EXTENDEDPROP_EVCOMP_XXX step flag.
     */
    Flags : Int64

    /**
     * The EV compensation value in units of the step specified.
     */
    Value : Int32

}
