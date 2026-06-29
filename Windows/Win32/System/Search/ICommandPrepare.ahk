#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ICommandPrepare extends IUnknown {
    /**
     * The interface identifier for ICommandPrepare
     * @type {Guid}
     */
    static IID := Guid("{0c733a26-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommandPrepare interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Prepare   : IntPtr
        Unprepare : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommandPrepare.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cExpectedRuns 
     * @returns {HRESULT} 
     */
    Prepare(cExpectedRuns) {
        result := ComCall(3, this, "uint", cExpectedRuns, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unprepare() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICommandPrepare.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Prepare := CallbackCreate(GetMethod(implObj, "Prepare"), flags, 2)
        this.vtbl.Unprepare := CallbackCreate(GetMethod(implObj, "Unprepare"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Prepare)
        CallbackFree(this.vtbl.Unprepare)
    }
}
