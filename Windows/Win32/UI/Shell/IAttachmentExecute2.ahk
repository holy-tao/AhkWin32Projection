#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAttachmentExecute.ahk" { IAttachmentExecute }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IAttachmentExecute2 extends IAttachmentExecute {
    /**
     * The interface identifier for IAttachmentExecute2
     * @type {Guid}
     */
    static IID := Guid("{4f2b781f-a608-4543-abf0-49c246ebbba9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAttachmentExecute2 interfaces
    */
    struct Vtbl extends IAttachmentExecute.Vtbl {
        SaveNoVirusCheck       : IntPtr
        SaveWithUINoVirusCheck : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAttachmentExecute2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveNoVirusCheck() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    SaveWithUINoVirusCheck(_hwnd) {
        result := ComCall(16, this, HWND, _hwnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAttachmentExecute2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SaveNoVirusCheck := CallbackCreate(GetMethod(implObj, "SaveNoVirusCheck"), flags, 1)
        this.vtbl.SaveWithUINoVirusCheck := CallbackCreate(GetMethod(implObj, "SaveWithUINoVirusCheck"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SaveNoVirusCheck)
        CallbackFree(this.vtbl.SaveWithUINoVirusCheck)
    }
}
