#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a callback method for raw image change nofications.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicdeveloprawnotificationcallback
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICDevelopRawNotificationCallback extends IUnknown {
    /**
     * The interface identifier for IWICDevelopRawNotificationCallback
     * @type {Guid}
     */
    static IID := Guid("{95c75a6e-3e8c-4ec2-85a8-aebcc551e59b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICDevelopRawNotificationCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Notify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICDevelopRawNotificationCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * An application-defined callback method used for raw image parameter change notifications.
     * @param {Integer} NotificationMask Type: <b>UINT</b>
     * 
     * A set of <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-iwicdeveloprawnotification-constants">IWICDevelopRawNotificationCallback Constants</a> parameter notification flags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdeveloprawnotificationcallback-notify
     */
    Notify(NotificationMask) {
        result := ComCall(3, this, "uint", NotificationMask, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICDevelopRawNotificationCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Notify)
    }
}
