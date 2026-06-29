#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDS3D_HRTF_COEFF_FORMAT.ahk
#Include .\KSDS3D_HRTF_FILTER_METHOD.ahk
#Include .\KSDS3D_HRTF_FILTER_VERSION.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSDS3D_HRTF_FILTER_FORMAT_MSG extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {KSDS3D_HRTF_FILTER_METHOD}
     */
    FilterMethod {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {KSDS3D_HRTF_COEFF_FORMAT}
     */
    CoeffFormat {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {KSDS3D_HRTF_FILTER_VERSION}
     */
    Version {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
