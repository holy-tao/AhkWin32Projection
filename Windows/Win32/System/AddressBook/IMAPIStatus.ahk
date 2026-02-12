#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * Provides status information about the MAPI subsystem, the integrated address book, and the MAPI spooler.
 * @remarks
 * The status objects that MAPI implements support the following methods:
 *   
 * |**Status object**|**Supported methods**|
 * |:-----|:-----|
 * |MAPI subsystem  <br/> |**ValidateState** only  <br/> |
 * |MAPI address book  <br/> |**ValidateState** only  <br/> |
 * |MAPI spooler  <br/> |**ValidateState** and **FlushQueues** <br/> |
 *    
 * The status objects that MAPI implements are required to have a read-only version of the methods of the [IMAPIProp](imapipropiunknown.md) interface and to support the **ValidateState** method. Transport providers should also support **FlushQueues**. All providers should support **SettingsDialog**; support for **ChangePassword** is optional. 
 *   
 * Clients use status objects to perform configuration and to learn about the state of the session. They access a status object by calling the **OpenStatusEntry** method of a service provider logon object or the [IMAPISession::GetStatusTable](imapisession-getstatustable.md) method to retrieve the status object.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imapistatusimapiprop
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIStatus extends IMAPIProp{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ValidateState", "SettingsDialog", "ChangePassword", "FlushQueues"]

    /**
     * IMAPIStatusValidateState confirms the external status information available for the MAPI resource or the service provider.
     * @remarks
     * The **IMAPIStatus::ValidateState** method checks the state of a resource that is associated with a status object. **ValidateState** is the only method in the [IMAPIStatus](imapistatusimapiprop.md) interface that is required for all status objects. The exact behavior of this method depends on the implementation. The following table describes the implementation of each of the different types of status objects. 
     *   
     * |**Status object**|****ValidateState** implementation**|
     * |:-----|:-----|
     * |MAPI subsystem  <br/> |Validates the state of all the resources that the currently active service providers and the subsystem itself own. |
     * |MAPI spooler  <br/> |Performs a logon of all transport providers, regardless of whether they are already logged on. |
     * |MAPI address book  <br/> |Checks the entries in its profile section. |
     * |Service provider  <br/> |Implementation depends on the type of provider and the flags set in the _ulFlags_ parameter. |
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of any dialog boxes or windows that this method displays.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the validation. The following flags can be set:
     *     
     * ABORT_XP_HEADER_OPERATION
     *   
     * > The user canceled the operation, typically by clicking the **Cancel** button in the corresponding dialog box. The status object has two options: 
     *     
     *    - Continue working on the operation.
     *     
     *    - Stop the operation and return MAPI_E_USER_CANCELED.
     *     
     * CONFIG_CHANGED 
     *   
     * > One or more of the status object's configuration properties changed. Clients can set this flag to allow the MAPI spooler to dynamically correct critical transport provider failures. 
     *     
     * FORCE_XP_CONNECT 
     *   
     * > The status object should perform a connection. When this flag is used with the REFRESH_XP_HEADER_CACHE or PROCESS_XP_HEADER_CACHE flag, the connection occurs without caching.
     *     
     * FORCE_XP_DISCONNECT 
     *   
     * > The status object should perform a disconnect operation. When this flag is used with the REFRESH_XP_HEADER_CACHE or PROCESS_XP_HEADER_CACHE flag, the disconnection occurs without caching.
     *     
     * PROCESS_XP_HEADER_CACHE 
     *   
     * > Entries in the header cache table should be processed, all messages marked with the MSGSTATUS_REMOTE_DOWNLOAD flag should be downloaded, and all messages marked with the MSGSTATUS_REMOTE_DELETE flag should be deleted. Messages that have both MSGSTATUS_REMOTE_DOWNLOAD and MSGSTATUS_REMOTE_DELETE set should be moved.
     *     
     * REFRESH_XP_HEADER_CACHE 
     *   
     * > For a remote transport provider, a new list of message headers should be downloaded and all flags that mark message status should be cleared.
     *     
     * SUPPRESS_UI 
     *   
     * > Prevents the status object from displaying a user interface as part of the operation.
     * @returns {HRESULT} S_OK 
     *   
     * > The validation was successful.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress; it should be allowed to complete, or it should be stopped, before this operation is initiated.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The status object does not support the validation method, as indicated by the absence of the STATUS_VALIDATE_STATE flag in the **PR_RESOURCE_METHODS** ([PidTagResourceMethods](pidtagresourcemethods-canonical-property.md)) property.
     *     
     * MAPI_E_USER_CANCEL 
     *   
     * > The user canceled the validation operation, typically by clicking the **Cancel** button in a dialog box. This value is returned only by remote transport providers.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imapistatus-validatestate
     */
    ValidateState(ulUIParam, ulFlags) {
        result := ComCall(14, this, "ptr", ulUIParam, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPIStatus::SettingsDialog** method displays a configuration property sheet. All service providers should support the **SettingsDialog** method, but it is not required. Service providers can implement their own property sheets or use the implementation supplied in the support object's [IMAPISupport::DoConfigPropsheet](imapisupport-doconfigpropsheet.md) method. **DoConfigPropsheet** builds a read/write property sheet.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the configuration property sheet.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the display of the property sheet. The following flag can be set:
     *     
     * UI_READONLY 
     *   
     * > Suggests that the provider should not enable users to change configuration properties. This flag is only a suggestion; it can be ignored.
     * @returns {HRESULT} S_OK 
     *   
     * > The configuration property sheet was displayed successfully.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The status object does not support this method, as indicated by the absence of the STATUS_SETTINGS_DIALOG flag in the **PR_RESOURCE_METHODS** ([PidTagResourceMethods](pidtagresourcemethods-canonical-property.md)) property.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imapistatus-settingsdialog
     */
    SettingsDialog(ulUIParam, ulFlags) {
        result := ComCall(15, this, "ptr", ulUIParam, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * Not all status objects support the **IMAPIStatus::ChangePassword** method. It is supported only by service providers that require clients to enter a password. None of the status objects that MAPI implements support the password change operation. 
     *   
     *  **ChangePassword** modifies a password programmatically, without user interaction.
     * @param {Pointer<Integer>} lpOldPass > [in] A pointer to the old password.
     * @param {Pointer<Integer>} lpNewPass > [in] A pointer to the new password.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the format of the passwords. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The passwords are in Unicode format. If the MAPI_UNICODE flag is not set, the passwords are in ANSI format.
     * @returns {HRESULT} S_OK 
     *   
     * > The password modification was successful.
     *     
     * MAPI_E_NO_ACCESS 
     *   
     * > The old password pointed to by  _lpOldPass_ is invalid. 
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The status object does not support this operation, as indicated by the absence of the STATUS_CHANGE_PASSWORD flag in the status object's **PR_RESOURCE_METHODS** ([PidTagResourceMethods](pidtagresourcemethods-canonical-property.md)) property.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imapistatus-changepassword
     */
    ChangePassword(lpOldPass, lpNewPass, ulFlags) {
        lpOldPassMarshal := lpOldPass is VarRef ? "char*" : "ptr"
        lpNewPassMarshal := lpNewPass is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, lpOldPassMarshal, lpOldPass, lpNewPassMarshal, lpNewPass, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPIStatus::FlushQueues** method requests that the MAPI spooler or a transport provider immediately send all messages in the outgoing queue or receive all messages from the incoming queue. **FlushQueues** is implemented only by the MAPI spooler status object and by status objects that transport providers supply. 
     *   
     * MAPI_E_BUSY should be returned for asynchronous requests so that clients can continue work. 
     *   
     * By default, **FlushQueues** is a synchronous operation; control does not return to the caller until the flush has completed. Only the flush operation performed by the MAPI spooler can be asynchronous; clients request this behavior by setting the FLUSH_ASYNC_OK flag.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of any dialog boxes or windows that this method displays.
     * @param {Integer} cbTargetTransport > [in] The byte count in the entry identifier pointed to by the  _lpTargetTransport_ parameter. The  _cbTargetTransport_ parameter is set only on calls to the MAPI spooler's status object. For calls to a transport provider, the  _cbTargetTransport_ parameter is set to 0.
     * @param {Pointer<ENTRYID>} lpTargetTransport > [in] A pointer to the entry identifier of the transport provider that is to flush its message queues. The  _lpTargetTransport_ parameter is set only on calls to the MAPI spooler's status object. For calls to a transport provider, the  _lpTargetTransport_ parameter is set to NULL.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the flush operation. The following flags can be set:
     *     
     * FLUSH_ASYNC_OK 
     *   
     * > The flush operation can occur asynchronously. This flag applies only to the MAPI spooler's status object. 
     *     
     * FLUSH_DOWNLOAD 
     *   
     * > The incoming message queues should be flushed.
     *     
     * FLUSH_FORCE 
     *   
     * > The flush operation should occur regardless, in spite of the chance of a decrease in performance. This flag must be set when an asynchronous transport provider is targeted.
     *     
     * FLUSH_NO_UI 
     *   
     * > The status object should not display a progress indicator.
     *     
     * FLUSH_UPLOAD 
     *   
     * > The outgoing message queues should be flushed.
     * @returns {HRESULT} S_OK 
     *   
     * > The flush operation was successful.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress; it should be allowed to complete, or it should be stopped, before this operation can be initiated.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The status object does not support this operation, as indicated by the absence of the STATUS_FLUSH_QUEUES flag in the status object's **PR_RESOURCE_METHODS** ([PidTagResourceMethods](pidtagresourcemethods-canonical-property.md)) property.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/imapistatus-flushqueues
     */
    FlushQueues(ulUIParam, cbTargetTransport, lpTargetTransport, ulFlags) {
        result := ComCall(17, this, "ptr", ulUIParam, "uint", cbTargetTransport, "ptr", lpTargetTransport, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
