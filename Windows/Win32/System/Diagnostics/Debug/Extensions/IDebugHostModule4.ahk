#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }
#Import ".\IDebugHostModule3.ahk" { IDebugHostModule3 }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostModule4 extends IDebugHostModule3 {
    /**
     * The interface identifier for IDebugHostModule4
     * @type {Guid}
     */
    static IID := Guid("{41415136-38a4-474f-8e98-57e2dc64e565}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostModule4 interfaces
    */
    struct Vtbl extends IDebugHostModule3.Vtbl {
        FindTypeByName2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostModule4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostSymbol} pEnclosingSymbol 
     * @param {PWSTR} typeName 
     * @returns {IDebugHostType} 
     */
    FindTypeByName2(pEnclosingSymbol, typeName) {
        typeName := typeName is String ? StrPtr(typeName) : typeName

        result := ComCall(18, this, "ptr", pEnclosingSymbol, "ptr", typeName, "ptr*", &type := 0, "HRESULT")
        return IDebugHostType(type)
    }

    Query(iid) {
        if (IDebugHostModule4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindTypeByName2 := CallbackCreate(GetMethod(implObj, "FindTypeByName2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindTypeByName2)
    }
}
