#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods used for progress notification for encoders and decoders.
 * @remarks
 * This interface is not supported by the Windows provided codecs.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapcodecprogressnotification
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapCodecProgressNotification extends IUnknown {
    /**
     * The interface identifier for IWICBitmapCodecProgressNotification
     * @type {Guid}
     */
    static IID := Guid("{64c1024e-c3cf-4462-8078-88c2b11c46d9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapCodecProgressNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterProgressNotification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapCodecProgressNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a progress notification callback function.
     * @remarks
     * Applications can only register a single callback. Subsequent registration calls will replace the previously registered callback. To unregister a callback, pass in <b>NULL</b> or register a new callback function.
     * 
     * Progress is reported in an increasing order between 0.0 and 1.0. 
     *             If <i>dwProgressFlags</i> includes <b>WICProgressNotificationBegin</b>, the callback is guaranteed to be called with progress 0.0.
     *             If <i>dwProgressFlags</i> includes <b>WICProgressNotificationEnd</b>, the callback is guaranteed to be called with progress 1.0.
     *          
     * 
     * <b>WICProgressNotificationFrequent</b> increases the frequency in which the callback is called.
     *             If an operation is expected to take more than 30 seconds, <b>WICProgressNotificationFrequent</b> should be added to <i>dwProgressFlags</i>.
     * @param {Pointer<PFNProgressNotification>} _pfnProgressNotification Type: <b>PFNProgressNotification</b>
     * 
     * A function pointer to the application defined progress notification callback function. See <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nc-wincodec-pfnprogressnotification">ProgressNotificationCallback</a> for the callback signature.
     * @param {Pointer<Void>} pvData Type: <b>LPVOID</b>
     * 
     * A pointer to component data for the callback method.
     * @param {Integer} dwProgressFlags Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicprogressoperation">WICProgressOperation</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicprogressnotification">WICProgressNotification</a> flags to use for progress notification.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecprogressnotification-registerprogressnotification
     */
    RegisterProgressNotification(_pfnProgressNotification, pvData, dwProgressFlags) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", _pfnProgressNotification, pvDataMarshal, pvData, "uint", dwProgressFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICBitmapCodecProgressNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterProgressNotification := CallbackCreate(GetMethod(implObj, "RegisterProgressNotification"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterProgressNotification)
    }
}
