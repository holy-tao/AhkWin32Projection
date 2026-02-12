#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationHistoryChangedTriggerDetail2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationHistoryChangedTriggerDetail2
     * @type {Guid}
     */
    static IID => Guid("{0b36e982-c871-49fb-babb-25bdbc4cc45b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CollectionId"]

    /**
     * @type {HSTRING} 
     */
    CollectionId {
        get => this.get_CollectionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CollectionId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
