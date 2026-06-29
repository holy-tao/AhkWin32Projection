#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import ".\IMFMediaType.ahk" { IMFMediaType }

/**
 * Configures the settings of a stream in an ASF file.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nn-wmcontainer-imfasfstreamconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFASFStreamConfig extends IMFAttributes {
    /**
     * The interface identifier for IMFASFStreamConfig
     * @type {Guid}
     */
    static IID := Guid("{9e8ae8d2-dbbd-4200-9aca-06e6df484913}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFASFStreamConfig interfaces
    */
    struct Vtbl extends IMFAttributes.Vtbl {
        GetStreamType              : IntPtr
        GetStreamNumber            : IntPtr
        SetStreamNumber            : IntPtr
        GetMediaType               : IntPtr
        SetMediaType               : IntPtr
        GetPayloadExtensionCount   : IntPtr
        GetPayloadExtension        : IntPtr
        AddPayloadExtension        : IntPtr
        RemoveAllPayloadExtensions : IntPtr
        Clone                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFASFStreamConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the major media type of the stream.
     * @returns {Guid} Receives the major media type for the stream. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getstreamtype
     */
    GetStreamType() {
        pguidStreamType := Guid()
        result := ComCall(33, this, Guid.Ptr, pguidStreamType, "HRESULT")
        return pguidStreamType
    }

    /**
     * Retrieves the stream number of the stream.
     * @returns {Integer} The method returns the  stream number.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getstreamnumber
     */
    GetStreamNumber() {
        result := ComCall(34, this, UInt16)
        return result
    }

    /**
     * Assigns a stream number to the stream.
     * @remarks
     * Stream numbers start from 1 and do not need to be sequential.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-setstreamnumber
     */
    SetStreamNumber(wStreamNum) {
        result := ComCall(35, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * Retrieves the media type of the stream.
     * @remarks
     * To reduce unnecessary copying, the method returns a pointer to the media type  that is stored internally by the object. Do not modify the returned media type,  as the results are not defined.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type object associated with the stream. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getmediatype
     */
    GetMediaType() {
        result := ComCall(36, this, "ptr*", &ppIMediaType := 0, "HRESULT")
        return IMFMediaType(ppIMediaType)
    }

    /**
     * Sets the media type for the Advanced Systems Format (ASF) stream configuration object.
     * @remarks
     * Some validation of the media type is performed by this method. However, a media type can be successfully set, but cause an error when the stream is added to the profile.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-setmediatype
     */
    SetMediaType(pIMediaType) {
        result := ComCall(37, this, "ptr", pIMediaType, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of payload extensions that are configured for the stream.
     * @returns {Integer} Receives the number of payload extensions.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getpayloadextensioncount
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-getpayloadextension
     */
    GetPayloadExtension(wPayloadExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo) {
        pcbExtensionDataSizeMarshal := pcbExtensionDataSize is VarRef ? "ushort*" : "ptr"
        pbExtensionSystemInfoMarshal := pbExtensionSystemInfo is VarRef ? "char*" : "ptr"
        pcbExtensionSystemInfoMarshal := pcbExtensionSystemInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, "ushort", wPayloadExtensionNumber, Guid.Ptr, pguidExtensionSystemID, pcbExtensionDataSizeMarshal, pcbExtensionDataSize, pbExtensionSystemInfoMarshal, pbExtensionSystemInfo, pcbExtensionSystemInfoMarshal, pcbExtensionSystemInfo, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-addpayloadextension
     */
    AddPayloadExtension(guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo) {
        pbExtensionSystemInfoMarshal := pbExtensionSystemInfo is VarRef ? "char*" : "ptr"

        result := ComCall(40, this, Guid, guidExtensionSystemID, "ushort", cbExtensionDataSize, pbExtensionSystemInfoMarshal, pbExtensionSystemInfo, "uint", cbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * Removes all payload extensions that are configured for the stream.
     * @remarks
     * None.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-removeallpayloadextensions
     */
    RemoveAllPayloadExtensions() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the Advanced Systems Format (ASF) stream configuration object.
     * @remarks
     * The cloned object is completely independent of the original.
     * @returns {IMFASFStreamConfig} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamconfig">IMFASFStreamConfig</a> interface of the new object. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamconfig-clone
     */
    Clone() {
        result := ComCall(42, this, "ptr*", &ppIStreamConfig := 0, "HRESULT")
        return IMFASFStreamConfig(ppIStreamConfig)
    }

    Query(iid) {
        if (IMFASFStreamConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreamType := CallbackCreate(GetMethod(implObj, "GetStreamType"), flags, 2)
        this.vtbl.GetStreamNumber := CallbackCreate(GetMethod(implObj, "GetStreamNumber"), flags, 1)
        this.vtbl.SetStreamNumber := CallbackCreate(GetMethod(implObj, "SetStreamNumber"), flags, 2)
        this.vtbl.GetMediaType := CallbackCreate(GetMethod(implObj, "GetMediaType"), flags, 2)
        this.vtbl.SetMediaType := CallbackCreate(GetMethod(implObj, "SetMediaType"), flags, 2)
        this.vtbl.GetPayloadExtensionCount := CallbackCreate(GetMethod(implObj, "GetPayloadExtensionCount"), flags, 2)
        this.vtbl.GetPayloadExtension := CallbackCreate(GetMethod(implObj, "GetPayloadExtension"), flags, 6)
        this.vtbl.AddPayloadExtension := CallbackCreate(GetMethod(implObj, "AddPayloadExtension"), flags, 5)
        this.vtbl.RemoveAllPayloadExtensions := CallbackCreate(GetMethod(implObj, "RemoveAllPayloadExtensions"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreamType)
        CallbackFree(this.vtbl.GetStreamNumber)
        CallbackFree(this.vtbl.SetStreamNumber)
        CallbackFree(this.vtbl.GetMediaType)
        CallbackFree(this.vtbl.SetMediaType)
        CallbackFree(this.vtbl.GetPayloadExtensionCount)
        CallbackFree(this.vtbl.GetPayloadExtension)
        CallbackFree(this.vtbl.AddPayloadExtension)
        CallbackFree(this.vtbl.RemoveAllPayloadExtensions)
        CallbackFree(this.vtbl.Clone)
    }
}
