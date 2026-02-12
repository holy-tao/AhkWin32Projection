#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that's invoked when the user selects an account and a specific action in the account settings pane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountcommandinvokedhandler
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class WebAccountCommandInvokedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for WebAccountCommandInvokedHandler
     * @type {Guid}
     */
    static IID => Guid("{1ee6e459-1705-4a9a-b599-a0c3d6921973}")

    /**
     * The class identifier for WebAccountCommandInvokedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{1ee6e459-1705-4a9a-b599-a0c3d6921973}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {WebAccountCommand} command 
     * @param {WebAccountInvokedArgs} args 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(command, args) {
        result := ComCall(3, this, "ptr", command, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
