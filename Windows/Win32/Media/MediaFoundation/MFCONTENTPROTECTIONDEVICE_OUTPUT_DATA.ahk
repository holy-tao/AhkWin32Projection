#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the data you received as output from a protection system function.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-mfcontentprotectiondevice_output_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCONTENTPROTECTIONDEVICE_OUTPUT_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size of the private data that the implementation of the security processor reserves, in bytes. You can determine this value  by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentprotectiondevice-getprivatedatabytecount">IMFContentProtectionDevice::GetPrivateDataByteCount</a> method.
     * @type {Integer}
     */
    PrivateDataByteCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum size of data that the independent hardware vendor (IHV) can return in the output buffer, in bytes.
     * @type {Integer}
     */
    MaxHWProtectionDataByteCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the data that the  IHV wrote to the output buffer, in bytes.
     * @type {Integer}
     */
    HWProtectionDataByteCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The result of the protection system function.
     * @type {HRESULT}
     */
    Status {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The number of 100 nanosecond units spent transporting the data.
     * @type {Integer}
     */
    TransportTimeInHundredsOfNanoseconds {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The number of 100 nanosecond units spent running the protection system function.
     * @type {Integer}
     */
    ExecutionTimeInHundredsOfNanoseconds {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The output of the protection system function.
     * 
     * If the value of the <b>PrivateDataByteCount</b> member is greater than 0, bytes 0 through <b>PrivateDataByteCount</b> - 1 are reserved for IHV use.  
     *     Bytes <b>PrivateDataByteCount</b> through <b>MaxHWProtectionDataByteCount</b> + <b>PrivateDataByteCount</b> - 1 contain the region   
     *     of the array into which the driver should return the output data from the protection system function.
     * 
     * The protection system specification defines the format and size of the   
     *     function.
     * @type {Array<Byte>}
     */
    OutputData{
        get {
            if(!this.HasProp("__OutputDataProxyArray"))
                this.__OutputDataProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "char")
            return this.__OutputDataProxyArray
        }
    }
}
