#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WebAccountProviderCommand.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class IWebAccountProviderCommandFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProviderCommandFactory
     * @type {Guid}
     */
    static IID => Guid("{d5658a1b-b176-4776-8469-a9d3ff0b3f59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWebAccountProviderCommand"]

    /**
     * 
     * @param {WebAccountProvider} webAccountProvider_ 
     * @param {WebAccountProviderCommandInvokedHandler} invoked 
     * @returns {WebAccountProviderCommand} 
     */
    CreateWebAccountProviderCommand(webAccountProvider_, invoked) {
        result := ComCall(6, this, "ptr", webAccountProvider_, "ptr", invoked, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountProviderCommand(instance)
    }
}
