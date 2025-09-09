#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the data that you want to provide as input to a protection system function.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfcontentprotectiondevice_input_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCONTENTPROTECTIONDEVICE_INPUT_DATA extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The identifier of the function that you need to run. This value is defined by the implementation of the protection system.
     * @type {Integer}
     */
    HWProtectionFunctionID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the private data that the implementation of  the security processor implementation reserved. You can determine this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentprotectiondevice-getprivatedatabytecount">IMFContentProtectionDevice::GetPrivateDataByteCount</a> method.
     * @type {Integer}
     */
    PrivateDataByteCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the data provided as input to the protection system function that you want to run.
     * @type {Integer}
     */
    HWProtectionDataByteCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The data to provide as input to the protection system function.
     * 
     * If the value of the <b>PrivateDataByteCount</b> member is greater than 0, bytes 0 through <b>PrivateDataByteCount</b> - 1 are reserved for use by the independent hardware vendor (IHV). Bytes <b>PrivateDataByteCount</b> through <b>HWProtectionDataByteCount</b> + <b>PrivateDataByteCount</b> - 1 contain the input data for the protection system function.   
     * 
     * The protection system specification defines the format and size of the DRM function.
     * @type {Array<Byte>}
     */
    InputData{
        get {
            if(!this.HasProp("__InputDataProxyArray"))
                this.__InputDataProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "char")
            return this.__InputDataProxyArray
        }
    }
}
