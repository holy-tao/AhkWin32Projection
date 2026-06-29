#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for a stream provider.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicstreamprovider
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICStreamProvider extends IUnknown {
    /**
     * The interface identifier for IWICStreamProvider
     * @type {Guid}
     */
    static IID := Guid("{449494bc-b468-4927-96d7-ba90d31ab505}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICStreamProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStream              : IntPtr
        GetPersistOptions      : IntPtr
        GetPreferredVendorGUID : IntPtr
        RefreshStream          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICStreamProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the stream held by the component.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * Pointer that receives a pointer to the stream held by the component.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getstream
     */
    GetStream() {
        result := ComCall(3, this, "ptr*", &ppIStream := 0, "HRESULT")
        return IStream(ppIStream)
    }

    /**
     * Gets the persist options used when initializing the component with a stream.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Pointer that receives the persist options used when initializing the component with a stream. If none were provided, <b>WICPersistOptionDefault</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getpersistoptions
     */
    GetPersistOptions() {
        result := ComCall(4, this, "uint*", &pdwPersistOptions := 0, "HRESULT")
        return pdwPersistOptions
    }

    /**
     * Gets the preferred vendor GUID.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the preferred vendor GUID.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getpreferredvendorguid
     */
    GetPreferredVendorGUID() {
        pguidPreferredVendor := Guid()
        result := ComCall(5, this, Guid.Ptr, pguidPreferredVendor, "HRESULT")
        return pguidPreferredVendor
    }

    /**
     * Informs the component that the content of the stream it's holding onto may have changed. The component should respond by dirtying any cached information from the stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicstreamprovider-refreshstream
     */
    RefreshStream() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICStreamProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
        this.vtbl.GetPersistOptions := CallbackCreate(GetMethod(implObj, "GetPersistOptions"), flags, 2)
        this.vtbl.GetPreferredVendorGUID := CallbackCreate(GetMethod(implObj, "GetPreferredVendorGUID"), flags, 2)
        this.vtbl.RefreshStream := CallbackCreate(GetMethod(implObj, "RefreshStream"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.GetPersistOptions)
        CallbackFree(this.vtbl.GetPreferredVendorGUID)
        CallbackFree(this.vtbl.RefreshStream)
    }
}
