#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\XACTOPT.ahk" { XACTOPT }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionOptions extends IUnknown {
    /**
     * The interface identifier for ITransactionOptions
     * @type {Guid}
     */
    static IID := Guid("{3a6ad9e0-23b9-11cf-ad60-00aa00a74ccd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionOptions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetOptions : IntPtr
        GetOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<XACTOPT>} pOptions 
     * @returns {HRESULT} 
     */
    SetOptions(pOptions) {
        result := ComCall(3, this, XACTOPT.Ptr, pOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XACTOPT>} pOptions 
     * @returns {HRESULT} 
     */
    GetOptions(pOptions) {
        result := ComCall(4, this, XACTOPT.Ptr, pOptions, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOptions := CallbackCreate(GetMethod(implObj, "SetOptions"), flags, 2)
        this.vtbl.GetOptions := CallbackCreate(GetMethod(implObj, "GetOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOptions)
        CallbackFree(this.vtbl.GetOptions)
    }
}
