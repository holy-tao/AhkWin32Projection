#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WebAccountCommand.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class IWebAccountCommandFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountCommandFactory
     * @type {Guid}
     */
    static IID => Guid("{bfa6cdff-2f2d-42f5-81de-1d56bafc496d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWebAccountCommand"]

    /**
     * 
     * @param {WebAccount} webAccount_ 
     * @param {WebAccountCommandInvokedHandler} invoked 
     * @param {Integer} actions 
     * @returns {WebAccountCommand} 
     */
    CreateWebAccountCommand(webAccount_, invoked, actions) {
        result := ComCall(6, this, "ptr", webAccount_, "ptr", invoked, "uint", actions, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountCommand(instance)
    }
}
