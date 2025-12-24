#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include .\IMFASFStreamConfig.ahk
#Include .\IMFAttributes.ahk

/**
 * Configures the settings of a stream in an ASF file.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfstreamconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFStreamConfig extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFStreamConfig
     * @type {Guid}
     */
    static IID => Guid("{9e8ae8d2-dbbd-4200-9aca-06e6df484913}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamType", "GetStreamNumber", "SetStreamNumber", "GetMediaType", "SetMediaType", "GetPayloadExtensionCount", "GetPayloadExtension", "AddPayloadExtension", "RemoveAllPayloadExtensions", "Clone"]

    /**
     * Gets the major media type of the stream.
     * @returns {Guid} Receives the major media type for the stream. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-getstreamtype
     */
    GetStreamType() {
        pguidStreamType := Guid()
        result := ComCall(33, this, "ptr", pguidStreamType, "HRESULT")
        return pguidStreamType
    }

    /**
     * Retrieves the stream number of the stream.
     * @returns {Integer} The method returns the  stream number.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-getstreamnumber
     */
    GetStreamNumber() {
        result := ComCall(34, this, "ushort")
        return result
    }

    /**
     * Assigns a stream number to the stream.
     * @param {Integer} wStreamNum The number to assign to the stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-setstreamnumber
     */
    SetStreamNumber(wStreamNum) {
        result := ComCall(35, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * Retrieves the media type of the stream.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type object associated with the stream. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-getmediatype
     */
    GetMediaType() {
        result := ComCall(36, this, "ptr*", &ppIMediaType := 0, "HRESULT")
        return IMFMediaType(ppIMediaType)
    }

    /**
     * Sets the media type for the Advanced Systems Format (ASF) stream configuration object.
     * @param {IMFMediaType} pIMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a configured media type object.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-setmediatype
     */
    SetMediaType(pIMediaType) {
        result := ComCall(37, this, "ptr", pIMediaType, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of payload extensions that are configured for the stream.
     * @returns {Integer} Receives the number of payload extensions.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-getpayloadextensioncount
     */
    GetPayloadExtensionCount() {
        result := ComCall(38, this, "ushort*", &pcPayloadExtensions := 0, "HRESULT")
        return pcPayloadExtensions
    }

    /**
     * Retrieves information about an existing payload extension.
     * @param {Integer} wPayloadExtensionNumber The payload extension index. Valid indexes range from 0, to one less than the number of extensions obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getpayloadextensioncount">IMFASFStreamConfig::GetPayloadExtensionCount</a>.
     * @param {Pointer<Guid>} pguidExtensionSystemID Receives a GUID that identifies the payload extension. For a list of predefined payload extensions, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-payload-extension-guids">ASF Payload Extension GUIDs</a>. Applications can also define custom payload extensions.
     * @param {Pointer<Integer>} pcbExtensionDataSize Receives the number of bytes added to each sample for the extension.
     * @param {Pointer<Integer>} pbExtensionSystemInfo Pointer to a buffer that receives information about this extension system. This information is the same for all samples and is stored in the content header (not in each sample). This parameter can be <b>NULL</b>. To find the required size of the buffer, set this parameter to <b>NULL</b>; the size is returned in <i>pcbExtensionSystemInfo</i>.
     * @param {Pointer<Integer>} pcbExtensionSystemInfo On input, specifies the size of the buffer pointed to by <i>pbExtensionSystemInfo</i>. On output, receives the required size of the <i>pbExtensionSystemInfo</i> buffer in bytes.
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
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified in <i>pbExtensionSystemInfo</i> is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>wPayloadExtensionNumber</i> parameter is out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-getpayloadextension
     */
    GetPayloadExtension(wPayloadExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo) {
        pcbExtensionDataSizeMarshal := pcbExtensionDataSize is VarRef ? "ushort*" : "ptr"
        pbExtensionSystemInfoMarshal := pbExtensionSystemInfo is VarRef ? "char*" : "ptr"
        pcbExtensionSystemInfoMarshal := pcbExtensionSystemInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, "ushort", wPayloadExtensionNumber, "ptr", pguidExtensionSystemID, pcbExtensionDataSizeMarshal, pcbExtensionDataSize, pbExtensionSystemInfoMarshal, pbExtensionSystemInfo, pcbExtensionSystemInfoMarshal, pcbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * Configures a payload extension for the stream.
     * @param {Guid} guidExtensionSystemID Pointer to a GUID that identifies the payload extension. For a list of predefined payload extensions, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-payload-extension-guids">ASF Payload Extension GUIDs</a>. Applications can also define custom payload extensions.
     * @param {Integer} cbExtensionDataSize Number of bytes added to each sample for the extension.
     * @param {Pointer<Integer>} pbExtensionSystemInfo A pointer to a buffer that contains information about this extension system. This information is the same for all samples and is stored in the content header (not with each sample). This parameter can be <b>NULL</b> if <i>cbExtensionSystemInfo</i> is 0.
     * @param {Integer} cbExtensionSystemInfo Amount of data, in bytes, that describes this extension system. If this value is 0, then <i>pbExtensionSystemInfo</i> can be <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-addpayloadextension
     */
    AddPayloadExtension(guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo) {
        pbExtensionSystemInfoMarshal := pbExtensionSystemInfo is VarRef ? "char*" : "ptr"

        result := ComCall(40, this, "ptr", guidExtensionSystemID, "ushort", cbExtensionDataSize, pbExtensionSystemInfoMarshal, pbExtensionSystemInfo, "uint", cbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * Removes all payload extensions that are configured for the stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-removeallpayloadextensions
     */
    RemoveAllPayloadExtensions() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the Advanced Systems Format (ASF) stream configuration object.
     * @returns {IMFASFStreamConfig} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamconfig">IMFASFStreamConfig</a> interface of the new object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfstreamconfig-clone
     */
    Clone() {
        result := ComCall(42, this, "ptr*", &ppIStreamConfig := 0, "HRESULT")
        return IMFASFStreamConfig(ppIStreamConfig)
    }
}
