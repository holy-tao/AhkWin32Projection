#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_CANCEL_COMMAND_CB.ahk" { PRJ_CANCEL_COMMAND_CB }
#Import ".\PRJ_END_DIRECTORY_ENUMERATION_CB.ahk" { PRJ_END_DIRECTORY_ENUMERATION_CB }
#Import ".\PRJ_GET_DIRECTORY_ENUMERATION_CB.ahk" { PRJ_GET_DIRECTORY_ENUMERATION_CB }
#Import ".\PRJ_GET_FILE_DATA_CB.ahk" { PRJ_GET_FILE_DATA_CB }
#Import ".\PRJ_GET_PLACEHOLDER_INFO_CB.ahk" { PRJ_GET_PLACEHOLDER_INFO_CB }
#Import ".\PRJ_NOTIFICATION_CB.ahk" { PRJ_NOTIFICATION_CB }
#Import ".\PRJ_QUERY_FILE_NAME_CB.ahk" { PRJ_QUERY_FILE_NAME_CB }
#Import ".\PRJ_START_DIRECTORY_ENUMERATION_CB.ahk" { PRJ_START_DIRECTORY_ENUMERATION_CB }

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
    StartDirectoryEnumerationCallback : PRJ_START_DIRECTORY_ENUMERATION_CB

    /**
     * A pointer to the EndDirectoryEnumerationCallback.
     */
    EndDirectoryEnumerationCallback : PRJ_END_DIRECTORY_ENUMERATION_CB

    /**
     * A pointer to the GetDirectoryEnumerationCallback.
     */
    GetDirectoryEnumerationCallback : PRJ_GET_DIRECTORY_ENUMERATION_CB

    /**
     * A pointer to the GetPlaceholderInformationCallback.
     */
    GetPlaceholderInfoCallback : PRJ_GET_PLACEHOLDER_INFO_CB

    /**
     * A pointer to the GetFileDataCallback.
     */
    GetFileDataCallback : PRJ_GET_FILE_DATA_CB

    /**
     * A pointer to the QueryFileNameCallback.
     */
    QueryFileNameCallback : PRJ_QUERY_FILE_NAME_CB

    /**
     * A pointer to the NotifyOperationCallback.
     */
    NotificationCallback : PRJ_NOTIFICATION_CB

    /**
     * A pointer to the CancelCommandCallback.
     */
    CancelCommandCallback : PRJ_CANCEL_COMMAND_CB

}
