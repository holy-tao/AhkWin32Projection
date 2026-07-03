#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets access to an OLE control on a Visual Basic container.
 * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nn-vbinterf-igetoleobject
 * @namespace Windows.Win32.System.Ole
 */
export default struct IGetOleObject extends IUnknown {
    /**
     * The interface identifier for IGetOleObject
     * @type {Guid}
     */
    static IID := Guid("{8a701da0-4feb-101b-a82e-08002b2b2337}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetOleObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOleObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetOleObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to an OLE control on a Visual Basic container.
     * @param {Pointer<Guid>} riid Specifies the interface to retrieve. Pass <b>IID_IOleObject</b> to obtain a pointer to 
     *       the control.
     * @param {Pointer<Pointer<Void>>} ppvObj Pointer to the control.
     * @returns {HRESULT} This method supports the standard return values <b>E_INVALIDARG</b>, 
     *       <b>E_OUTOFMEMORY</b>, and <b>E_UNEXPECTED</b>, as well as the 
     *       following:
     * @see https://learn.microsoft.com/windows/win32/api/vbinterf/nf-vbinterf-igetoleobject-getoleobject
     */
    GetOleObject(riid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, riid, ppvObjMarshal, ppvObj, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGetOleObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOleObject := CallbackCreate(GetMethod(implObj, "GetOleObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOleObject)
    }
}
