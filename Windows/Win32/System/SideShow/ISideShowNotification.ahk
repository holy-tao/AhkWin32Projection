#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowNotification
     * @type {Guid}
     */
    static IID => Guid("{03c93300-8ab2-41c5-9b79-46127a30e148}")

    /**
     * The class identifier for SideShowNotification
     * @type {Guid}
     */
    static CLSID => Guid("{0ce3e86f-d5cd-4525-a766-1abab1a752f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NotificationId", "put_NotificationId", "get_Title", "put_Title", "get_Message", "put_Message", "get_Image", "put_Image", "get_ExpirationTime", "put_ExpirationTime"]

    /**
     * 
     * @param {Pointer<Integer>} out_pNotificationId 
     * @returns {HRESULT} 
     */
    get_NotificationId(out_pNotificationId) {
        result := ComCall(3, this, "uint*", out_pNotificationId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} in_notificationId 
     * @returns {HRESULT} 
     */
    put_NotificationId(in_notificationId) {
        result := ComCall(4, this, "uint", in_notificationId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} out_ppwszTitle 
     * @returns {HRESULT} 
     */
    get_Title(out_ppwszTitle) {
        result := ComCall(5, this, "ptr", out_ppwszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} in_pwszTitle 
     * @returns {HRESULT} 
     */
    put_Title(in_pwszTitle) {
        in_pwszTitle := in_pwszTitle is String ? StrPtr(in_pwszTitle) : in_pwszTitle

        result := ComCall(6, this, "ptr", in_pwszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} out_ppwszMessage 
     * @returns {HRESULT} 
     */
    get_Message(out_ppwszMessage) {
        result := ComCall(7, this, "ptr", out_ppwszMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} in_pwszMessage 
     * @returns {HRESULT} 
     */
    put_Message(in_pwszMessage) {
        in_pwszMessage := in_pwszMessage is String ? StrPtr(in_pwszMessage) : in_pwszMessage

        result := ComCall(8, this, "ptr", in_pwszMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HICON>} out_phIcon 
     * @returns {HRESULT} 
     */
    get_Image(out_phIcon) {
        result := ComCall(9, this, "ptr", out_phIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HICON} in_hIcon 
     * @returns {HRESULT} 
     */
    put_Image(in_hIcon) {
        in_hIcon := in_hIcon is Win32Handle ? NumGet(in_hIcon, "ptr") : in_hIcon

        result := ComCall(10, this, "ptr", in_hIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} out_pTime 
     * @returns {HRESULT} 
     */
    get_ExpirationTime(out_pTime) {
        result := ComCall(11, this, "ptr", out_pTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} in_pTime 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(in_pTime) {
        result := ComCall(12, this, "ptr", in_pTime, "HRESULT")
        return result
    }
}
