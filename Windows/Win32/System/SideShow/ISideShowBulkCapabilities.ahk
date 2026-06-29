#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISideShowCapabilities.ahk" { ISideShowCapabilities }
#Import ".\ISideShowPropVariantCollection.ahk" { ISideShowPropVariantCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISideShowKeyCollection.ahk" { ISideShowKeyCollection }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct ISideShowBulkCapabilities extends ISideShowCapabilities {
    /**
     * The interface identifier for ISideShowBulkCapabilities
     * @type {Guid}
     */
    static IID := Guid("{3a2b7fbc-3ad5-48bd-bbf1-0e6cfbd10807}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISideShowBulkCapabilities interfaces
    */
    struct Vtbl extends ISideShowCapabilities.Vtbl {
        GetCapabilities : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISideShowBulkCapabilities.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISideShowKeyCollection} in_keyCollection 
     * @param {Pointer<ISideShowPropVariantCollection>} inout_pValues 
     * @returns {HRESULT} 
     */
    GetCapabilities(in_keyCollection, inout_pValues) {
        result := ComCall(4, this, "ptr", in_keyCollection, ISideShowPropVariantCollection.Ptr, inout_pValues, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISideShowBulkCapabilities.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCapabilities := CallbackCreate(GetMethod(implObj, "GetCapabilities"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCapabilities)
    }
}
