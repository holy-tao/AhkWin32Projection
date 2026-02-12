#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PickerClosingDeferral.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class IPickerClosingOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPickerClosingOperation
     * @type {Guid}
     */
    static IID => Guid("{4ce9fb84-beee-4e39-a773-fc5f0eae328d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral", "get_Deadline"]

    /**
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * 
     * @returns {PickerClosingDeferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PickerClosingDeferral(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
