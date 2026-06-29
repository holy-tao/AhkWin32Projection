#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ICodeAddressConcept extends IUnknown {
    /**
     * The interface identifier for ICodeAddressConcept
     * @type {Guid}
     */
    static IID := Guid("{c7371568-5c78-4a00-a4ab-6ef8823184cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICodeAddressConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetContainingSymbol : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICodeAddressConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} pContextObject 
     * @returns {IDebugHostSymbol} 
     */
    GetContainingSymbol(pContextObject) {
        result := ComCall(3, this, "ptr", pContextObject, "ptr*", &ppSymbol := 0, "HRESULT")
        return IDebugHostSymbol(ppSymbol)
    }

    Query(iid) {
        if (ICodeAddressConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContainingSymbol := CallbackCreate(GetMethod(implObj, "GetContainingSymbol"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContainingSymbol)
    }
}
