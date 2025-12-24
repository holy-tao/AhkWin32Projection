#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @remarks
 * 
 * This interface is implemented by an object reachable through the site chain provided to [ShellExecuteEx](../shellapi/nf-shellapi-shellexecuteexw.md) or the context menu handler. Applications will return this object in their **IServiceProvider::QueryService** implementation when asked for the service ID **SID_SHandlerActivationHost**.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ihandleractivationhost
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHandlerActivationHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandlerActivationHost
     * @type {Guid}
     */
    static IID => Guid("{35094a87-8bb1-4237-96c6-c417eebdb078}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeforeCoCreateInstance", "BeforeCreateProcess"]

    /**
     * .
     * @param {Pointer<Guid>} clsidHandler Identifies the handler.
     * @param {IShellItemArray} itemsBeingActivated The Shell item objects that will be passed to the handler. Typically there is only one, but in some cases there can be more than one.
     * @param {IHandlerInfo} handlerInfo Provides access to information about the handler that will be invoked. This object also supports **IHandlerInfo2** on versions of Windows that support that interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. 
     * Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code, <b>HRESULT_FROM_WIN32(ERROR_CANCELLED)</b> inciates that the ShellExecute call should be canceled, <b>EXECUTE_E_LAUNCH_APPLICATION</b> indicates that this handler should not be used, but if there is another it should be used.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ihandleractivationhost-beforecocreateinstance
     */
    BeforeCoCreateInstance(clsidHandler, itemsBeingActivated, handlerInfo) {
        result := ComCall(3, this, "ptr", clsidHandler, "ptr", itemsBeingActivated, "ptr", handlerInfo, "HRESULT")
        return result
    }

    /**
     * .
     * @param {PWSTR} applicationPath The fully qualified path to the process executable, or in some cases a DLL path.
     * @param {PWSTR} commandLine The full command line that will be passed to **CreateProcess** including the arguments that the handler requested via its registration.
     * @param {IHandlerInfo} handlerInfo Provides access to information about the handler that will be invoked. This object also supports **IHandlerInfo2** on versions of windows that support that interface. This object also implements [IObjectWithSelection](./nn-shobjidl_core-iobjectwithselection.md). This can be used to get the Shell item, or items in some cases, that are being launched.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. 
     * Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code, <b>HRESULT_FROM_WIN32(ERROR_CANCELLED)</b> inciates that the ShellExecute call should be canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ihandleractivationhost-beforecreateprocess
     */
    BeforeCreateProcess(applicationPath, commandLine, handlerInfo) {
        applicationPath := applicationPath is String ? StrPtr(applicationPath) : applicationPath
        commandLine := commandLine is String ? StrPtr(commandLine) : commandLine

        result := ComCall(4, this, "ptr", applicationPath, "ptr", commandLine, "ptr", handlerInfo, "HRESULT")
        return result
    }
}
