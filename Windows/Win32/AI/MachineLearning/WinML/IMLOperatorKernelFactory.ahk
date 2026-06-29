#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMLOperatorKernelCreationContext.ahk" { IMLOperatorKernelCreationContext }
#Import ".\IMLOperatorKernel.ahk" { IMLOperatorKernel }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorKernelFactory extends IUnknown {
    /**
     * The interface identifier for IMLOperatorKernelFactory
     * @type {Guid}
     */
    static IID := Guid("{ef15ad6f-0dc9-4908-ab35-a575a30dfbf8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorKernelFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateKernel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorKernelFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMLOperatorKernelCreationContext} _context 
     * @returns {IMLOperatorKernel} 
     */
    CreateKernel(_context) {
        result := ComCall(3, this, "ptr", _context, "ptr*", &kernel := 0, "HRESULT")
        return IMLOperatorKernel(kernel)
    }

    Query(iid) {
        if (IMLOperatorKernelFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateKernel := CallbackCreate(GetMethod(implObj, "CreateKernel"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateKernel)
    }
}
