#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostCrst extends IUnknown {
    /**
     * The interface identifier for IHostCrst
     * @type {Guid}
     */
    static IID := Guid("{6df710a6-26a4-4a65-8cd5-7237b8bda8dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostCrst interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Enter        : IntPtr
        Leave        : IntPtr
        TryEnter     : IntPtr
        SetSpinCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostCrst.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Enter(option) {
        result := ComCall(3, this, "uint", option, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Leave() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @returns {BOOL} 
     */
    TryEnter(option) {
        result := ComCall(5, this, "uint", option, BOOL.Ptr, &pbSucceeded := 0, "HRESULT")
        return pbSucceeded
    }

    /**
     * 
     * @param {Integer} dwSpinCount 
     * @returns {HRESULT} 
     */
    SetSpinCount(dwSpinCount) {
        result := ComCall(6, this, "uint", dwSpinCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHostCrst.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Enter := CallbackCreate(GetMethod(implObj, "Enter"), flags, 2)
        this.vtbl.Leave := CallbackCreate(GetMethod(implObj, "Leave"), flags, 1)
        this.vtbl.TryEnter := CallbackCreate(GetMethod(implObj, "TryEnter"), flags, 3)
        this.vtbl.SetSpinCount := CallbackCreate(GetMethod(implObj, "SetSpinCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Enter)
        CallbackFree(this.vtbl.Leave)
        CallbackFree(this.vtbl.TryEnter)
        CallbackFree(this.vtbl.SetSpinCount)
    }
}
