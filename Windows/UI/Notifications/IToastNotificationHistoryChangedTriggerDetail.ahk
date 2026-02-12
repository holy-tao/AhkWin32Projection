#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationHistoryChangedTriggerDetail extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationHistoryChangedTriggerDetail
     * @type {Guid}
     */
    static IID => Guid("{db037ffa-0068-412c-9c83-267c37f65670}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeType"]

    /**
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
