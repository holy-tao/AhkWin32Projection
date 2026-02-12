#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\NotificationData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotification4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotification4
     * @type {Guid}
     */
    static IID => Guid("{15154935-28ea-4727-88e9-c58680e2d118}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data", "put_Data", "get_Priority", "put_Priority"]

    /**
     * @type {NotificationData} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * 
     * @returns {NotificationData} 
     */
    get_Data() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NotificationData(value)
    }

    /**
     * 
     * @param {NotificationData} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Priority(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
