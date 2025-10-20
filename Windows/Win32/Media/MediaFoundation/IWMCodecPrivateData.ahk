#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the private codec data that must be appended to the output media type. This codec data is required for properly decoding Windows Media Video content.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecprivatedata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecPrivateData extends IUnknown{
    /**
     * The interface identifier for IWMCodecPrivateData
     * @type {Guid}
     */
    static IID => Guid("{73f0be8e-57f7-4f01-aa66-9f57340cfe0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    SetPartialOutputType(pmt) {
        result := ComCall(3, this, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbData 
     * @param {Pointer<UInt32>} pcbData 
     * @returns {HRESULT} 
     */
    GetPrivateData(pbData, pcbData) {
        result := ComCall(4, this, "char*", pbData, "uint*", pcbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
