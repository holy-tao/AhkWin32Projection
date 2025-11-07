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
     * 
     * @param {Pointer<Guid>} clsidHandler 
     * @param {IShellItemArray} itemsBeingActivated 
     * @param {IHandlerInfo} handlerInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandleractivationhost-beforecocreateinstance
     */
    BeforeCoCreateInstance(clsidHandler, itemsBeingActivated, handlerInfo) {
        result := ComCall(3, this, "ptr", clsidHandler, "ptr", itemsBeingActivated, "ptr", handlerInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} applicationPath 
     * @param {PWSTR} commandLine 
     * @param {IHandlerInfo} handlerInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandleractivationhost-beforecreateprocess
     */
    BeforeCreateProcess(applicationPath, commandLine, handlerInfo) {
        applicationPath := applicationPath is String ? StrPtr(applicationPath) : applicationPath
        commandLine := commandLine is String ? StrPtr(commandLine) : commandLine

        result := ComCall(4, this, "ptr", applicationPath, "ptr", commandLine, "ptr", handlerInfo, "HRESULT")
        return result
    }
}
