#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IProvideClassInfo.ahk" { IProvideClassInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * An extension to IProvideClassInfo that makes is faster and easier to retrieve an object's outgoing interface IID for its default event set.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iprovideclassinfo2
 * @namespace Windows.Win32.System.Ole
 */
export default struct IProvideClassInfo2 extends IProvideClassInfo {
    /**
     * The interface identifier for IProvideClassInfo2
     * @type {Guid}
     */
    static IID := Guid("{a6bc3ac0-dbaa-11ce-9de3-00aa004bb851}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideClassInfo2 interfaces
    */
    struct Vtbl extends IProvideClassInfo.Vtbl {
        GetGUID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideClassInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified GUID for the object.
     * @param {Integer} dwGuidKind The GUID type. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-guidkind">GUIDKIND</a> enumeration.
     * @returns {Guid} A pointer to a variable that receives the GUID.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iprovideclassinfo2-getguid
     */
    GetGUID(dwGuidKind) {
        pGUID := Guid()
        result := ComCall(4, this, "uint", dwGuidKind, Guid.Ptr, pGUID, "HRESULT")
        return pGUID
    }

    Query(iid) {
        if (IProvideClassInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGUID := CallbackCreate(GetMethod(implObj, "GetGUID"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGUID)
    }
}
