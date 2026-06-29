#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintAsyncCookie.ahk" { IPrintAsyncCookie }
#Import ".\IPrintAsyncNotifyChannel.ahk" { IPrintAsyncNotifyChannel }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintAsyncNotifyDataObject.ahk" { IPrintAsyncNotifyDataObject }
#Import ".\IAsyncGetSendNotificationCookie.ahk" { IAsyncGetSendNotificationCookie }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IBidiAsyncNotifyChannel extends IPrintAsyncNotifyChannel {
    /**
     * The interface identifier for IBidiAsyncNotifyChannel
     * @type {Guid}
     */
    static IID := Guid("{532818f7-921b-4fb2-bff8-2f4fd52ebebf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBidiAsyncNotifyChannel interfaces
    */
    struct Vtbl extends IPrintAsyncNotifyChannel.Vtbl {
        CreateNotificationChannel        : IntPtr
        GetPrintName                     : IntPtr
        GetChannelNotificationType       : IntPtr
        AsyncGetNotificationSendResponse : IntPtr
        AsyncCloseChannel                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBidiAsyncNotifyChannel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CreateNotificationChannel() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrintAsyncNotifyDataObject>} param0 
     * @returns {HRESULT} 
     */
    GetPrintName(param0) {
        result := ComCall(6, this, IPrintAsyncNotifyDataObject.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrintAsyncNotifyDataObject>} param0 
     * @returns {HRESULT} 
     */
    GetChannelNotificationType(param0) {
        result := ComCall(7, this, IPrintAsyncNotifyDataObject.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintAsyncNotifyDataObject} param0 
     * @param {IAsyncGetSendNotificationCookie} param1 
     * @returns {HRESULT} 
     */
    AsyncGetNotificationSendResponse(param0, param1) {
        result := ComCall(8, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintAsyncNotifyDataObject} param0 
     * @param {IPrintAsyncCookie} param1 
     * @returns {HRESULT} 
     */
    AsyncCloseChannel(param0, param1) {
        result := ComCall(9, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBidiAsyncNotifyChannel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateNotificationChannel := CallbackCreate(GetMethod(implObj, "CreateNotificationChannel"), flags, 1)
        this.vtbl.GetPrintName := CallbackCreate(GetMethod(implObj, "GetPrintName"), flags, 2)
        this.vtbl.GetChannelNotificationType := CallbackCreate(GetMethod(implObj, "GetChannelNotificationType"), flags, 2)
        this.vtbl.AsyncGetNotificationSendResponse := CallbackCreate(GetMethod(implObj, "AsyncGetNotificationSendResponse"), flags, 3)
        this.vtbl.AsyncCloseChannel := CallbackCreate(GetMethod(implObj, "AsyncCloseChannel"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateNotificationChannel)
        CallbackFree(this.vtbl.GetPrintName)
        CallbackFree(this.vtbl.GetChannelNotificationType)
        CallbackFree(this.vtbl.AsyncGetNotificationSendResponse)
        CallbackFree(this.vtbl.AsyncCloseChannel)
    }
}
