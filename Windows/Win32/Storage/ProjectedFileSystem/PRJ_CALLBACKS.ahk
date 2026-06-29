#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct PRJ_CALLBACKS {
    #StructPack 8

    /**
     * A pointer to the StartDirectoryEnumerationCallback.
     */
    StartDirectoryEnumerationCallback : IntPtr

    /**
     * A pointer to the EndDirectoryEnumerationCallback.
     */
    EndDirectoryEnumerationCallback : IntPtr

    /**
     * A pointer to the GetDirectoryEnumerationCallback.
     */
    GetDirectoryEnumerationCallback : IntPtr

    /**
     * A pointer to the GetPlaceholderInformationCallback.
     */
    GetPlaceholderInfoCallback : IntPtr

    /**
     * A pointer to the GetFileDataCallback.
     */
    GetFileDataCallback : IntPtr

    /**
     * A pointer to the QueryFileNameCallback.
     */
    QueryFileNameCallback : IntPtr

    /**
     * A pointer to the NotifyOperationCallback.
     */
    NotificationCallback : IntPtr

    /**
     * A pointer to the CancelCommandCallback.
     */
    CancelCommandCallback : IntPtr

}
