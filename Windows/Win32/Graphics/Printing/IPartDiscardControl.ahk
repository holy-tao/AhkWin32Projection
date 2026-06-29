#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPartDiscardControl extends IUnknown {
    /**
     * The interface identifier for IPartDiscardControl
     * @type {Guid}
     */
    static IID := Guid("{cc350c00-095b-42a5-bf0f-c8780edadb3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartDiscardControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDiscardProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartDiscardControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BSTR>} uriSentinelPage 
     * @param {Pointer<BSTR>} uriPartToDiscard 
     * @returns {HRESULT} 
     */
    GetDiscardProperties(uriSentinelPage, uriPartToDiscard) {
        result := ComCall(3, this, BSTR.Ptr, uriSentinelPage, BSTR.Ptr, uriPartToDiscard, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPartDiscardControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDiscardProperties := CallbackCreate(GetMethod(implObj, "GetDiscardProperties"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDiscardProperties)
    }
}
