#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\UI\Notifications\ToastNotification.ahk
#Include ..\..\UI\Notifications\TileNotification.ahk
#Include ..\..\UI\Notifications\BadgeNotification.ahk
#Include .\RawNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class IPushNotificationReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPushNotificationReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d1065e0c-36cd-484c-b935-0a99b753cf00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Cancel", "get_Cancel", "get_NotificationType", "get_ToastNotification", "get_TileNotification", "get_BadgeNotification", "get_RawNotification"]

    /**
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * @type {Integer} 
     */
    NotificationType {
        get => this.get_NotificationType()
    }

    /**
     * @type {ToastNotification} 
     */
    ToastNotification {
        get => this.get_ToastNotification()
    }

    /**
     * @type {TileNotification} 
     */
    TileNotification {
        get => this.get_TileNotification()
    }

    /**
     * @type {BadgeNotification} 
     */
    BadgeNotification {
        get => this.get_BadgeNotification()
    }

    /**
     * @type {RawNotification} 
     */
    RawNotification {
        get => this.get_RawNotification()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NotificationType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ToastNotification} 
     */
    get_ToastNotification() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotification(value)
    }

    /**
     * 
     * @returns {TileNotification} 
     */
    get_TileNotification() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileNotification(value)
    }

    /**
     * 
     * @returns {BadgeNotification} 
     */
    get_BadgeNotification() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BadgeNotification(value)
    }

    /**
     * 
     * @returns {RawNotification} 
     */
    get_RawNotification() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RawNotification(value)
    }
}
