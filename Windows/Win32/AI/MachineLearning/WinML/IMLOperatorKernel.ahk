#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMLOperatorKernelContext.ahk" { IMLOperatorKernelContext }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorKernel extends IUnknown {
    /**
     * The interface identifier for IMLOperatorKernel
     * @type {Guid}
     */
    static IID := Guid("{11c4b4a0-b467-4eaa-a1a6-b961d8d0ed79}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorKernel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Compute : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorKernel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Compute System Samples
     * @param {IMLOperatorKernelContext} _context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/ComputeSystemSample
     */
    Compute(_context) {
        result := ComCall(3, this, "ptr", _context, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLOperatorKernel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compute := CallbackCreate(GetMethod(implObj, "Compute"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compute)
    }
}
