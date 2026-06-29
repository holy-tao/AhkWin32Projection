#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_REGISTERED_FORMAT.ahk" { WINBIO_REGISTERED_FORMAT }

/**
 * Specifies information about a series of fingerprint or palm samples.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bdb-ansi-381-header
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_BDB_ANSI_381_HEADER {
    #StructPack 8

    /**
     * The size, in bytes, of this structure plus the size of all [**WINBIO\_BDB\_ANSI\_381\_RECORD**](winbio-bdb-ansi-381-record.md) structures for the fingerprint or palm samples captured from an end user. Only the low six bytes are valid.
     */
    RecordLength : Int64

    /**
     * Specifies the format. Currently, this must be 0x46495200.
     */
    FormatIdentifier : UInt32

    /**
     * Specifies the version number. Currently this must be 0x30313000 which corresponds internally to 0.1.0.0.
     */
    VersionNumber : UInt32

    /**
     * A [**WINBIO\_REGISTERED\_FORMAT**](winbio-registered-format.md) structure that contains the registered data format as an owner/type pair.
     */
    ProductId : WINBIO_REGISTERED_FORMAT

    /**
     * Contains the unit ID of the device used to capture the sample.
     */
    CaptureDeviceId : UInt16

    /**
     * Specifies the resolution level at which the sample is captured.
     */
    ImageAcquisitionLevel : UInt16

    /**
     * Specifies the horizontal resolution of the scan.
     */
    HorizontalScanResolution : UInt16

    /**
     * Specifies the vertical resolution of the scan.
     */
    VerticalScanResolution : UInt16

    /**
     * Specifies the horizontal resolution of the captured fingerprint or palm image.
     */
    HorizontalImageResolution : UInt16

    /**
     * Specifies the vertical resolution of the captured fingerprint or palm image.
     */
    VerticalImageResolution : UInt16

    /**
     * Number of finger or palm records in this structure.
     */
    ElementCount : Int8

    /**
     * Contains the unit of measure, 1 for inches and 2 for centimeters.
     */
    ScaleUnits : Int8

    /**
     * Specifies the number of bits in a pixel. This can be 1 to 16 bits per pixel for color.
     */
    PixelDepth : Int8

    /**
     * Specifies the algorithm used to compress the finger or palm image.
     */
    ImageCompressionAlg : Int8

    Reserved : UInt16

}
