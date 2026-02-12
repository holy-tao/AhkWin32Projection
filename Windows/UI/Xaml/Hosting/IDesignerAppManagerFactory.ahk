#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DesignerAppManager.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IDesignerAppManagerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesignerAppManagerFactory
     * @type {Guid}
     */
    static IID => Guid("{8f9d633b-1266-4c0e-8499-0db85bbd4c43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} appUserModelId 
     * @returns {DesignerAppManager} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(appUserModelId) {
        if(appUserModelId is String) {
            pin := HSTRING.Create(appUserModelId)
            appUserModelId := pin.Value
        }
        appUserModelId := appUserModelId is Win32Handle ? NumGet(appUserModelId, "ptr") : appUserModelId

        result := ComCall(6, this, "ptr", appUserModelId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DesignerAppManager(value)
    }
}
