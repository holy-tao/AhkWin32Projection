#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ISmartCardTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardTrigger
     * @type {Guid}
     */
    static IID => Guid("{f53bc5ac-84ca-4972-8ce9-e58f97b37a50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TriggerType"]

    /**
     * @type {Integer} 
     */
    TriggerType {
        get => this.get_TriggerType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TriggerType() {
        result := ComCall(6, this, "int*", &triggerType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return triggerType
    }
}
