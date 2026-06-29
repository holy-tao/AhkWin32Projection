#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains information about the data you received as output from a protection system function.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfcontentprotectiondevice_output_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCONTENTPROTECTIONDEVICE_OUTPUT_DATA {
    #StructPack 8

    /**
     * The size of the private data that the implementation of the security processor reserves, in bytes. You can determine this value  by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentprotectiondevice-getprivatedatabytecount">IMFContentProtectionDevice::GetPrivateDataByteCount</a> method.
     */
    PrivateDataByteCount : UInt32

    /**
     * The maximum size of data that the independent hardware vendor (IHV) can return in the output buffer, in bytes.
     */
    MaxHWProtectionDataByteCount : UInt32

    /**
     * The size of the data that the  IHV wrote to the output buffer, in bytes.
     */
    HWProtectionDataByteCount : UInt32

    /**
     * The result of the protection system function.
     */
    Status : HRESULT

    /**
     * The number of 100 nanosecond units spent transporting the data.
     */
    TransportTimeInHundredsOfNanoseconds : Int64

    /**
     * The number of 100 nanosecond units spent running the protection system function.
     */
    ExecutionTimeInHundredsOfNanoseconds : Int64

    /**
     * The output of the protection system function.
     * 
     * If the value of the <b>PrivateDataByteCount</b> member is greater than 0, bytes 0 through <b>PrivateDataByteCount</b> - 1 are reserved for IHV use.  
     *     Bytes <b>PrivateDataByteCount</b> through <b>MaxHWProtectionDataByteCount</b> + <b>PrivateDataByteCount</b> - 1 contain the region   
     *     of the array into which the driver should return the output data from the protection system function.
     * 
     * The protection system specification defines the format and size of the   
     *     function.
     */
    OutputData : Int8[4]

}
