#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\AI\MachineLearning\WinML\IMLOperatorRegistry.ahk" { IMLOperatorRegistry }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.ML
 */
export default struct ILearningModelOperatorProviderNative extends IUnknown {
    /**
     * The interface identifier for ILearningModelOperatorProviderNative
     * @type {Guid}
     */
    static IID := Guid("{1adaa23a-eb67-41f3-aad8-5d984e9bacd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILearningModelOperatorProviderNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRegistry : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILearningModelOperatorProviderNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IMLOperatorRegistry} 
     */
    GetRegistry() {
        result := ComCall(3, this, "ptr*", &ppOperatorRegistry := 0, "HRESULT")
        return IMLOperatorRegistry(ppOperatorRegistry)
    }

    Query(iid) {
        if (ILearningModelOperatorProviderNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRegistry := CallbackCreate(GetMethod(implObj, "GetRegistry"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRegistry)
    }
}
