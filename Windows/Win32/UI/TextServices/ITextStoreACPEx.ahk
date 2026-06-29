#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITextStoreACPEx extends IUnknown {
    /**
     * The interface identifier for ITextStoreACPEx
     * @type {Guid}
     */
    static IID := Guid("{a2de3bc2-3d8e-11d3-81a9-f753fbe61a00}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextStoreACPEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ScrollToRect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextStoreACPEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {RECT} rc 
     * @param {Integer} dwPosition 
     * @returns {HRESULT} 
     */
    ScrollToRect(acpStart, acpEnd, rc, dwPosition) {
        result := ComCall(3, this, "int", acpStart, "int", acpEnd, RECT, rc, "uint", dwPosition, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITextStoreACPEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ScrollToRect := CallbackCreate(GetMethod(implObj, "ScrollToRect"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ScrollToRect)
    }
}
