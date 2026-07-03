#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWinMLRuntime.ahk" { IWinMLRuntime }
#Import ".\WINML_RUNTIME_TYPE.ahk" { WINML_RUNTIME_TYPE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the factory that creates the WinML runtime for model loading and evaluation.
 * @see https://learn.microsoft.com/windows/win32/api/winml/nn-winml-iwinmlruntimefactory
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IWinMLRuntimeFactory extends IUnknown {
    /**
     * The interface identifier for IWinMLRuntimeFactory
     * @type {Guid}
     */
    static IID := Guid("{a807b84d-4ae5-4bc0-a76a-941aa246bd41}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinMLRuntimeFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateRuntime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinMLRuntimeFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a WinML runtime.
     * @param {WINML_RUNTIME_TYPE} RuntimeType A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_runtime_type">WINML_RUNTIME_TYPE</a> that describes the type of WinML runtime.
     * @returns {IWinMLRuntime} A pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/winml/nn-winml-iwinmlruntime">IWinMLRuntime</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlruntimefactory-createruntime
     */
    CreateRuntime(RuntimeType) {
        result := ComCall(3, this, WINML_RUNTIME_TYPE, RuntimeType, "ptr*", &ppRuntime := 0, "HRESULT")
        return IWinMLRuntime(ppRuntime)
    }

    Query(iid) {
        if (IWinMLRuntimeFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateRuntime := CallbackCreate(GetMethod(implObj, "CreateRuntime"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateRuntime)
    }
}
