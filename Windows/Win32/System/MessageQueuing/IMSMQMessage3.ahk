#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMSMQQueueInfo.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IMSMQQueueInfo3.ahk
#Include ..\Com\IDispatch.ahk
#Include .\IMSMQQueueInfo2.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQMessage3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQMessage3
     * @type {Guid}
     */
    static IID => Guid("{eba96b1a-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Class", "get_PrivLevel", "put_PrivLevel", "get_AuthLevel", "put_AuthLevel", "get_IsAuthenticated", "get_Delivery", "put_Delivery", "get_Trace", "put_Trace", "get_Priority", "put_Priority", "get_Journal", "put_Journal", "get_ResponseQueueInfo_v1", "putref_ResponseQueueInfo_v1", "get_AppSpecific", "put_AppSpecific", "get_SourceMachineGuid", "get_BodyLength", "get_Body", "put_Body", "get_AdminQueueInfo_v1", "putref_AdminQueueInfo_v1", "get_Id", "get_CorrelationId", "put_CorrelationId", "get_Ack", "put_Ack", "get_Label", "put_Label", "get_MaxTimeToReachQueue", "put_MaxTimeToReachQueue", "get_MaxTimeToReceive", "put_MaxTimeToReceive", "get_HashAlgorithm", "put_HashAlgorithm", "get_EncryptAlgorithm", "put_EncryptAlgorithm", "get_SentTime", "get_ArrivedTime", "get_DestinationQueueInfo", "get_SenderCertificate", "put_SenderCertificate", "get_SenderId", "get_SenderIdType", "put_SenderIdType", "Send", "AttachCurrentSecurityContext", "get_SenderVersion", "get_Extension", "put_Extension", "get_ConnectorTypeGuid", "put_ConnectorTypeGuid", "get_TransactionStatusQueueInfo", "get_DestinationSymmetricKey", "put_DestinationSymmetricKey", "get_Signature", "put_Signature", "get_AuthenticationProviderType", "put_AuthenticationProviderType", "get_AuthenticationProviderName", "put_AuthenticationProviderName", "put_SenderId", "get_MsgClass", "put_MsgClass", "get_Properties", "get_TransactionId", "get_IsFirstInTransaction", "get_IsLastInTransaction", "get_ResponseQueueInfo_v2", "putref_ResponseQueueInfo_v2", "get_AdminQueueInfo_v2", "putref_AdminQueueInfo_v2", "get_ReceivedAuthenticationLevel", "get_ResponseQueueInfo", "putref_ResponseQueueInfo", "get_AdminQueueInfo", "putref_AdminQueueInfo", "get_ResponseDestination", "putref_ResponseDestination", "get_Destination", "get_LookupId", "get_IsAuthenticated2", "get_IsFirstInTransaction2", "get_IsLastInTransaction2", "AttachCurrentSecurityContext2", "get_SoapEnvelope", "get_CompoundMessage", "put_SoapHeader", "put_SoapBody"]

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
    ResponseQueueInfo_v1 {
        get => this.get_ResponseQueueInfo_v1()
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
    AdminQueueInfo_v1 {
        get => this.get_AdminQueueInfo_v1()
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
     * @type {IMSMQQueueInfo3} 
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
        set => this.put_SenderId(value)
    }

    /**
     * @type {Integer} 
     */
    SenderIdType {
        get => this.get_SenderIdType()
        set => this.put_SenderIdType(value)
    }

    /**
     * @type {Integer} 
     */
    SenderVersion {
        get => this.get_SenderVersion()
    }

    /**
     * @type {VARIANT} 
     */
    Extension {
        get => this.get_Extension()
        set => this.put_Extension(value)
    }

    /**
     * @type {BSTR} 
     */
    ConnectorTypeGuid {
        get => this.get_ConnectorTypeGuid()
        set => this.put_ConnectorTypeGuid(value)
    }

    /**
     * @type {IMSMQQueueInfo3} 
     */
    TransactionStatusQueueInfo {
        get => this.get_TransactionStatusQueueInfo()
    }

    /**
     * @type {VARIANT} 
     */
    DestinationSymmetricKey {
        get => this.get_DestinationSymmetricKey()
        set => this.put_DestinationSymmetricKey(value)
    }

    /**
     * @type {VARIANT} 
     */
    Signature {
        get => this.get_Signature()
        set => this.put_Signature(value)
    }

    /**
     * @type {Integer} 
     */
    AuthenticationProviderType {
        get => this.get_AuthenticationProviderType()
        set => this.put_AuthenticationProviderType(value)
    }

    /**
     * @type {BSTR} 
     */
    AuthenticationProviderName {
        get => this.get_AuthenticationProviderName()
        set => this.put_AuthenticationProviderName(value)
    }

    /**
     * @type {Integer} 
     */
    MsgClass {
        get => this.get_MsgClass()
        set => this.put_MsgClass(value)
    }

    /**
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {VARIANT} 
     */
    TransactionId {
        get => this.get_TransactionId()
    }

    /**
     * @type {Integer} 
     */
    IsFirstInTransaction {
        get => this.get_IsFirstInTransaction()
    }

    /**
     * @type {Integer} 
     */
    IsLastInTransaction {
        get => this.get_IsLastInTransaction()
    }

    /**
     * @type {IMSMQQueueInfo2} 
     */
    ResponseQueueInfo_v2 {
        get => this.get_ResponseQueueInfo_v2()
    }

    /**
     * @type {IMSMQQueueInfo2} 
     */
    AdminQueueInfo_v2 {
        get => this.get_AdminQueueInfo_v2()
    }

    /**
     * @type {Integer} 
     */
    ReceivedAuthenticationLevel {
        get => this.get_ReceivedAuthenticationLevel()
    }

    /**
     * @type {IMSMQQueueInfo3} 
     */
    ResponseQueueInfo {
        get => this.get_ResponseQueueInfo()
    }

    /**
     * @type {IMSMQQueueInfo3} 
     */
    AdminQueueInfo {
        get => this.get_AdminQueueInfo()
    }

    /**
     * @type {IDispatch} 
     */
    ResponseDestination {
        get => this.get_ResponseDestination()
    }

    /**
     * @type {IDispatch} 
     */
    Destination {
        get => this.get_Destination()
    }

    /**
     * @type {VARIANT} 
     */
    LookupId {
        get => this.get_LookupId()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsAuthenticated2 {
        get => this.get_IsAuthenticated2()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsFirstInTransaction2 {
        get => this.get_IsFirstInTransaction2()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsLastInTransaction2 {
        get => this.get_IsLastInTransaction2()
    }

    /**
     * @type {BSTR} 
     */
    SoapEnvelope {
        get => this.get_SoapEnvelope()
    }

    /**
     * @type {VARIANT} 
     */
    CompoundMessage {
        get => this.get_CompoundMessage()
    }

    /**
     * @type {HRESULT} 
     */
    SoapHeader {
        set => this.put_SoapHeader(value)
    }

    /**
     * @type {HRESULT} 
     */
    SoapBody {
        set => this.put_SoapBody(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Class() {
        result := ComCall(7, this, "int*", &plClass := 0, "HRESULT")
        return plClass
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivLevel() {
        result := ComCall(8, this, "int*", &plPrivLevel := 0, "HRESULT")
        return plPrivLevel
    }

    /**
     * 
     * @param {Integer} lPrivLevel 
     * @returns {HRESULT} 
     */
    put_PrivLevel(lPrivLevel) {
        result := ComCall(9, this, "int", lPrivLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthLevel() {
        result := ComCall(10, this, "int*", &plAuthLevel := 0, "HRESULT")
        return plAuthLevel
    }

    /**
     * 
     * @param {Integer} lAuthLevel 
     * @returns {HRESULT} 
     */
    put_AuthLevel(lAuthLevel) {
        result := ComCall(11, this, "int", lAuthLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsAuthenticated() {
        result := ComCall(12, this, "short*", &pisAuthenticated := 0, "HRESULT")
        return pisAuthenticated
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Delivery() {
        result := ComCall(13, this, "int*", &plDelivery := 0, "HRESULT")
        return plDelivery
    }

    /**
     * 
     * @param {Integer} lDelivery 
     * @returns {HRESULT} 
     */
    put_Delivery(lDelivery) {
        result := ComCall(14, this, "int", lDelivery, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Trace() {
        result := ComCall(15, this, "int*", &plTrace := 0, "HRESULT")
        return plTrace
    }

    /**
     * 
     * @param {Integer} lTrace 
     * @returns {HRESULT} 
     */
    put_Trace(lTrace) {
        result := ComCall(16, this, "int", lTrace, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(17, this, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }

    /**
     * 
     * @param {Integer} lPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lPriority) {
        result := ComCall(18, this, "int", lPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Journal() {
        result := ComCall(19, this, "int*", &plJournal := 0, "HRESULT")
        return plJournal
    }

    /**
     * 
     * @param {Integer} lJournal 
     * @returns {HRESULT} 
     */
    put_Journal(lJournal) {
        result := ComCall(20, this, "int", lJournal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo} 
     */
    get_ResponseQueueInfo_v1() {
        result := ComCall(21, this, "ptr*", &ppqinfoResponse := 0, "HRESULT")
        return IMSMQQueueInfo(ppqinfoResponse)
    }

    /**
     * 
     * @param {IMSMQQueueInfo} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo_v1(pqinfoResponse) {
        result := ComCall(22, this, "ptr", pqinfoResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppSpecific() {
        result := ComCall(23, this, "int*", &plAppSpecific := 0, "HRESULT")
        return plAppSpecific
    }

    /**
     * 
     * @param {Integer} lAppSpecific 
     * @returns {HRESULT} 
     */
    put_AppSpecific(lAppSpecific) {
        result := ComCall(24, this, "int", lAppSpecific, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SourceMachineGuid() {
        pbstrGuidSrcMachine := BSTR()
        result := ComCall(25, this, "ptr", pbstrGuidSrcMachine, "HRESULT")
        return pbstrGuidSrcMachine
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BodyLength() {
        result := ComCall(26, this, "int*", &pcbBody := 0, "HRESULT")
        return pcbBody
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Body() {
        pvarBody := VARIANT()
        result := ComCall(27, this, "ptr", pvarBody, "HRESULT")
        return pvarBody
    }

    /**
     * 
     * @param {VARIANT} varBody 
     * @returns {HRESULT} 
     */
    put_Body(varBody) {
        result := ComCall(28, this, "ptr", varBody, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo} 
     */
    get_AdminQueueInfo_v1() {
        result := ComCall(29, this, "ptr*", &ppqinfoAdmin := 0, "HRESULT")
        return IMSMQQueueInfo(ppqinfoAdmin)
    }

    /**
     * 
     * @param {IMSMQQueueInfo} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo_v1(pqinfoAdmin) {
        result := ComCall(30, this, "ptr", pqinfoAdmin, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Id() {
        pvarMsgId := VARIANT()
        result := ComCall(31, this, "ptr", pvarMsgId, "HRESULT")
        return pvarMsgId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CorrelationId() {
        pvarMsgId := VARIANT()
        result := ComCall(32, this, "ptr", pvarMsgId, "HRESULT")
        return pvarMsgId
    }

    /**
     * 
     * @param {VARIANT} varMsgId 
     * @returns {HRESULT} 
     */
    put_CorrelationId(varMsgId) {
        result := ComCall(33, this, "ptr", varMsgId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ack() {
        result := ComCall(34, this, "int*", &plAck := 0, "HRESULT")
        return plAck
    }

    /**
     * 
     * @param {Integer} lAck 
     * @returns {HRESULT} 
     */
    put_Ack(lAck) {
        result := ComCall(35, this, "int", lAck, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Label() {
        pbstrLabel := BSTR()
        result := ComCall(36, this, "ptr", pbstrLabel, "HRESULT")
        return pbstrLabel
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_Label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(37, this, "ptr", bstrLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxTimeToReachQueue() {
        result := ComCall(38, this, "int*", &plMaxTimeToReachQueue := 0, "HRESULT")
        return plMaxTimeToReachQueue
    }

    /**
     * 
     * @param {Integer} lMaxTimeToReachQueue 
     * @returns {HRESULT} 
     */
    put_MaxTimeToReachQueue(lMaxTimeToReachQueue) {
        result := ComCall(39, this, "int", lMaxTimeToReachQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxTimeToReceive() {
        result := ComCall(40, this, "int*", &plMaxTimeToReceive := 0, "HRESULT")
        return plMaxTimeToReceive
    }

    /**
     * 
     * @param {Integer} lMaxTimeToReceive 
     * @returns {HRESULT} 
     */
    put_MaxTimeToReceive(lMaxTimeToReceive) {
        result := ComCall(41, this, "int", lMaxTimeToReceive, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HashAlgorithm() {
        result := ComCall(42, this, "int*", &plHashAlg := 0, "HRESULT")
        return plHashAlg
    }

    /**
     * 
     * @param {Integer} lHashAlg 
     * @returns {HRESULT} 
     */
    put_HashAlgorithm(lHashAlg) {
        result := ComCall(43, this, "int", lHashAlg, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EncryptAlgorithm() {
        result := ComCall(44, this, "int*", &plEncryptAlg := 0, "HRESULT")
        return plEncryptAlg
    }

    /**
     * 
     * @param {Integer} lEncryptAlg 
     * @returns {HRESULT} 
     */
    put_EncryptAlgorithm(lEncryptAlg) {
        result := ComCall(45, this, "int", lEncryptAlg, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SentTime() {
        pvarSentTime := VARIANT()
        result := ComCall(46, this, "ptr", pvarSentTime, "HRESULT")
        return pvarSentTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ArrivedTime() {
        plArrivedTime := VARIANT()
        result := ComCall(47, this, "ptr", plArrivedTime, "HRESULT")
        return plArrivedTime
    }

    /**
     * 
     * @returns {IMSMQQueueInfo3} 
     */
    get_DestinationQueueInfo() {
        result := ComCall(48, this, "ptr*", &ppqinfoDest := 0, "HRESULT")
        return IMSMQQueueInfo3(ppqinfoDest)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SenderCertificate() {
        pvarSenderCert := VARIANT()
        result := ComCall(49, this, "ptr", pvarSenderCert, "HRESULT")
        return pvarSenderCert
    }

    /**
     * 
     * @param {VARIANT} varSenderCert 
     * @returns {HRESULT} 
     */
    put_SenderCertificate(varSenderCert) {
        result := ComCall(50, this, "ptr", varSenderCert, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SenderId() {
        pvarSenderId := VARIANT()
        result := ComCall(51, this, "ptr", pvarSenderId, "HRESULT")
        return pvarSenderId
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SenderIdType() {
        result := ComCall(52, this, "int*", &plSenderIdType := 0, "HRESULT")
        return plSenderIdType
    }

    /**
     * 
     * @param {Integer} lSenderIdType 
     * @returns {HRESULT} 
     */
    put_SenderIdType(lSenderIdType) {
        result := ComCall(53, this, "int", lSenderIdType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} DestinationQueue 
     * @param {Pointer<VARIANT>} Transaction 
     * @returns {HRESULT} 
     */
    Send(DestinationQueue, Transaction) {
        result := ComCall(54, this, "ptr", DestinationQueue, "ptr", Transaction, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AttachCurrentSecurityContext() {
        result := ComCall(55, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SenderVersion() {
        result := ComCall(56, this, "int*", &plSenderVersion := 0, "HRESULT")
        return plSenderVersion
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Extension() {
        pvarExtension := VARIANT()
        result := ComCall(57, this, "ptr", pvarExtension, "HRESULT")
        return pvarExtension
    }

    /**
     * 
     * @param {VARIANT} varExtension 
     * @returns {HRESULT} 
     */
    put_Extension(varExtension) {
        result := ComCall(58, this, "ptr", varExtension, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ConnectorTypeGuid() {
        pbstrGuidConnectorType := BSTR()
        result := ComCall(59, this, "ptr", pbstrGuidConnectorType, "HRESULT")
        return pbstrGuidConnectorType
    }

    /**
     * 
     * @param {BSTR} bstrGuidConnectorType 
     * @returns {HRESULT} 
     */
    put_ConnectorTypeGuid(bstrGuidConnectorType) {
        bstrGuidConnectorType := bstrGuidConnectorType is String ? BSTR.Alloc(bstrGuidConnectorType).Value : bstrGuidConnectorType

        result := ComCall(60, this, "ptr", bstrGuidConnectorType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo3} 
     */
    get_TransactionStatusQueueInfo() {
        result := ComCall(61, this, "ptr*", &ppqinfoXactStatus := 0, "HRESULT")
        return IMSMQQueueInfo3(ppqinfoXactStatus)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_DestinationSymmetricKey() {
        pvarDestSymmKey := VARIANT()
        result := ComCall(62, this, "ptr", pvarDestSymmKey, "HRESULT")
        return pvarDestSymmKey
    }

    /**
     * 
     * @param {VARIANT} varDestSymmKey 
     * @returns {HRESULT} 
     */
    put_DestinationSymmetricKey(varDestSymmKey) {
        result := ComCall(63, this, "ptr", varDestSymmKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Signature() {
        pvarSignature := VARIANT()
        result := ComCall(64, this, "ptr", pvarSignature, "HRESULT")
        return pvarSignature
    }

    /**
     * 
     * @param {VARIANT} varSignature 
     * @returns {HRESULT} 
     */
    put_Signature(varSignature) {
        result := ComCall(65, this, "ptr", varSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationProviderType() {
        result := ComCall(66, this, "int*", &plAuthProvType := 0, "HRESULT")
        return plAuthProvType
    }

    /**
     * 
     * @param {Integer} lAuthProvType 
     * @returns {HRESULT} 
     */
    put_AuthenticationProviderType(lAuthProvType) {
        result := ComCall(67, this, "int", lAuthProvType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_AuthenticationProviderName() {
        pbstrAuthProvName := BSTR()
        result := ComCall(68, this, "ptr", pbstrAuthProvName, "HRESULT")
        return pbstrAuthProvName
    }

    /**
     * 
     * @param {BSTR} bstrAuthProvName 
     * @returns {HRESULT} 
     */
    put_AuthenticationProviderName(bstrAuthProvName) {
        bstrAuthProvName := bstrAuthProvName is String ? BSTR.Alloc(bstrAuthProvName).Value : bstrAuthProvName

        result := ComCall(69, this, "ptr", bstrAuthProvName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varSenderId 
     * @returns {HRESULT} 
     */
    put_SenderId(varSenderId) {
        result := ComCall(70, this, "ptr", varSenderId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MsgClass() {
        result := ComCall(71, this, "int*", &plMsgClass := 0, "HRESULT")
        return plMsgClass
    }

    /**
     * 
     * @param {Integer} lMsgClass 
     * @returns {HRESULT} 
     */
    put_MsgClass(lMsgClass) {
        result := ComCall(72, this, "int", lMsgClass, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(73, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_TransactionId() {
        pvarXactId := VARIANT()
        result := ComCall(74, this, "ptr", pvarXactId, "HRESULT")
        return pvarXactId
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsFirstInTransaction() {
        result := ComCall(75, this, "short*", &pisFirstInXact := 0, "HRESULT")
        return pisFirstInXact
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsLastInTransaction() {
        result := ComCall(76, this, "short*", &pisLastInXact := 0, "HRESULT")
        return pisLastInXact
    }

    /**
     * 
     * @returns {IMSMQQueueInfo2} 
     */
    get_ResponseQueueInfo_v2() {
        result := ComCall(77, this, "ptr*", &ppqinfoResponse := 0, "HRESULT")
        return IMSMQQueueInfo2(ppqinfoResponse)
    }

    /**
     * 
     * @param {IMSMQQueueInfo2} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo_v2(pqinfoResponse) {
        result := ComCall(78, this, "ptr", pqinfoResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo2} 
     */
    get_AdminQueueInfo_v2() {
        result := ComCall(79, this, "ptr*", &ppqinfoAdmin := 0, "HRESULT")
        return IMSMQQueueInfo2(ppqinfoAdmin)
    }

    /**
     * 
     * @param {IMSMQQueueInfo2} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo_v2(pqinfoAdmin) {
        result := ComCall(80, this, "ptr", pqinfoAdmin, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReceivedAuthenticationLevel() {
        result := ComCall(81, this, "short*", &psReceivedAuthenticationLevel := 0, "HRESULT")
        return psReceivedAuthenticationLevel
    }

    /**
     * 
     * @returns {IMSMQQueueInfo3} 
     */
    get_ResponseQueueInfo() {
        result := ComCall(82, this, "ptr*", &ppqinfoResponse := 0, "HRESULT")
        return IMSMQQueueInfo3(ppqinfoResponse)
    }

    /**
     * 
     * @param {IMSMQQueueInfo3} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo(pqinfoResponse) {
        result := ComCall(83, this, "ptr", pqinfoResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo3} 
     */
    get_AdminQueueInfo() {
        result := ComCall(84, this, "ptr*", &ppqinfoAdmin := 0, "HRESULT")
        return IMSMQQueueInfo3(ppqinfoAdmin)
    }

    /**
     * 
     * @param {IMSMQQueueInfo3} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo(pqinfoAdmin) {
        result := ComCall(85, this, "ptr", pqinfoAdmin, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_ResponseDestination() {
        result := ComCall(86, this, "ptr*", &ppdestResponse := 0, "HRESULT")
        return IDispatch(ppdestResponse)
    }

    /**
     * 
     * @param {IDispatch} pdestResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseDestination(pdestResponse) {
        result := ComCall(87, this, "ptr", pdestResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Destination() {
        result := ComCall(88, this, "ptr*", &ppdestDestination := 0, "HRESULT")
        return IDispatch(ppdestDestination)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_LookupId() {
        pvarLookupId := VARIANT()
        result := ComCall(89, this, "ptr", pvarLookupId, "HRESULT")
        return pvarLookupId
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsAuthenticated2() {
        result := ComCall(90, this, "short*", &pisAuthenticated := 0, "HRESULT")
        return pisAuthenticated
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsFirstInTransaction2() {
        result := ComCall(91, this, "short*", &pisFirstInXact := 0, "HRESULT")
        return pisFirstInXact
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLastInTransaction2() {
        result := ComCall(92, this, "short*", &pisLastInXact := 0, "HRESULT")
        return pisLastInXact
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AttachCurrentSecurityContext2() {
        result := ComCall(93, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SoapEnvelope() {
        pbstrSoapEnvelope := BSTR()
        result := ComCall(94, this, "ptr", pbstrSoapEnvelope, "HRESULT")
        return pbstrSoapEnvelope
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CompoundMessage() {
        pvarCompoundMessage := VARIANT()
        result := ComCall(95, this, "ptr", pvarCompoundMessage, "HRESULT")
        return pvarCompoundMessage
    }

    /**
     * 
     * @param {BSTR} bstrSoapHeader 
     * @returns {HRESULT} 
     */
    put_SoapHeader(bstrSoapHeader) {
        bstrSoapHeader := bstrSoapHeader is String ? BSTR.Alloc(bstrSoapHeader).Value : bstrSoapHeader

        result := ComCall(96, this, "ptr", bstrSoapHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSoapBody 
     * @returns {HRESULT} 
     */
    put_SoapBody(bstrSoapBody) {
        bstrSoapBody := bstrSoapBody is String ? BSTR.Alloc(bstrSoapBody).Value : bstrSoapBody

        result := ComCall(97, this, "ptr", bstrSoapBody, "HRESULT")
        return result
    }
}
