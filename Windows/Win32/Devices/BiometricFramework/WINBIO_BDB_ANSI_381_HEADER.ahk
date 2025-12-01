#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_REGISTERED_FORMAT.ahk

/**
 * Specifies information about a series of fingerprint or palm samples.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bdb-ansi-381-header
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_BDB_ANSI_381_HEADER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of this structure plus the size of all [**WINBIO\_BDB\_ANSI\_381\_RECORD**](winbio-bdb-ansi-381-record.md) structures for the fingerprint or palm samples captured from an end user. Only the low six bytes are valid.
     * @type {Integer}
     */
    RecordLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the format. Currently, this must be 0x46495200.
     * @type {Integer}
     */
    FormatIdentifier {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the version number. Currently this must be 0x30313000 which corresponds internally to 0.1.0.0.
     * @type {Integer}
     */
    VersionNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A [**WINBIO\_REGISTERED\_FORMAT**](winbio-registered-format.md) structure that contains the registered data format as an owner/type pair.
     * @type {WINBIO_REGISTERED_FORMAT}
     */
    ProductId{
        get {
            if(!this.HasProp("__ProductId"))
                this.__ProductId := WINBIO_REGISTERED_FORMAT(16, this)
            return this.__ProductId
        }
    }

    /**
     * Contains the unit ID of the device used to capture the sample.
     * @type {Integer}
     */
    CaptureDeviceId {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * Specifies the resolution level at which the sample is captured.
     * @type {Integer}
     */
    ImageAcquisitionLevel {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * Specifies the horizontal resolution of the scan.
     * @type {Integer}
     */
    HorizontalScanResolution {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Specifies the vertical resolution of the scan.
     * @type {Integer}
     */
    VerticalScanResolution {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * Specifies the horizontal resolution of the captured fingerprint or palm image.
     * @type {Integer}
     */
    HorizontalImageResolution {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * Specifies the vertical resolution of the captured fingerprint or palm image.
     * @type {Integer}
     */
    VerticalImageResolution {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * Number of finger or palm records in this structure.
     * @type {Integer}
     */
    ElementCount {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * Contains the unit of measure, 1 for inches and 2 for centimeters.
     * @type {Integer}
     */
    ScaleUnits {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }

    /**
     * Specifies the number of bits in a pixel. This can be 1 to 16 bits per pixel for color.
     * @type {Integer}
     */
    PixelDepth {
        get => NumGet(this, 34, "char")
        set => NumPut("char", value, this, 34)
    }

    /**
     * Specifies the algorithm used to compress the finger or palm image.
     * @type {Integer}
     */
    ImageCompressionAlg {
        get => NumGet(this, 35, "char")
        set => NumPut("char", value, this, 35)
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }
}
