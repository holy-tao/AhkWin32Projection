#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the private codec data that must be appended to the output media type. This codec data is required for properly decoding Windows Media Video content.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nn-wmcodecdsp-iwmcodecprivatedata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecPrivateData extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPartialOutputType", "GetPrivateData"]

    /**
     * Gives the codec the output media type without the codec data. This enables the codec to generate the private data.
     * @remarks
     * The DMO_MEDIA_TYPE that you pass to this method is only partial in that it does not include the appended private data. It must be complete in all other ways.
     * 
     * If you are setting properties on an encoder, you must finish that configuration before getting the private data. Changing properties invalidates any private data previously retrieved. If you change properties after getting the private data, retrieve it again and reset the output type.
     * 
     * You must call this method before calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecprivatedata-getprivatedata">IWMCodecPrivateData::GetPrivateData</a> to get the private data.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Address of the partial output media type.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-iwmcodecprivatedata-setpartialoutputtype
     */
    SetPartialOutputType(pmt) {
        result := ComCall(3, this, "ptr", pmt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the codec data for the video content based on the output type passed using the IWMCodecPrivateData::SetPartialOutputType method.
     * @remarks
     * If you are setting properties on the encoder object, you must finish that configuration before getting the private data. Changing properties invalidates any private data that was previously retrieved. If you change properties after getting the private data, retrieve it again and reset the output type.
     * 
     * You must call this method after providing the codec with the output media type (without the private data appended) by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecprivatedata-setpartialoutputtype">IWMCodecPrivateData::SetPartialOutputType</a>.
     * 
     * After retrieving the private data, allocate a buffer the size of VIDEOINFOHEADER plus <i>pcbData</i>. Then copy the data from your partial output type to the beginning of the buffer and append the private data.
     * @param {Pointer<Integer>} pbData Address of the buffer that receives the private data. If you set this to <b>NULL</b>, the size required to hold the private data will be returned in <i>pcbData</i>.
     * @param {Pointer<Integer>} pcbData Pointer to the size of the private data in bytes. If pbData is <b>NULL</b>, the method will set this to the correct value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmcodecdsp/nf-wmcodecdsp-iwmcodecprivatedata-getprivatedata
     */
    GetPrivateData(pbData, pcbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbDataMarshal, pbData, pcbDataMarshal, pcbData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
