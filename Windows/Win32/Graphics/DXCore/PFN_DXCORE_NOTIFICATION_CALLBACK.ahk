#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXCoreNotificationType.ahk" { DXCoreNotificationType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A callback function (implemented by your application), which is called by a DXCore object for notification events.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nc-dxcore_interface-pfn_dxcore_notification_callback
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct PFN_DXCORE_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DXCORE_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DXCoreNotificationType} notificationType Type: **[DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype)**
     * 
     * The type of notification representing this invocation. See the table in [DXCoreNotificationType](/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcorenotificationtype) for info about what types are valid with which kinds of objects.
     * @param {IUnknown} _object Type: **[IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown)\***
     * 
     * The [IDXCoreAdapter](/windows/win32/dxcore/dxcore_interface/nn-dxcore_interface-idxcoreadapter) or [IDXCoreAdapterList](/windows/win32/dxcore/dxcore_interface/nn-dxcore_interface-idxcoreadapterlist) object raising the notification.
     * @param {Pointer<Void>} _context Type: **void\***
     * 
     * A pointer, which may be `nullptr`, to an object containing context info.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(notificationType, _object, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DXCoreNotificationType, notificationType, "ptr", _object, _contextMarshal, _context)
    }

    /**
     * A PFN_DXCORE_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DXCORE_NOTIFICATION_CALLBACK {
        /**
         * Creates a PFN_DXCORE_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DXCoreNotificationType, "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DXCoreNotificationType, "ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
