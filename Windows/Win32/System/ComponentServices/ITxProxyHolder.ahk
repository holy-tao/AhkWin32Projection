#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ITxProxyHolder extends IUnknown {
    /**
     * The interface identifier for ITxProxyHolder
     * @type {Guid}
     */
    static IID := Guid("{13d86f31-0139-41af-bcad-c7d50435fe9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITxProxyHolder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdentifier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITxProxyHolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuidLtx 
     * @returns {String} Nothing - always returns an empty string
     */
    GetIdentifier(pGuidLtx) {
        ComCall(3, this, Guid.Ptr, pGuidLtx)
    }

    Query(iid) {
        if (ITxProxyHolder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdentifier := CallbackCreate(GetMethod(implObj, "GetIdentifier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdentifier)
    }
}
