#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct ILogFileItem extends IUnknown {
    /**
     * The interface identifier for ILogFileItem
     * @type {Guid}
     */
    static IID := Guid("{d6b518dd-05c7-418a-89e6-4f9ce8c6841e}")

    /**
     * The class identifier for LogFileItem
     * @type {Guid}
     */
    static CLSID := Guid("{16ec5be8-df93-4237-94e4-9ee918111d71}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILogFileItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Path : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILogFileItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pstrValue := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pstrValue, "HRESULT")
        return pstrValue
    }

    Query(iid) {
        if (ILogFileItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
    }
}
