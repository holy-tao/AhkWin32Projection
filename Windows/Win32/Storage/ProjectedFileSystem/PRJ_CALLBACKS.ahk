#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A set of callback routines to where the provider stores its implementation of the callback.
 * @remarks
 * The provider must supply implementations for StartDirectoryEnumerationCallback, EndDirectoryEnumerationCallback, GetDirectoryEnumerationCallback, GetPlaceholderInformationCallback, and GetFileDataCallback. 
  * 
  * 
  * 
  * The QueryFileNameCallback, NotifyOperationCallback, and CancelCommandCallback callbacks are optional.
  * 
  * <ul>
  * <li>If the provider does not supply an implementation of QueryFileNameCallback, ProjFS will invoke the directory enumeration callbacks to determine the existence of a file path in the provider's store.</li>
  * <li>If the provider does not supply an implementation of NotifyOperationCallback, it will not get any notifications from ProjFS.</li>
  * <li>If the provider does not supply an implementation of CancelCommandCallback, none of the other callbacks will be cancellable. The provider will process all callbacks synchronously.</li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_callbacks
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_CALLBACKS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A pointer to the StartDirectoryEnumerationCallback.
     * @type {Pointer<Ptr>}
     */
    StartDirectoryEnumerationCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the EndDirectoryEnumerationCallback.
     * @type {Pointer<Ptr>}
     */
    EndDirectoryEnumerationCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the GetDirectoryEnumerationCallback.
     * @type {Pointer<Ptr>}
     */
    GetDirectoryEnumerationCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the GetPlaceholderInformationCallback.
     * @type {Pointer<Ptr>}
     */
    GetPlaceholderInfoCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the GetFileDataCallback.
     * @type {Pointer<Ptr>}
     */
    GetFileDataCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the QueryFileNameCallback.
     * @type {Pointer<Ptr>}
     */
    QueryFileNameCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the NotifyOperationCallback.
     * @type {Pointer<Ptr>}
     */
    NotificationCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the CancelCommandCallback.
     * @type {Pointer<Ptr>}
     */
    CancelCommandCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
