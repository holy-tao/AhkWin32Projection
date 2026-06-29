#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the data that you want to provide as input to a protection system function.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfcontentprotectiondevice_input_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCONTENTPROTECTIONDEVICE_INPUT_DATA {
    #StructPack 4

    /**
     * The identifier of the function that you need to run. This value is defined by the implementation of the protection system.
     */
    HWProtectionFunctionID : UInt32

    /**
     * The size of the private data that the implementation of  the security processor implementation reserved. You can determine this value by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentprotectiondevice-getprivatedatabytecount">IMFContentProtectionDevice::GetPrivateDataByteCount</a> method.
     */
    PrivateDataByteCount : UInt32

    /**
     * The size of the data provided as input to the protection system function that you want to run.
     */
    HWProtectionDataByteCount : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * The data to provide as input to the protection system function.
     * 
     * If the value of the <b>PrivateDataByteCount</b> member is greater than 0, bytes 0 through <b>PrivateDataByteCount</b> - 1 are reserved for use by the independent hardware vendor (IHV). Bytes <b>PrivateDataByteCount</b> through <b>HWProtectionDataByteCount</b> + <b>PrivateDataByteCount</b> - 1 contain the input data for the protection system function.   
     * 
     * The protection system specification defines the format and size of the DRM function.
     */
    InputData : Int8[4]

}
