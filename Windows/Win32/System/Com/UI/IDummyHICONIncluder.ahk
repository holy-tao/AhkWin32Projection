#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.UI
 */
export default struct IDummyHICONIncluder extends IUnknown {
    /**
     * The interface identifier for IDummyHICONIncluder
     * @type {Guid}
     */
    static IID := Guid("{947990de-cc28-11d2-a0f7-00805f858fb1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDummyHICONIncluder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Dummy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDummyHICONIncluder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HICON} h1 
     * @param {HDC} h2 
     * @returns {HRESULT} 
     */
    Dummy(h1, h2) {
        result := ComCall(3, this, HICON, h1, HDC, h2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDummyHICONIncluder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Dummy := CallbackCreate(GetMethod(implObj, "Dummy"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Dummy)
    }
}
