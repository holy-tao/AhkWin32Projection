#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets access to the IVBFormat interface.
 * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nn-vbinterf-igetvbaobject
 * @namespace Windows.Win32.System.Ole
 */
export default struct IGetVBAObject extends IUnknown {
    /**
     * The interface identifier for IGetVBAObject
     * @type {Guid}
     */
    static IID := Guid("{91733a60-3f4c-101b-a3f6-00aa0034e4e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetVBAObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetVBAObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to an interface on the VBA object.
     * @param {Pointer<Guid>} riid Specifies the interface to retrieve. Pass <b>IID_IVBFormat</b> to retrieve a pointer to 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vbinterf/nn-vbinterf-ivbformat">IVBFormat</a> interface.
     * @param {Pointer<Pointer<Void>>} ppvObj Pointer to the interface.
     * @param {Integer} dwReserved Reserved.
     * @returns {HRESULT} This method supports the standard return values <b>E_INVALIDARG</b>, 
     *       <b>E_OUTOFMEMORY</b>, and <b>E_UNEXPECTED</b>, as well as the 
     *       following:
     * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nf-vbinterf-igetvbaobject-getobject
     */
    GetObject(riid, ppvObj, dwReserved) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, riid, ppvObjMarshal, ppvObj, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGetVBAObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObject)
    }
}
