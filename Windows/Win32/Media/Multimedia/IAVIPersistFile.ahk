#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IPersistFile.ahk" { IPersistFile }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct IAVIPersistFile extends IPersistFile {
    /**
     * The interface identifier for IAVIPersistFile
     * @type {Guid}
     */
    static IID := Guid("{00020025-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAVIPersistFile interfaces
    */
    struct Vtbl extends IPersistFile.Vtbl {
        Reserved1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAVIPersistFile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reserved1() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAVIPersistFile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reserved1 := CallbackCreate(GetMethod(implObj, "Reserved1"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reserved1)
    }
}
