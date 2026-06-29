#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct ISideShowNotification extends IUnknown {
    /**
     * The interface identifier for ISideShowNotification
     * @type {Guid}
     */
    static IID := Guid("{03c93300-8ab2-41c5-9b79-46127a30e148}")

    /**
     * The class identifier for SideShowNotification
     * @type {Guid}
     */
    static CLSID := Guid("{0ce3e86f-d5cd-4525-a766-1abab1a752f5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISideShowNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_NotificationId : IntPtr
        put_NotificationId : IntPtr
        get_Title          : IntPtr
        put_Title          : IntPtr
        get_Message        : IntPtr
        put_Message        : IntPtr
        get_Image          : IntPtr
        put_Image          : IntPtr
        get_ExpirationTime : IntPtr
        put_ExpirationTime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISideShowNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    NotificationId {
        get => this.get_NotificationId()
        set => this.put_NotificationId(value)
    }

    /**
     * @type {PWSTR} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {PWSTR} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * @type {HICON} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * @type {SYSTEMTIME} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
        set => this.put_ExpirationTime(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NotificationId() {
        result := ComCall(3, this, "uint*", &out_pNotificationId := 0, "HRESULT")
        return out_pNotificationId
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
     * @returns {PWSTR} 
     */
    get_Title() {
        result := ComCall(5, this, PWSTR.Ptr, &out_ppwszTitle := 0, "HRESULT")
        return out_ppwszTitle
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
     * @returns {PWSTR} 
     */
    get_Message() {
        result := ComCall(7, this, PWSTR.Ptr, &out_ppwszMessage := 0, "HRESULT")
        return out_ppwszMessage
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
     * @returns {HICON} 
     */
    get_Image() {
        out_phIcon := HICON.Owned()
        result := ComCall(9, this, HICON.Ptr, out_phIcon, "HRESULT")
        return out_phIcon
    }

    /**
     * 
     * @param {HICON} in_hIcon 
     * @returns {HRESULT} 
     */
    put_Image(in_hIcon) {
        result := ComCall(10, this, HICON, in_hIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    get_ExpirationTime() {
        out_pTime := SYSTEMTIME()
        result := ComCall(11, this, SYSTEMTIME.Ptr, out_pTime, "HRESULT")
        return out_pTime
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} in_pTime 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(in_pTime) {
        result := ComCall(12, this, SYSTEMTIME.Ptr, in_pTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISideShowNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_NotificationId := CallbackCreate(GetMethod(implObj, "get_NotificationId"), flags, 2)
        this.vtbl.put_NotificationId := CallbackCreate(GetMethod(implObj, "put_NotificationId"), flags, 2)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.put_Title := CallbackCreate(GetMethod(implObj, "put_Title"), flags, 2)
        this.vtbl.get_Message := CallbackCreate(GetMethod(implObj, "get_Message"), flags, 2)
        this.vtbl.put_Message := CallbackCreate(GetMethod(implObj, "put_Message"), flags, 2)
        this.vtbl.get_Image := CallbackCreate(GetMethod(implObj, "get_Image"), flags, 2)
        this.vtbl.put_Image := CallbackCreate(GetMethod(implObj, "put_Image"), flags, 2)
        this.vtbl.get_ExpirationTime := CallbackCreate(GetMethod(implObj, "get_ExpirationTime"), flags, 2)
        this.vtbl.put_ExpirationTime := CallbackCreate(GetMethod(implObj, "put_ExpirationTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_NotificationId)
        CallbackFree(this.vtbl.put_NotificationId)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.put_Title)
        CallbackFree(this.vtbl.get_Message)
        CallbackFree(this.vtbl.put_Message)
        CallbackFree(this.vtbl.get_Image)
        CallbackFree(this.vtbl.put_Image)
        CallbackFree(this.vtbl.get_ExpirationTime)
        CallbackFree(this.vtbl.put_ExpirationTime)
    }
}
