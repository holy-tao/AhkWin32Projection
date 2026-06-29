#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaSource.ahk" { IMFMediaSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Extends the IMFMediaSource interface to provide additional capabilities for a media source.
 * @remarks
 * Implementations of this interface can return <b>E_NOTIMPL</b> for any methods that are not required by the media source.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfmediasourceex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSourceEx extends IMFMediaSource {
    /**
     * The interface identifier for IMFMediaSourceEx
     * @type {Guid}
     */
    static IID := Guid("{3c9b2eb9-86d5-4514-a394-f56664f9f0d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSourceEx interfaces
    */
    struct Vtbl extends IMFMediaSource.Vtbl {
        GetSourceAttributes : IntPtr
        GetStreamAttributes : IntPtr
        SetD3DManager       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSourceEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an attribute store for the media source.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> pointer to get or set attributes that apply to the entire source. For stream-level attributes, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasourceex-getstreamattributes">IMFMediaSourceEx::GetStreamAttributes</a> method instead.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasourceex-getsourceattributes
     */
    GetSourceAttributes() {
        result := ComCall(13, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * Gets an attribute store for a stream on the media source.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> pointer to get or set attributes that apply to the specified stream. For attributes that apply to the entire source, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasourceex-getsourceattributes">IMFMediaSourceEx::GetSourceAttributes</a> method instead.
     * @param {Integer} dwStreamIdentifier The identifier of the stream. To get the identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamdescriptor-getstreamidentifier">IMFStreamDescriptor::GetStreamIdentifier</a> on the stream descriptor.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasourceex-getstreamattributes
     */
    GetStreamAttributes(dwStreamIdentifier) {
        result := ComCall(14, this, "uint", dwStreamIdentifier, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * Sets a pointer to the Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager on the media source.
     * @param {IUnknown} pManager A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the DXGI Manager. The media source should query this pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source does not support source-level attributes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasourceex-setd3dmanager
     */
    SetD3DManager(pManager) {
        result := ComCall(15, this, "ptr", pManager, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaSourceEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSourceAttributes := CallbackCreate(GetMethod(implObj, "GetSourceAttributes"), flags, 2)
        this.vtbl.GetStreamAttributes := CallbackCreate(GetMethod(implObj, "GetStreamAttributes"), flags, 3)
        this.vtbl.SetD3DManager := CallbackCreate(GetMethod(implObj, "SetD3DManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSourceAttributes)
        CallbackFree(this.vtbl.GetStreamAttributes)
        CallbackFree(this.vtbl.SetD3DManager)
    }
}
