#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PRJ_CALLBACK_DATA.ahk" { PRJ_CALLBACK_DATA }
#Import ".\PRJ_NOTIFICATION.ahk" { PRJ_NOTIFICATION }
#Import ".\PRJ_NOTIFICATION_PARAMETERS.ahk" { PRJ_NOTIFICATION_PARAMETERS }

/**
 * Delivers notifications to the provider about file system operations.
 * @remarks
 * This callback is optional. If the provider does not supply an implementation of this callback, it will not receive notifications. 
 * 
 * 
 * The provider registers for the notifications it wishes to receive when it calls <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nc-projectedfslib-prj_notification_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_NOTIFICATION_CB {
    value : IntPtr

    __value {
        set {
            if (value is PRJ_NOTIFICATION_CB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PRJ_CALLBACK_DATA>} callbackData Information about the operation. The following <i>callbackData</i> members are necessary to implement this callback:<dl>
     * <dd><b>FilePathName</b> Identifies the path for the file or directory to which the notification pertains.
     * 
     * </dd>
     * </dl>
     * 
     * 
     * The provider can access this buffer only while the callback is running. If it wishes to pend the operation and it requires data from this buffer, it must make its own copy of it.
     * @param {BOOLEAN} isDirectory TRUE if the <b>FilePathName</b> field in <i>callbackData</i> refers to a directory, FALSE otherwise.
     * @param {PRJ_NOTIFICATION} _notification A <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ne-projectedfslib-prj_notification">PRJ_NOTIFICATION</a> value specifying the notification.
     * @param {PWSTR} destinationFileName If <b>notification</b> is <b>PRJ_NOTIFICATION_PRE_RENAME </b> or <b>PRJ_NOTIFICATION_PRE_SET_HARDLINK</b>, this points to a null-terminated Unicode string specifying the path, relative to the virtualization root, of the target of the rename or set-hardlink operation.
     * @param {Pointer<PRJ_NOTIFICATION_PARAMETERS>} operationParameters A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_notification_parameters">PRJ_NOTIFICATION_PARAMETERS</a> union specifying extra parameters for certain values of <i>notification</i>:
     * 
     * <b>PRJ_NOTIFICATION_FILE_OPENED</b>, <b>PRJ_NOTIFICATION_NEW_FILE_CREATED</b>, or <b>PRJ_NOTIFICATION_FILE_OVERWRITTEN</b><dl>
     * <dd>
     * The fields of the <b>PostCreate</b> member are specified.  These fields are:
     * 
     * <b>NotificationMask</b><dl>
     * <dd>
     * Upon return from the PRJ_NOTIFICATION_CB callback, the provider may specify a new set of notifications that it wishes to receive for the file here. 
     * 
     * If the provider sets this value to 0, it is equivalent to specifying <b>PRJ_NOTIFY_USE_EXISTING_MASK</b>.
     * 
     * </dd>
     * </dl>
     * 
     * 
     * </dd>
     * </dl>
     * 
     * 
     * <b>PRJ_NOTIFICATION_FILE_RENAMED</b><dl>
     * <dd>
     * The fields of the <b>FileRenamed</b> member are specified.  These fields are:
     * 
     * <b>NotificationMask</b><dl>
     * <dd>
     * Upon return from the PRJ_NOTIFICATION_CB callback, the provider may specify a new set of notifications that it wishes to receive for the file here. 
     * 
     * If the provider sets this value to 0, it is equivalent to specifying <b>PRJ_NOTIFY_USE_EXISTING_MASK</b>.
     * 
     * </dd>
     * </dl>
     * 
     * 
     * </dd>
     * </dl>
     * 
     * 
     * <b>PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_DELETED</b><ul>
     * <li>
     * The fields of the <b>FileDeletedOnHandleClose</b> member are specified.  These fields are:
     * 
     * <b>NotificationMask</b><dl>
     * <dd>
     * If the provider registered for <b>PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_MODIFIED</b> as well as <b>PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_DELETED</b>, this field is set to TRUE if the file was modified before it was deleted.
     * 
     * </dd>
     * </dl>
     * 
     * 
     * </li>
     * </ul>
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider successfully processed the notification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> 
     * HRESULT_FROM_WIN32(ERROR_IO_PENDING)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider wishes to complete the operation at a later time. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     *  
     * An appropriate HRESULT error code if the provider fails the operation. For pre-operation notifications (operations with "PRE" in their name), if the provider returns a failure code ProjFS will fail the corresponding operation with the provided error code.
     */
    Call(callbackData, isDirectory, _notification, destinationFileName, operationParameters) {
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := DllCall(this.value, PRJ_CALLBACK_DATA.Ptr, callbackData, BOOLEAN, isDirectory, PRJ_NOTIFICATION, _notification, "ptr", destinationFileName, PRJ_NOTIFICATION_PARAMETERS.Ptr, operationParameters, "HRESULT")
        return result
    }

    /**
     * A PRJ_NOTIFICATION_CB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRJ_NOTIFICATION_CB {
        /**
         * Creates a PRJ_NOTIFICATION_CB pointer that invokes the given AHK function when called.
         * @param {Func(PRJ_CALLBACK_DATA, BOOLEAN, PRJ_NOTIFICATION, PWSTR, PRJ_NOTIFICATION_PARAMETERS) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PRJ_CALLBACK_DATA.Ptr, BOOLEAN, PRJ_NOTIFICATION, PWSTR, PRJ_NOTIFICATION_PARAMETERS.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
