#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptStringCompare extends IUnknown {
    /**
     * The interface identifier for IActiveScriptStringCompare
     * @type {Guid}
     */
    static IID := Guid("{58562769-ed52-42f7-8403-4963514e1f11}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptStringCompare interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StrComp : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptStringCompare.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bszStr1 
     * @param {BSTR} bszStr2 
     * @returns {Integer} 
     */
    StrComp(bszStr1, bszStr2) {
        bszStr1 := bszStr1 is String ? BSTR.Alloc(bszStr1).Value : bszStr1
        bszStr2 := bszStr2 is String ? BSTR.Alloc(bszStr2).Value : bszStr2

        result := ComCall(3, this, BSTR, bszStr1, BSTR, bszStr2, "int*", &iRet := 0, "HRESULT")
        return iRet
    }

    Query(iid) {
        if (IActiveScriptStringCompare.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StrComp := CallbackCreate(GetMethod(implObj, "StrComp"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StrComp)
    }
}
