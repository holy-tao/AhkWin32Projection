#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMSMQQueueInfo.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQMessage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQMessage
     * @type {Guid}
     */
    static IID => Guid("{d7d6e074-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQMessage
     * @type {Guid}
     */
    static CLSID => Guid("{d7d6e075-dccd-11d0-aa4b-0060970debae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Class", "get_PrivLevel", "put_PrivLevel", "get_AuthLevel", "put_AuthLevel", "get_IsAuthenticated", "get_Delivery", "put_Delivery", "get_Trace", "put_Trace", "get_Priority", "put_Priority", "get_Journal", "put_Journal", "get_ResponseQueueInfo", "putref_ResponseQueueInfo", "get_AppSpecific", "put_AppSpecific", "get_SourceMachineGuid", "get_BodyLength", "get_Body", "put_Body", "get_AdminQueueInfo", "putref_AdminQueueInfo", "get_Id", "get_CorrelationId", "put_CorrelationId", "get_Ack", "put_Ack", "get_Label", "put_Label", "get_MaxTimeToReachQueue", "put_MaxTimeToReachQueue", "get_MaxTimeToReceive", "put_MaxTimeToReceive", "get_HashAlgorithm", "put_HashAlgorithm", "get_EncryptAlgorithm", "put_EncryptAlgorithm", "get_SentTime", "get_ArrivedTime", "get_DestinationQueueInfo", "get_SenderCertificate", "put_SenderCertificate", "get_SenderId", "get_SenderIdType", "put_SenderIdType", "Send", "AttachCurrentSecurityContext"]

    /**
     * @type {Integer} 
     */
    Class {
        get => this.get_Class()
    }

    /**
     * @type {Integer} 
     */
    PrivLevel {
        get => this.get_PrivLevel()
        set => this.put_PrivLevel(value)
    }

    /**
     * @type {Integer} 
     */
    AuthLevel {
        get => this.get_AuthLevel()
        set => this.put_AuthLevel(value)
    }

    /**
     * @type {Integer} 
     */
    IsAuthenticated {
        get => this.get_IsAuthenticated()
    }

    /**
     * @type {Integer} 
     */
    Delivery {
        get => this.get_Delivery()
        set => this.put_Delivery(value)
    }

    /**
     * @type {Integer} 
     */
    Trace {
        get => this.get_Trace()
        set => this.put_Trace(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {Integer} 
     */
    Journal {
        get => this.get_Journal()
        set => this.put_Journal(value)
    }

    /**
     * @type {IMSMQQueueInfo} 
     */
    ResponseQueueInfo {
        get => this.get_ResponseQueueInfo()
    }

    /**
     * @type {Integer} 
     */
    AppSpecific {
        get => this.get_AppSpecific()
        set => this.put_AppSpecific(value)
    }

    /**
     * @type {BSTR} 
     */
    SourceMachineGuid {
        get => this.get_SourceMachineGuid()
    }

    /**
     * @type {Integer} 
     */
    BodyLength {
        get => this.get_BodyLength()
    }

    /**
     * @type {VARIANT} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * @type {IMSMQQueueInfo} 
     */
    AdminQueueInfo {
        get => this.get_AdminQueueInfo()
    }

    /**
     * @type {VARIANT} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {VARIANT} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
        set => this.put_CorrelationId(value)
    }

    /**
     * @type {Integer} 
     */
    Ack {
        get => this.get_Ack()
        set => this.put_Ack(value)
    }

    /**
     * @type {BSTR} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * @type {Integer} 
     */
    MaxTimeToReachQueue {
        get => this.get_MaxTimeToReachQueue()
        set => this.put_MaxTimeToReachQueue(value)
    }

    /**
     * @type {Integer} 
     */
    MaxTimeToReceive {
        get => this.get_MaxTimeToReceive()
        set => this.put_MaxTimeToReceive(value)
    }

    /**
     * @type {Integer} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * @type {Integer} 
     */
    EncryptAlgorithm {
        get => this.get_EncryptAlgorithm()
        set => this.put_EncryptAlgorithm(value)
    }

    /**
     * @type {VARIANT} 
     */
    SentTime {
        get => this.get_SentTime()
    }

    /**
     * @type {VARIANT} 
     */
    ArrivedTime {
        get => this.get_ArrivedTime()
    }

    /**
     * @type {IMSMQQueueInfo} 
     */
    DestinationQueueInfo {
        get => this.get_DestinationQueueInfo()
    }

    /**
     * @type {VARIANT} 
     */
    SenderCertificate {
        get => this.get_SenderCertificate()
        set => this.put_SenderCertificate(value)
    }

    /**
     * @type {VARIANT} 
     */
    SenderId {
        get => this.get_SenderId()
    }

    /**
     * @type {Integer} 
     */
    SenderIdType {
        get => this.get_SenderIdType()
        set => this.put_SenderIdType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Class() {
        result := ComCall(7, this, "int*", &plClass := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plClass
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivLevel() {
        result := ComCall(8, this, "int*", &plPrivLevel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plPrivLevel
    }

    /**
     * 
     * @param {Integer} lPrivLevel 
     * @returns {HRESULT} 
     */
    put_PrivLevel(lPrivLevel) {
        result := ComCall(9, this, "int", lPrivLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthLevel() {
        result := ComCall(10, this, "int*", &plAuthLevel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plAuthLevel
    }

    /**
     * 
     * @param {Integer} lAuthLevel 
     * @returns {HRESULT} 
     */
    put_AuthLevel(lAuthLevel) {
        result := ComCall(11, this, "int", lAuthLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsAuthenticated() {
        result := ComCall(12, this, "short*", &pisAuthenticated := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pisAuthenticated
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Delivery() {
        result := ComCall(13, this, "int*", &plDelivery := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plDelivery
    }

    /**
     * 
     * @param {Integer} lDelivery 
     * @returns {HRESULT} 
     */
    put_Delivery(lDelivery) {
        result := ComCall(14, this, "int", lDelivery, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Trace() {
        result := ComCall(15, this, "int*", &plTrace := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plTrace
    }

    /**
     * 
     * @param {Integer} lTrace 
     * @returns {HRESULT} 
     */
    put_Trace(lTrace) {
        result := ComCall(16, this, "int", lTrace, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(17, this, "int*", &plPriority := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plPriority
    }

    /**
     * 
     * @param {Integer} lPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lPriority) {
        result := ComCall(18, this, "int", lPriority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Journal() {
        result := ComCall(19, this, "int*", &plJournal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plJournal
    }

    /**
     * 
     * @param {Integer} lJournal 
     * @returns {HRESULT} 
     */
    put_Journal(lJournal) {
        result := ComCall(20, this, "int", lJournal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo} 
     */
    get_ResponseQueueInfo() {
        result := ComCall(21, this, "ptr*", &ppqinfoResponse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMSMQQueueInfo(ppqinfoResponse)
    }

    /**
     * 
     * @param {IMSMQQueueInfo} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo(pqinfoResponse) {
        result := ComCall(22, this, "ptr", pqinfoResponse, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppSpecific() {
        result := ComCall(23, this, "int*", &plAppSpecific := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plAppSpecific
    }

    /**
     * 
     * @param {Integer} lAppSpecific 
     * @returns {HRESULT} 
     */
    put_AppSpecific(lAppSpecific) {
        result := ComCall(24, this, "int", lAppSpecific, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SourceMachineGuid() {
        pbstrGuidSrcMachine := BSTR()
        result := ComCall(25, this, "ptr", pbstrGuidSrcMachine, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrGuidSrcMachine
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BodyLength() {
        result := ComCall(26, this, "int*", &pcbBody := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbBody
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Body() {
        pvarBody := VARIANT()
        result := ComCall(27, this, "ptr", pvarBody, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarBody
    }

    /**
     * 
     * @param {VARIANT} varBody 
     * @returns {HRESULT} 
     */
    put_Body(varBody) {
        result := ComCall(28, this, "ptr", varBody, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo} 
     */
    get_AdminQueueInfo() {
        result := ComCall(29, this, "ptr*", &ppqinfoAdmin := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMSMQQueueInfo(ppqinfoAdmin)
    }

    /**
     * 
     * @param {IMSMQQueueInfo} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo(pqinfoAdmin) {
        result := ComCall(30, this, "ptr", pqinfoAdmin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Id() {
        pvarMsgId := VARIANT()
        result := ComCall(31, this, "ptr", pvarMsgId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarMsgId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CorrelationId() {
        pvarMsgId := VARIANT()
        result := ComCall(32, this, "ptr", pvarMsgId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarMsgId
    }

    /**
     * 
     * @param {VARIANT} varMsgId 
     * @returns {HRESULT} 
     */
    put_CorrelationId(varMsgId) {
        result := ComCall(33, this, "ptr", varMsgId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ack() {
        result := ComCall(34, this, "int*", &plAck := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plAck
    }

    /**
     * 
     * @param {Integer} lAck 
     * @returns {HRESULT} 
     */
    put_Ack(lAck) {
        result := ComCall(35, this, "int", lAck, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Label() {
        pbstrLabel := BSTR()
        result := ComCall(36, this, "ptr", pbstrLabel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrLabel
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_Label(bstrLabel) {
        if(bstrLabel is String) {
            pin := BSTR.Alloc(bstrLabel)
            bstrLabel := pin.Value
        }

        result := ComCall(37, this, "ptr", bstrLabel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxTimeToReachQueue() {
        result := ComCall(38, this, "int*", &plMaxTimeToReachQueue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plMaxTimeToReachQueue
    }

    /**
     * 
     * @param {Integer} lMaxTimeToReachQueue 
     * @returns {HRESULT} 
     */
    put_MaxTimeToReachQueue(lMaxTimeToReachQueue) {
        result := ComCall(39, this, "int", lMaxTimeToReachQueue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxTimeToReceive() {
        result := ComCall(40, this, "int*", &plMaxTimeToReceive := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plMaxTimeToReceive
    }

    /**
     * 
     * @param {Integer} lMaxTimeToReceive 
     * @returns {HRESULT} 
     */
    put_MaxTimeToReceive(lMaxTimeToReceive) {
        result := ComCall(41, this, "int", lMaxTimeToReceive, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HashAlgorithm() {
        result := ComCall(42, this, "int*", &plHashAlg := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plHashAlg
    }

    /**
     * 
     * @param {Integer} lHashAlg 
     * @returns {HRESULT} 
     */
    put_HashAlgorithm(lHashAlg) {
        result := ComCall(43, this, "int", lHashAlg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EncryptAlgorithm() {
        result := ComCall(44, this, "int*", &plEncryptAlg := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plEncryptAlg
    }

    /**
     * 
     * @param {Integer} lEncryptAlg 
     * @returns {HRESULT} 
     */
    put_EncryptAlgorithm(lEncryptAlg) {
        result := ComCall(45, this, "int", lEncryptAlg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SentTime() {
        pvarSentTime := VARIANT()
        result := ComCall(46, this, "ptr", pvarSentTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarSentTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ArrivedTime() {
        plArrivedTime := VARIANT()
        result := ComCall(47, this, "ptr", plArrivedTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plArrivedTime
    }

    /**
     * 
     * @returns {IMSMQQueueInfo} 
     */
    get_DestinationQueueInfo() {
        result := ComCall(48, this, "ptr*", &ppqinfoDest := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMSMQQueueInfo(ppqinfoDest)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SenderCertificate() {
        pvarSenderCert := VARIANT()
        result := ComCall(49, this, "ptr", pvarSenderCert, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarSenderCert
    }

    /**
     * 
     * @param {VARIANT} varSenderCert 
     * @returns {HRESULT} 
     */
    put_SenderCertificate(varSenderCert) {
        result := ComCall(50, this, "ptr", varSenderCert, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SenderId() {
        pvarSenderId := VARIANT()
        result := ComCall(51, this, "ptr", pvarSenderId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarSenderId
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SenderIdType() {
        result := ComCall(52, this, "int*", &plSenderIdType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plSenderIdType
    }

    /**
     * 
     * @param {Integer} lSenderIdType 
     * @returns {HRESULT} 
     */
    put_SenderIdType(lSenderIdType) {
        result := ComCall(53, this, "int", lSenderIdType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Send BLOB Data to SQL SERVER Using IROWSETFASTLOAD and ISEQUENTIALSTREAM in (Native Client OLE DB)
     * @param {IMSMQQueue} DestinationQueue 
     * @param {Pointer<VARIANT>} Transaction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/send-blob-data-to-sql-server-using-irowsetfastload-and-isequentialstream-ole-db
     */
    Send(DestinationQueue, Transaction) {
        result := ComCall(54, this, "ptr", DestinationQueue, "ptr", Transaction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AttachCurrentSecurityContext() {
        result := ComCall(55, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
