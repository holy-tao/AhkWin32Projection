#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An interface from which IDMLDevice and IDMLDeviceChild inherit directly (and all other interfaces, indirectly).
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmlobject
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLObject extends IUnknown {
    /**
     * The interface identifier for IDMLObject
     * @type {Guid}
     */
    static IID := Guid("{c8263aac-9e0c-4a2d-9b8e-007521a3317c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPrivateData          : IntPtr
        SetPrivateData          : IntPtr
        SetPrivateDataInterface : IntPtr
        SetName                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets application-defined data from a DirectML device object.
     * @remarks
     * If the data returned is a pointer to an [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) (or derived interface) that was previously set by [SetPrivateDataInterface](/windows/win32/api/directml/nf-directml-idmlobject-setprivatedatainterface), then that interface will have its reference count incremented before the private data is returned.
     * @param {Pointer<Guid>} guid Type: **[REFGUID](/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50)**
     * 
     * The <b>GUID</b> that is associated with the data.
     * @param {Pointer<Integer>} dataSize Type: <b>[UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * A pointer to a variable that on input contains the size, in bytes, of the buffer that <i>data</i> points to, and on output contains the size, in bytes, of the amount of data that <b>GetPrivateData</b> retrieved.
     * @param {Integer} data Type: <b>void*</b>
     * 
     * A pointer to a memory block that receives the data from the device object if <i>dataSize</i> points to a value that specifies a buffer large enough to hold the data.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlobject-getprivatedata
     */
    GetPrivateData(guid, dataSize, data) {
        dataSizeMarshal := dataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, guid, dataSizeMarshal, dataSize, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Sets application-defined data to a DirectML device object, and associates that data with an application-defined GUID.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The <b>GUID</b> to associate with the data.
     * @param {Integer} dataSize Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The size in bytes of the data.
     * @param {Integer} data Type: <b>const void*</b>
     * 
     * A pointer to a memory block that contains the data to be stored with this DirectML device object. If <i>data</i> is <b>NULL</b>, then <i>dataSize</i> must be 0, and any data that was previously associated with the <b>GUID</b> specified in <i>guid</i> will be destroyed.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlobject-setprivatedata
     */
    SetPrivateData(guid, dataSize, data) {
        result := ComCall(4, this, Guid.Ptr, guid, "uint", dataSize, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Associates an IUnknown-derived interface with the DirectML device object, and associates that interface with an application-defined GUID.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The <b>GUID</b> to associate with the interface.
     * @param {IUnknown} data Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iunknown">IUnknown</a>-derived interface to be associated with the device object.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlobject-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, data) {
        result := ComCall(5, this, Guid.Ptr, guid, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Associates a name with the DirectML device object. This name is for use in debug diagnostics and tools.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * A <b>NULL</b>-terminated <b>UNICODE</b> string that contains the name to associate with the DirectML device object.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlobject-setname
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(6, this, "ptr", name, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDMLObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrivateData := CallbackCreate(GetMethod(implObj, "GetPrivateData"), flags, 4)
        this.vtbl.SetPrivateData := CallbackCreate(GetMethod(implObj, "SetPrivateData"), flags, 4)
        this.vtbl.SetPrivateDataInterface := CallbackCreate(GetMethod(implObj, "SetPrivateDataInterface"), flags, 3)
        this.vtbl.SetName := CallbackCreate(GetMethod(implObj, "SetName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrivateData)
        CallbackFree(this.vtbl.SetPrivateData)
        CallbackFree(this.vtbl.SetPrivateDataInterface)
        CallbackFree(this.vtbl.SetName)
    }
}
