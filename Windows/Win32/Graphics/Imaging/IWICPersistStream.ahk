#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IPersistStream.ahk" { IPersistStream }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Exposes methods that provide additional load and save methods that take WICPersistOptions.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicpersiststream
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICPersistStream extends IPersistStream {
    /**
     * The interface identifier for IWICPersistStream
     * @type {Guid}
     */
    static IID := Guid("{00675040-6908-45f8-86a3-49c7dfd6d9ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICPersistStream interfaces
    */
    struct Vtbl extends IPersistStream.Vtbl {
        LoadEx : IntPtr
        SaveEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICPersistStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Loads data from an input stream using the given parameters.
     * @remarks
     * NULL can be passed in for <i>pguidPreferredVendor</i> to indicate no preference.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to the input stream.
     * @param {Pointer<Guid>} pguidPreferredVendor Type: <b>const GUID*</b>
     * 
     * Pointer to the GUID of the preferred vendor .
     * @param {Integer} dwPersistOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> used to load the stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicpersiststream-loadex
     */
    LoadEx(pIStream, pguidPreferredVendor, dwPersistOptions) {
        result := ComCall(8, this, "ptr", pIStream, Guid.Ptr, pguidPreferredVendor, "uint", dwPersistOptions, "HRESULT")
        return result
    }

    /**
     * Saves the IWICPersistStream to the given input IStream using the given parameters.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to save to.
     * @param {Integer} dwPersistOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a>  to use when saving.
     * @param {BOOL} fClearDirty Type: <b>BOOL</b>
     * 
     * Indicates whether the "dirty" value will be cleared from all metadata after saving.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicpersiststream-saveex
     */
    SaveEx(pIStream, dwPersistOptions, fClearDirty) {
        result := ComCall(9, this, "ptr", pIStream, "uint", dwPersistOptions, BOOL, fClearDirty, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICPersistStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadEx := CallbackCreate(GetMethod(implObj, "LoadEx"), flags, 4)
        this.vtbl.SaveEx := CallbackCreate(GetMethod(implObj, "SaveEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadEx)
        CallbackFree(this.vtbl.SaveEx)
    }
}
