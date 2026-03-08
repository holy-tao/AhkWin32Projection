#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQQueueInfo2.ahk
#Include .\IMSMQMessage.ahk
#Include .\IMSMQMessage2.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueue2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQueue2
     * @type {Guid}
     */
    static IID => Guid("{ef0574e0-06d8-11d3-b100-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Access", "get_ShareMode", "get_QueueInfo", "get_Handle", "get_IsOpen", "Close", "Receive_v1", "Peek_v1", "EnableNotification", "Reset", "ReceiveCurrent_v1", "PeekNext_v1", "PeekCurrent_v1", "Receive", "Peek", "ReceiveCurrent", "PeekNext", "PeekCurrent", "get_Properties"]

    /**
     * @type {Integer} 
     */
    Access {
        get => this.get_Access()
    }

    /**
     * @type {Integer} 
     */
    ShareMode {
        get => this.get_ShareMode()
    }

    /**
     * @type {IMSMQQueueInfo2} 
     */
    QueueInfo {
        get => this.get_QueueInfo()
    }

    /**
     * @type {Integer} 
     */
    Handle {
        get => this.get_Handle()
    }

    /**
     * @type {Integer} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Access() {
        result := ComCall(7, this, "int*", &plAccess := 0, "HRESULT")
        return plAccess
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShareMode() {
        result := ComCall(8, this, "int*", &plShareMode := 0, "HRESULT")
        return plShareMode
    }

    /**
     * 
     * @returns {IMSMQQueueInfo2} 
     */
    get_QueueInfo() {
        result := ComCall(9, this, "ptr*", &ppqinfo := 0, "HRESULT")
        return IMSMQQueueInfo2(ppqinfo)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Handle() {
        result := ComCall(10, this, "int*", &plHandle := 0, "HRESULT")
        return plHandle
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsOpen() {
        result := ComCall(11, this, "short*", &pisOpen := 0, "HRESULT")
        return pisOpen
    }

    /**
     * Use the Close-Session packet to tell the BITS server that file upload is complete and to end the session.
     * @remarks
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * For upload-reply jobs, you must download the reply before sending **Close-Session**. Otherwise, the reply is lost.
     * 
     * If you send this packet before uploading all fragments, the upload file is deleted; you cannot upload a partial file.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/close-session
     */
    Close() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {IMSMQMessage} 
     */
    Receive_v1(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(13, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {IMSMQMessage} 
     */
    Peek_v1(WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(14, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {IMSMQEvent2} Event 
     * @param {Pointer<VARIANT>} Cursor 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {HRESULT} 
     */
    EnableNotification(Event, Cursor, ReceiveTimeout) {
        result := ComCall(15, this, "ptr", Event, "ptr", Cursor, "ptr", ReceiveTimeout, "HRESULT")
        return result
    }

    /**
     * Resets the time-out period or other mechanism that TPM manufacturers implement to protect against dictionary attacks on TPM authorization values.
     * @remarks
     * This method calls the TPM\_ResetLockValue command on the TPM. The exact behavior of this method varies among TPM manufacturers. Documentation from the computer or TPM manufacturer may provide additional information on the implementation of the anti-dictionary attack mechanism.
     * 
     * In general, manufacturers can detect dictionary attacks by keeping track of failed authentications. If the number or frequency of failures become high enough, the TPM will lock out further commands for a certain time. Generally, the initial time-out period will be short, to allow a legitimate user a chance to correct the situation. If failures continue, the duration of each subsequent time-out period may increase rapidly.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned. The following table lists some of the common return values.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                            | Description                                                                                                                                                                                                                                                               |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                            | The method was successful.<br/>                                                                                                                                                                                                                                     |
     * | <dl> <dt>**TPM\_E\_AUTHFAIL**</dt> <dt>2150105089 (0x80280001)</dt> </dl> | The provided owner authorization value is incorrect. Additional attempts at resetting the lock will fail with this same error. Please wait until the time-out period or other manufacturer-specific mechanism has expired before retrying locked TPM commands.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/resetauthlockout-win32-tpm
     */
    Reset() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {IMSMQMessage} 
     */
    ReceiveCurrent_v1(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(17, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {IMSMQMessage} 
     */
    PeekNext_v1(WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(18, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @returns {IMSMQMessage} 
     */
    PeekCurrent_v1(WantDestinationQueue, WantBody, ReceiveTimeout) {
        result := ComCall(19, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    Receive(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(20, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * Reads data from the specified console input buffer without removing it from the buffer.
     * @remarks
     * If the number of records requested exceeds the number of records available in the buffer, the number available is read. If no data is available, the function returns immediately.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     * @see https://learn.microsoft.com/windows/console/peekconsoleinput
     */
    Peek(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(21, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Transaction 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    ReceiveCurrent(Transaction, WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(22, this, "ptr", Transaction, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    PeekNext(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(23, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} WantDestinationQueue 
     * @param {Pointer<VARIANT>} WantBody 
     * @param {Pointer<VARIANT>} ReceiveTimeout 
     * @param {Pointer<VARIANT>} WantConnectorType 
     * @returns {IMSMQMessage2} 
     */
    PeekCurrent(WantDestinationQueue, WantBody, ReceiveTimeout, WantConnectorType) {
        result := ComCall(24, this, "ptr", WantDestinationQueue, "ptr", WantBody, "ptr", ReceiveTimeout, "ptr", WantConnectorType, "ptr*", &ppmsg := 0, "HRESULT")
        return IMSMQMessage2(ppmsg)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(25, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }
}
