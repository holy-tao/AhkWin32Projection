#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SmartCardAppletIdGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardAppletIdGroupFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardAppletIdGroupFactory
     * @type {Guid}
     */
    static IID => Guid("{9105eb4d-4a65-4e41-8061-cbe83f3695e5}")

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
     * @param {HSTRING} displayName 
     * @param {IVector<IBuffer>} appletIds 
     * @param {Integer} emulationCategory 
     * @param {Integer} emulationType_ 
     * @returns {SmartCardAppletIdGroup} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(displayName, appletIds, emulationCategory, emulationType_) {
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(6, this, "ptr", displayName, "ptr", appletIds, "int", emulationCategory, "int", emulationType_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardAppletIdGroup(result_)
    }
}
