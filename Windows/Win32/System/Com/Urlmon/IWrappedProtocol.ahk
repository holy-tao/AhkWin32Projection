#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IWrappedProtocol extends IUnknown {
    /**
     * The interface identifier for IWrappedProtocol
     * @type {Guid}
     */
    static IID := Guid("{53c84785-8425-4dc5-971b-e58d9c19f9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWrappedProtocol interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWrapperCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWrappedProtocol.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} dwReserved 
     * @returns {Integer} 
     */
    GetWrapperCode(dwReserved) {
        result := ComCall(3, this, "int*", &pnCode := 0, "ptr", dwReserved, "HRESULT")
        return pnCode
    }

    Query(iid) {
        if (IWrappedProtocol.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWrapperCode := CallbackCreate(GetMethod(implObj, "GetWrapperCode"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWrapperCode)
    }
}
