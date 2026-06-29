#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EC_HOST_UI_MODE.ahk" { EC_HOST_UI_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method that enables an IExplorerCommand-based Shell verb handler to query the UI mode of the host component from which the application was invoked.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * A software component (either an OS component or an application) taat can launch a dual-mode application such as a browser should implement this interface. The interface should be implemented on an object that can be reached through the site chain provided to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> or the context menu and retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a> method.
 * 
 * <h3><a id="When_to_use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to use</h3>
 * Typically, an application that is capable of launching as both a desktop application and a Windows Store app app will use this interface to query which mode the host is currently in. The application can then launch in the UI mode that is compatible with the host.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexecutecommandhost
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExecuteCommandHost extends IUnknown {
    /**
     * The interface identifier for IExecuteCommandHost
     * @type {Guid}
     */
    static IID := Guid("{4b6832a2-5f04-4c9d-b89d-727a15d103e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExecuteCommandHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUIMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExecuteCommandHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables an IExplorerCommand-based Shell verb handler to query the UI mode of the host component from which the application was invoked..
     * @returns {EC_HOST_UI_MODE} Type: <b>EC_HOST_UI_MODE*</b>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexecutecommandhost-getuimode
     */
    GetUIMode() {
        result := ComCall(3, this, "int*", &pUIMode := 0, "HRESULT")
        return pUIMode
    }

    Query(iid) {
        if (IExecuteCommandHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUIMode := CallbackCreate(GetMethod(implObj, "GetUIMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUIMode)
    }
}
