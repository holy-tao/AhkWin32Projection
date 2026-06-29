#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AHE_TYPE.ahk" { AHE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a single method that enables an application to determine whether its host is in desktop or immersive mode.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * An application must implement this interface together with the DelegateExecute handler (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexecutecommand">IExecuteCommand</a>).
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexecutecommandapplicationhostenvironment
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExecuteCommandApplicationHostEnvironment extends IUnknown {
    /**
     * The interface identifier for IExecuteCommandApplicationHostEnvironment
     * @type {Guid}
     */
    static IID := Guid("{18b21aa9-e184-4ff0-9f5e-f882d03771b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExecuteCommandApplicationHostEnvironment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExecuteCommandApplicationHostEnvironment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the current application host environment is in the desktop or immersive mode.
     * @returns {AHE_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexecutecommandapplicationhostenvironment-getvalue
     */
    GetValue() {
        result := ComCall(3, this, "int*", &pahe := 0, "HRESULT")
        return pahe
    }

    Query(iid) {
        if (IExecuteCommandApplicationHostEnvironment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValue)
    }
}
