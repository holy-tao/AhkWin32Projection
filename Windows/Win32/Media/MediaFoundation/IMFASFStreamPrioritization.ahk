#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFASFStreamPrioritization.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Not implemented.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfstreamprioritization
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFStreamPrioritization extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFStreamPrioritization
     * @type {Guid}
     */
    static IID => Guid("{699bdc27-bbaf-49ff-8e38-9c39c9b5e088}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetStream", "AddStream", "RemoveStream", "Clone"]

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Retrieves the number of entries in the stream priority list.
     * @returns {Integer} Receives the number of streams in the stream priority list.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Retrieves the stream number of a stream in the stream priority list.
     * @param {Integer} dwStreamIndex Zero-based index of the entry to retrieve from the stream priority list. To get the number of entries in the priority list, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstreamcount">IMFASFStreamPrioritization::GetStreamCount</a>.
     * @param {Pointer<Integer>} pwStreamNumber Receives the stream number of the stream priority entry.
     * @param {Pointer<Integer>} pwStreamFlags Receives a Boolean value. If <b>TRUE</b>, the stream is mandatory.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument or the <i>dwStreamIndex</i> parameter is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstream
     */
    GetStream(dwStreamIndex, pwStreamNumber, pwStreamFlags) {
        pwStreamNumberMarshal := pwStreamNumber is VarRef ? "ushort*" : "ptr"
        pwStreamFlagsMarshal := pwStreamFlags is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "uint", dwStreamIndex, pwStreamNumberMarshal, pwStreamNumber, pwStreamFlagsMarshal, pwStreamFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Adds a stream to the stream priority list.
     * @param {Integer} wStreamNumber Stream number of the stream to add.
     * @param {Integer} wStreamFlags If <b>TRUE</b>, the stream is mandatory.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamprioritization-addstream
     */
    AddStream(wStreamNumber, wStreamFlags) {
        result := ComCall(5, this, "ushort", wStreamNumber, "ushort", wStreamFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Removes a stream from the stream priority list.
     * @param {Integer} dwStreamIndex Index of the entry in the stream priority list to remove. Values range from zero, to one less than the stream count retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstreamcount">IMFASFStreamPrioritization::GetStreamCount</a>.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamprioritization-removestream
     */
    RemoveStream(dwStreamIndex) {
        result := ComCall(6, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Note  This interface is not implemented in this version of Media Foundation. Creates a copy of the ASF stream prioritization object.
     * @returns {IMFASFStreamPrioritization} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamprioritization">IMFASFStreamPrioritization</a> interface of the new object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamprioritization-clone
     */
    Clone() {
        result := ComCall(7, this, "ptr*", &ppIStreamPrioritization := 0, "HRESULT")
        return IMFASFStreamPrioritization(ppIStreamPrioritization)
    }
}
