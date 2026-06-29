#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Marshals an interface pointer to and from a stream.Stream objects that support IStream can expose this interface to provide custom marshaling for interface pointers.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfobjectreferencestream
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFObjectReferenceStream extends IUnknown {
    /**
     * The interface identifier for IMFObjectReferenceStream
     * @type {Guid}
     */
    static IID := Guid("{09ef5be3-c8a7-469e-8b70-73bf25bb193f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFObjectReferenceStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SaveReference : IntPtr
        LoadReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFObjectReferenceStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Stores the data needed to marshal an interface across a process boundary.
     * @param {Pointer<Guid>} riid Interface identifier of the interface to marshal.
     * @param {IUnknown} pUnk Pointer to the <b>IUnknown</b> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfobjectreferencestream-savereference
     */
    SaveReference(riid, pUnk) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * Marshals an interface from data stored in the stream.
     * @param {Pointer<Guid>} riid Interface identifier of the interface to marshal.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfobjectreferencestream-loadreference
     */
    LoadReference(riid) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IMFObjectReferenceStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SaveReference := CallbackCreate(GetMethod(implObj, "SaveReference"), flags, 3)
        this.vtbl.LoadReference := CallbackCreate(GetMethod(implObj, "LoadReference"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SaveReference)
        CallbackFree(this.vtbl.LoadReference)
    }
}
