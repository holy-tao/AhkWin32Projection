#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaType.ahk" { IMFMediaType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the management of stream configurations for a multiplexed media source. A stream configuration defines a set of substreams that can be included the multiplexed output.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfmuxstreammediatypemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMuxStreamMediaTypeManager extends IUnknown {
    /**
     * The interface identifier for IMFMuxStreamMediaTypeManager
     * @type {Guid}
     */
    static IID := Guid("{505a2c72-42f7-4690-aeab-8f513d0ffdb8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMuxStreamMediaTypeManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStreamCount              : IntPtr
        GetMediaType                : IntPtr
        GetStreamConfigurationCount : IntPtr
        AddStreamConfiguration      : IntPtr
        RemoveStreamConfiguration   : IntPtr
        GetStreamConfiguration      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMuxStreamMediaTypeManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the count of substreams managed by the multiplexed media source. (IMFMuxStreamMediaTypeManager.GetStreamCount)
     * @returns {Integer} The count of substreams managed by the multiplexed media source.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pdwMuxStreamCount := 0, "HRESULT")
        return pdwMuxStreamCount
    }

    /**
     * Gets the IMFMediaType of the substream with the specified index.
     * @param {Integer} dwMuxStreamIndex The index of the substream for which the media type is retrieved.
     * @returns {IMFMediaType} The media type of the substream with the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getmediatype
     */
    GetMediaType(dwMuxStreamIndex) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Gets the count of registered stream configurations, which define set of substreams that can be included the multiplexed output.
     * @returns {Integer} The number of registered stream configurations.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfigurationcount
     */
    GetStreamConfigurationCount() {
        result := ComCall(5, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Registers a stream configuration, which defines a set of substreams that can be included the multiplexed output.
     * @remarks
     * Stream configurations are ordered within the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmuxstreammediatypemanager">IMFMuxStreamMediaTypeManager</a> by the numeric value of the bitmask.
     * @param {Integer} ullStreamMask A bitmask value where the bits that are on represent the indices of the substreams that are included in the stream configuration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified configuration is already registered.
     *               
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
     * The supplied bitmask has bits set that are invalid for the media source.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-addstreamconfiguration
     */
    AddStreamConfiguration(ullStreamMask) {
        result := ComCall(6, this, "uint", ullStreamMask, "HRESULT")
        return result
    }

    /**
     * Unregisters a stream configuration, which defines a set of substreams that can be included the multiplexed output.
     * @param {Integer} ullStreamMask A bitmask value where the bits that are on represent the indices of the substreams that are included in the stream configuration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified configuration is not currently registered.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-removestreamconfiguration
     */
    RemoveStreamConfiguration(ullStreamMask) {
        result := ComCall(7, this, "uint", ullStreamMask, "HRESULT")
        return result
    }

    /**
     * Gets the stream configuration with the specified index, which defines a set of substreams that can be included the multiplexed output.
     * @remarks
     * Stream configurations are ordered within the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmuxstreammediatypemanager">IMFMuxStreamMediaTypeManager</a> by the numeric value of the bitmask.
     * @param {Integer} ulIndex The index of the configuration to retrieve.
     * @returns {Integer} The index of the configuration to retrieve.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreammediatypemanager-getstreamconfiguration
     */
    GetStreamConfiguration(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "uint*", &pullStreamMask := 0, "HRESULT")
        return pullStreamMask
    }

    Query(iid) {
        if (IMFMuxStreamMediaTypeManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreamCount := CallbackCreate(GetMethod(implObj, "GetStreamCount"), flags, 2)
        this.vtbl.GetMediaType := CallbackCreate(GetMethod(implObj, "GetMediaType"), flags, 3)
        this.vtbl.GetStreamConfigurationCount := CallbackCreate(GetMethod(implObj, "GetStreamConfigurationCount"), flags, 2)
        this.vtbl.AddStreamConfiguration := CallbackCreate(GetMethod(implObj, "AddStreamConfiguration"), flags, 2)
        this.vtbl.RemoveStreamConfiguration := CallbackCreate(GetMethod(implObj, "RemoveStreamConfiguration"), flags, 2)
        this.vtbl.GetStreamConfiguration := CallbackCreate(GetMethod(implObj, "GetStreamConfiguration"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreamCount)
        CallbackFree(this.vtbl.GetMediaType)
        CallbackFree(this.vtbl.GetStreamConfigurationCount)
        CallbackFree(this.vtbl.AddStreamConfiguration)
        CallbackFree(this.vtbl.RemoveStreamConfiguration)
        CallbackFree(this.vtbl.GetStreamConfiguration)
    }
}
