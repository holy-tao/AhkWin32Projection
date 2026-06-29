#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IWinInetFileStream extends IUnknown {
    /**
     * The interface identifier for IWinInetFileStream
     * @type {Guid}
     */
    static IID := Guid("{f134c4b7-b1f8-4e75-b886-74b90943becb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinInetFileStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetHandleForUnlock : IntPtr
        SetDeleteFile      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinInetFileStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hWinInetLockHandle 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    SetHandleForUnlock(hWinInetLockHandle, dwReserved) {
        result := ComCall(3, this, "ptr", hWinInetLockHandle, "ptr", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    SetDeleteFile(dwReserved) {
        result := ComCall(4, this, "ptr", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWinInetFileStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetHandleForUnlock := CallbackCreate(GetMethod(implObj, "SetHandleForUnlock"), flags, 3)
        this.vtbl.SetDeleteFile := CallbackCreate(GetMethod(implObj, "SetDeleteFile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetHandleForUnlock)
        CallbackFree(this.vtbl.SetDeleteFile)
    }
}
