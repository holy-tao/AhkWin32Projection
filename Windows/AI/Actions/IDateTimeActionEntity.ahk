#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IDateTimeActionEntity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDateTimeActionEntity
     * @type {Guid}
     */
    static IID => Guid("{fd5a0880-eeae-553a-bfed-a9229d57447d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DateTime"]

    /**
     * @type {DateTime} 
     */
    DateTime {
        get => this.get_DateTime()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateTime() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
