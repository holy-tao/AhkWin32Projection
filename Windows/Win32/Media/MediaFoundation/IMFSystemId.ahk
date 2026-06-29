#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method that retrieves system id data.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsystemid
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSystemId extends IUnknown {
    /**
     * The interface identifier for IMFSystemId
     * @type {Guid}
     */
    static IID := Guid("{fff4af3a-1fc1-4ef9-a29b-d26c49e2f31a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSystemId interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetData : IntPtr
        Setup   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSystemId.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves system id data.
     * @param {Pointer<Integer>} _size The size in bytes of the returned data.
     * @param {Pointer<Pointer<Integer>>} data Receives the returned data.  The caller must free this buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsystemid-getdata
     */
    GetData(_size, data) {
        _sizeMarshal := _size is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, _sizeMarshal, _size, dataMarshal, data, "HRESULT")
        return result
    }

    /**
     * Sets up the IMFSystemId.
     * @param {Integer} stage Stage in the setup process. 0 or 1.
     * @param {Integer} cbIn Size of the input buffer.
     * @param {Integer} pbIn The input buffer.
     * @param {Pointer<Integer>} pcbOut Size of output buffer.
     * @param {Pointer<Pointer<Integer>>} ppbOut The output buffer.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsystemid-setup
     */
    Setup(stage, cbIn, pbIn, pcbOut, ppbOut) {
        pcbOutMarshal := pcbOut is VarRef ? "uint*" : "ptr"
        ppbOutMarshal := ppbOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", stage, "uint", cbIn, "ptr", pbIn, pcbOutMarshal, pcbOut, ppbOutMarshal, ppbOut, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSystemId.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 3)
        this.vtbl.Setup := CallbackCreate(GetMethod(implObj, "Setup"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.Setup)
    }
}
