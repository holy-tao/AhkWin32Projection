#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IHandlerInfo.ahk" { IHandlerInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellItemArray.ahk" { IShellItemArray }

/**
 * . (IHandlerActivationHost)
 * @remarks
 * This interface is implemented by an object reachable through the site chain provided to [ShellExecuteEx](../shellapi/nf-shellapi-shellexecuteexw.md) or the context menu handler. Applications will return this object in their **IServiceProvider::QueryService** implementation when asked for the service ID **SID_SHandlerActivationHost**.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ihandleractivationhost
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHandlerActivationHost extends IUnknown {
    /**
     * The interface identifier for IHandlerActivationHost
     * @type {Guid}
     */
    static IID := Guid("{35094a87-8bb1-4237-96c6-c417eebdb078}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHandlerActivationHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeforeCoCreateInstance : IntPtr
        BeforeCreateProcess    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHandlerActivationHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * . (IHandlerActivationHost.BeforeCoCreateInstance)
     * @param {Pointer<Guid>} clsidHandler Identifies the handler.
     * @param {IShellItemArray} itemsBeingActivated The Shell item objects that will be passed to the handler. Typically there is only one, but in some cases there can be more than one.
     * @param {IHandlerInfo} handlerInfo Provides access to information about the handler that will be invoked. This object also supports **IHandlerInfo2** on versions of Windows that support that interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. 
     * Otherwise, it returns an <b>HRESULT</b> error code, <b>HRESULT_FROM_WIN32(ERROR_CANCELLED)</b> indicates that the ShellExecute call should be canceled, <b>EXECUTE_E_LAUNCH_APPLICATION</b> indicates that this handler should not be used, but if there is another it should be used.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandleractivationhost-beforecocreateinstance
     */
    BeforeCoCreateInstance(clsidHandler, itemsBeingActivated, handlerInfo) {
        result := ComCall(3, this, Guid.Ptr, clsidHandler, "ptr", itemsBeingActivated, "ptr", handlerInfo, "HRESULT")
        return result
    }

    /**
     * . (IHandlerActivationHost.BeforeCreateProcess)
     * @param {PWSTR} applicationPath The fully qualified path to the process executable, or in some cases a DLL path.
     * @param {PWSTR} commandLine The full command line that will be passed to **CreateProcess** including the arguments that the handler requested via its registration.
     * @param {IHandlerInfo} handlerInfo Provides access to information about the handler that will be invoked. This object also supports **IHandlerInfo2** on versions of windows that support that interface. This object also implements [IObjectWithSelection](./nn-shobjidl_core-iobjectwithselection.md). This can be used to get the Shell item, or items in some cases, that are being launched.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. 
     * Otherwise, it returns an <b>HRESULT</b> error code, <b>HRESULT_FROM_WIN32(ERROR_CANCELLED)</b> indicates that the ShellExecute call should be canceled.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandleractivationhost-beforecreateprocess
     */
    BeforeCreateProcess(applicationPath, commandLine, handlerInfo) {
        applicationPath := applicationPath is String ? StrPtr(applicationPath) : applicationPath
        commandLine := commandLine is String ? StrPtr(commandLine) : commandLine

        result := ComCall(4, this, "ptr", applicationPath, "ptr", commandLine, "ptr", handlerInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHandlerActivationHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeforeCoCreateInstance := CallbackCreate(GetMethod(implObj, "BeforeCoCreateInstance"), flags, 4)
        this.vtbl.BeforeCreateProcess := CallbackCreate(GetMethod(implObj, "BeforeCreateProcess"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeforeCoCreateInstance)
        CallbackFree(this.vtbl.BeforeCreateProcess)
    }
}
