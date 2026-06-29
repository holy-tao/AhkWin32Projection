#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQQueueInfo4.ahk" { IMSMQQueueInfo4 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMSMQQueueInfo2.ahk" { IMSMQQueueInfo2 }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IMSMQQueueInfo.ahk" { IMSMQQueueInfo }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQMessage4 extends IDispatch {
    /**
     * The interface identifier for IMSMQMessage4
     * @type {Guid}
     */
    static IID := Guid("{eba96b23-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQMessage4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Class                       : IntPtr
        get_PrivLevel                   : IntPtr
        put_PrivLevel                   : IntPtr
        get_AuthLevel                   : IntPtr
        put_AuthLevel                   : IntPtr
        get_IsAuthenticated             : IntPtr
        get_Delivery                    : IntPtr
        put_Delivery                    : IntPtr
        get_Trace                       : IntPtr
        put_Trace                       : IntPtr
        get_Priority                    : IntPtr
        put_Priority                    : IntPtr
        get_Journal                     : IntPtr
        put_Journal                     : IntPtr
        get_ResponseQueueInfo_v1        : IntPtr
        putref_ResponseQueueInfo_v1     : IntPtr
        get_AppSpecific                 : IntPtr
        put_AppSpecific                 : IntPtr
        get_SourceMachineGuid           : IntPtr
        get_BodyLength                  : IntPtr
        get_Body                        : IntPtr
        put_Body                        : IntPtr
        get_AdminQueueInfo_v1           : IntPtr
        putref_AdminQueueInfo_v1        : IntPtr
        get_Id                          : IntPtr
        get_CorrelationId               : IntPtr
        put_CorrelationId               : IntPtr
        get_Ack                         : IntPtr
        put_Ack                         : IntPtr
        get_Label                       : IntPtr
        put_Label                       : IntPtr
        get_MaxTimeToReachQueue         : IntPtr
        put_MaxTimeToReachQueue         : IntPtr
        get_MaxTimeToReceive            : IntPtr
        put_MaxTimeToReceive            : IntPtr
        get_HashAlgorithm               : IntPtr
        put_HashAlgorithm               : IntPtr
        get_EncryptAlgorithm            : IntPtr
        put_EncryptAlgorithm            : IntPtr
        get_SentTime                    : IntPtr
        get_ArrivedTime                 : IntPtr
        get_DestinationQueueInfo        : IntPtr
        get_SenderCertificate           : IntPtr
        put_SenderCertificate           : IntPtr
        get_SenderId                    : IntPtr
        get_SenderIdType                : IntPtr
        put_SenderIdType                : IntPtr
        Send                            : IntPtr
        AttachCurrentSecurityContext    : IntPtr
        get_SenderVersion               : IntPtr
        get_Extension                   : IntPtr
        put_Extension                   : IntPtr
        get_ConnectorTypeGuid           : IntPtr
        put_ConnectorTypeGuid           : IntPtr
        get_TransactionStatusQueueInfo  : IntPtr
        get_DestinationSymmetricKey     : IntPtr
        put_DestinationSymmetricKey     : IntPtr
        get_Signature                   : IntPtr
        put_Signature                   : IntPtr
        get_AuthenticationProviderType  : IntPtr
        put_AuthenticationProviderType  : IntPtr
        get_AuthenticationProviderName  : IntPtr
        put_AuthenticationProviderName  : IntPtr
        put_SenderId                    : IntPtr
        get_MsgClass                    : IntPtr
        put_MsgClass                    : IntPtr
        get_Properties                  : IntPtr
        get_TransactionId               : IntPtr
        get_IsFirstInTransaction        : IntPtr
        get_IsLastInTransaction         : IntPtr
        get_ResponseQueueInfo_v2        : IntPtr
        putref_ResponseQueueInfo_v2     : IntPtr
        get_AdminQueueInfo_v2           : IntPtr
        putref_AdminQueueInfo_v2        : IntPtr
        get_ReceivedAuthenticationLevel : IntPtr
        get_ResponseQueueInfo           : IntPtr
        putref_ResponseQueueInfo        : IntPtr
        get_AdminQueueInfo              : IntPtr
        putref_AdminQueueInfo           : IntPtr
        get_ResponseDestination         : IntPtr
        putref_ResponseDestination      : IntPtr
        get_Destination                 : IntPtr
        get_LookupId                    : IntPtr
        get_IsAuthenticated2            : IntPtr
        get_IsFirstInTransaction2       : IntPtr
        get_IsLastInTransaction2        : IntPtr
        AttachCurrentSecurityContext2   : IntPtr
        get_SoapEnvelope                : IntPtr
        get_CompoundMessage             : IntPtr
        put_SoapHeader                  : IntPtr
        put_SoapBody                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQMessage4.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {IMSMQQueueInfo4} 
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
     * @type {IMSMQQueueInfo4} 
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
     * @type {IMSMQQueueInfo4} 
     */
    ResponseQueueInfo {
        get => this.get_ResponseQueueInfo()
    }

    /**
     * @type {IMSMQQueueInfo4} 
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
     * @type {BSTR} 
     */
    SoapHeader {
        set => this.put_SoapHeader(value)
    }

    /**
     * @type {BSTR} 
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
        pbstrGuidSrcMachine := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, pbstrGuidSrcMachine, "HRESULT")
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
        result := ComCall(27, this, VARIANT.Ptr, pvarBody, "HRESULT")
        return pvarBody
    }

    /**
     * 
     * @param {VARIANT} varBody 
     * @returns {HRESULT} 
     */
    put_Body(varBody) {
        result := ComCall(28, this, VARIANT, varBody, "HRESULT")
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
        result := ComCall(31, this, VARIANT.Ptr, pvarMsgId, "HRESULT")
        return pvarMsgId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CorrelationId() {
        pvarMsgId := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, pvarMsgId, "HRESULT")
        return pvarMsgId
    }

    /**
     * 
     * @param {VARIANT} varMsgId 
     * @returns {HRESULT} 
     */
    put_CorrelationId(varMsgId) {
        result := ComCall(33, this, VARIANT, varMsgId, "HRESULT")
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
        pbstrLabel := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, pbstrLabel, "HRESULT")
        return pbstrLabel
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_Label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(37, this, BSTR, bstrLabel, "HRESULT")
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
        result := ComCall(46, this, VARIANT.Ptr, pvarSentTime, "HRESULT")
        return pvarSentTime
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ArrivedTime() {
        plArrivedTime := VARIANT()
        result := ComCall(47, this, VARIANT.Ptr, plArrivedTime, "HRESULT")
        return plArrivedTime
    }

    /**
     * 
     * @returns {IMSMQQueueInfo4} 
     */
    get_DestinationQueueInfo() {
        result := ComCall(48, this, "ptr*", &ppqinfoDest := 0, "HRESULT")
        return IMSMQQueueInfo4(ppqinfoDest)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SenderCertificate() {
        pvarSenderCert := VARIANT()
        result := ComCall(49, this, VARIANT.Ptr, pvarSenderCert, "HRESULT")
        return pvarSenderCert
    }

    /**
     * 
     * @param {VARIANT} varSenderCert 
     * @returns {HRESULT} 
     */
    put_SenderCertificate(varSenderCert) {
        result := ComCall(50, this, VARIANT, varSenderCert, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SenderId() {
        pvarSenderId := VARIANT()
        result := ComCall(51, this, VARIANT.Ptr, pvarSenderId, "HRESULT")
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
        result := ComCall(54, this, "ptr", DestinationQueue, VARIANT.Ptr, Transaction, "HRESULT")
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
        result := ComCall(57, this, VARIANT.Ptr, pvarExtension, "HRESULT")
        return pvarExtension
    }

    /**
     * 
     * @param {VARIANT} varExtension 
     * @returns {HRESULT} 
     */
    put_Extension(varExtension) {
        result := ComCall(58, this, VARIANT, varExtension, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ConnectorTypeGuid() {
        pbstrGuidConnectorType := BSTR.Owned()
        result := ComCall(59, this, BSTR.Ptr, pbstrGuidConnectorType, "HRESULT")
        return pbstrGuidConnectorType
    }

    /**
     * 
     * @param {BSTR} bstrGuidConnectorType 
     * @returns {HRESULT} 
     */
    put_ConnectorTypeGuid(bstrGuidConnectorType) {
        bstrGuidConnectorType := bstrGuidConnectorType is String ? BSTR.Alloc(bstrGuidConnectorType).Value : bstrGuidConnectorType

        result := ComCall(60, this, BSTR, bstrGuidConnectorType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo4} 
     */
    get_TransactionStatusQueueInfo() {
        result := ComCall(61, this, "ptr*", &ppqinfoXactStatus := 0, "HRESULT")
        return IMSMQQueueInfo4(ppqinfoXactStatus)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_DestinationSymmetricKey() {
        pvarDestSymmKey := VARIANT()
        result := ComCall(62, this, VARIANT.Ptr, pvarDestSymmKey, "HRESULT")
        return pvarDestSymmKey
    }

    /**
     * 
     * @param {VARIANT} varDestSymmKey 
     * @returns {HRESULT} 
     */
    put_DestinationSymmetricKey(varDestSymmKey) {
        result := ComCall(63, this, VARIANT, varDestSymmKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Signature() {
        pvarSignature := VARIANT()
        result := ComCall(64, this, VARIANT.Ptr, pvarSignature, "HRESULT")
        return pvarSignature
    }

    /**
     * 
     * @param {VARIANT} varSignature 
     * @returns {HRESULT} 
     */
    put_Signature(varSignature) {
        result := ComCall(65, this, VARIANT, varSignature, "HRESULT")
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
        pbstrAuthProvName := BSTR.Owned()
        result := ComCall(68, this, BSTR.Ptr, pbstrAuthProvName, "HRESULT")
        return pbstrAuthProvName
    }

    /**
     * 
     * @param {BSTR} bstrAuthProvName 
     * @returns {HRESULT} 
     */
    put_AuthenticationProviderName(bstrAuthProvName) {
        bstrAuthProvName := bstrAuthProvName is String ? BSTR.Alloc(bstrAuthProvName).Value : bstrAuthProvName

        result := ComCall(69, this, BSTR, bstrAuthProvName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varSenderId 
     * @returns {HRESULT} 
     */
    put_SenderId(varSenderId) {
        result := ComCall(70, this, VARIANT, varSenderId, "HRESULT")
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
        result := ComCall(74, this, VARIANT.Ptr, pvarXactId, "HRESULT")
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
     * @returns {IMSMQQueueInfo4} 
     */
    get_ResponseQueueInfo() {
        result := ComCall(82, this, "ptr*", &ppqinfoResponse := 0, "HRESULT")
        return IMSMQQueueInfo4(ppqinfoResponse)
    }

    /**
     * 
     * @param {IMSMQQueueInfo4} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo(pqinfoResponse) {
        result := ComCall(83, this, "ptr", pqinfoResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo4} 
     */
    get_AdminQueueInfo() {
        result := ComCall(84, this, "ptr*", &ppqinfoAdmin := 0, "HRESULT")
        return IMSMQQueueInfo4(ppqinfoAdmin)
    }

    /**
     * 
     * @param {IMSMQQueueInfo4} pqinfoAdmin 
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
        result := ComCall(89, this, VARIANT.Ptr, pvarLookupId, "HRESULT")
        return pvarLookupId
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsAuthenticated2() {
        result := ComCall(90, this, VARIANT_BOOL.Ptr, &pisAuthenticated := 0, "HRESULT")
        return pisAuthenticated
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsFirstInTransaction2() {
        result := ComCall(91, this, VARIANT_BOOL.Ptr, &pisFirstInXact := 0, "HRESULT")
        return pisFirstInXact
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLastInTransaction2() {
        result := ComCall(92, this, VARIANT_BOOL.Ptr, &pisLastInXact := 0, "HRESULT")
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
        pbstrSoapEnvelope := BSTR.Owned()
        result := ComCall(94, this, BSTR.Ptr, pbstrSoapEnvelope, "HRESULT")
        return pbstrSoapEnvelope
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CompoundMessage() {
        pvarCompoundMessage := VARIANT()
        result := ComCall(95, this, VARIANT.Ptr, pvarCompoundMessage, "HRESULT")
        return pvarCompoundMessage
    }

    /**
     * 
     * @param {BSTR} bstrSoapHeader 
     * @returns {HRESULT} 
     */
    put_SoapHeader(bstrSoapHeader) {
        bstrSoapHeader := bstrSoapHeader is String ? BSTR.Alloc(bstrSoapHeader).Value : bstrSoapHeader

        result := ComCall(96, this, BSTR, bstrSoapHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSoapBody 
     * @returns {HRESULT} 
     */
    put_SoapBody(bstrSoapBody) {
        bstrSoapBody := bstrSoapBody is String ? BSTR.Alloc(bstrSoapBody).Value : bstrSoapBody

        result := ComCall(97, this, BSTR, bstrSoapBody, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSMQMessage4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Class := CallbackCreate(GetMethod(implObj, "get_Class"), flags, 2)
        this.vtbl.get_PrivLevel := CallbackCreate(GetMethod(implObj, "get_PrivLevel"), flags, 2)
        this.vtbl.put_PrivLevel := CallbackCreate(GetMethod(implObj, "put_PrivLevel"), flags, 2)
        this.vtbl.get_AuthLevel := CallbackCreate(GetMethod(implObj, "get_AuthLevel"), flags, 2)
        this.vtbl.put_AuthLevel := CallbackCreate(GetMethod(implObj, "put_AuthLevel"), flags, 2)
        this.vtbl.get_IsAuthenticated := CallbackCreate(GetMethod(implObj, "get_IsAuthenticated"), flags, 2)
        this.vtbl.get_Delivery := CallbackCreate(GetMethod(implObj, "get_Delivery"), flags, 2)
        this.vtbl.put_Delivery := CallbackCreate(GetMethod(implObj, "put_Delivery"), flags, 2)
        this.vtbl.get_Trace := CallbackCreate(GetMethod(implObj, "get_Trace"), flags, 2)
        this.vtbl.put_Trace := CallbackCreate(GetMethod(implObj, "put_Trace"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
        this.vtbl.put_Priority := CallbackCreate(GetMethod(implObj, "put_Priority"), flags, 2)
        this.vtbl.get_Journal := CallbackCreate(GetMethod(implObj, "get_Journal"), flags, 2)
        this.vtbl.put_Journal := CallbackCreate(GetMethod(implObj, "put_Journal"), flags, 2)
        this.vtbl.get_ResponseQueueInfo_v1 := CallbackCreate(GetMethod(implObj, "get_ResponseQueueInfo_v1"), flags, 2)
        this.vtbl.putref_ResponseQueueInfo_v1 := CallbackCreate(GetMethod(implObj, "putref_ResponseQueueInfo_v1"), flags, 2)
        this.vtbl.get_AppSpecific := CallbackCreate(GetMethod(implObj, "get_AppSpecific"), flags, 2)
        this.vtbl.put_AppSpecific := CallbackCreate(GetMethod(implObj, "put_AppSpecific"), flags, 2)
        this.vtbl.get_SourceMachineGuid := CallbackCreate(GetMethod(implObj, "get_SourceMachineGuid"), flags, 2)
        this.vtbl.get_BodyLength := CallbackCreate(GetMethod(implObj, "get_BodyLength"), flags, 2)
        this.vtbl.get_Body := CallbackCreate(GetMethod(implObj, "get_Body"), flags, 2)
        this.vtbl.put_Body := CallbackCreate(GetMethod(implObj, "put_Body"), flags, 2)
        this.vtbl.get_AdminQueueInfo_v1 := CallbackCreate(GetMethod(implObj, "get_AdminQueueInfo_v1"), flags, 2)
        this.vtbl.putref_AdminQueueInfo_v1 := CallbackCreate(GetMethod(implObj, "putref_AdminQueueInfo_v1"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_CorrelationId := CallbackCreate(GetMethod(implObj, "get_CorrelationId"), flags, 2)
        this.vtbl.put_CorrelationId := CallbackCreate(GetMethod(implObj, "put_CorrelationId"), flags, 2)
        this.vtbl.get_Ack := CallbackCreate(GetMethod(implObj, "get_Ack"), flags, 2)
        this.vtbl.put_Ack := CallbackCreate(GetMethod(implObj, "put_Ack"), flags, 2)
        this.vtbl.get_Label := CallbackCreate(GetMethod(implObj, "get_Label"), flags, 2)
        this.vtbl.put_Label := CallbackCreate(GetMethod(implObj, "put_Label"), flags, 2)
        this.vtbl.get_MaxTimeToReachQueue := CallbackCreate(GetMethod(implObj, "get_MaxTimeToReachQueue"), flags, 2)
        this.vtbl.put_MaxTimeToReachQueue := CallbackCreate(GetMethod(implObj, "put_MaxTimeToReachQueue"), flags, 2)
        this.vtbl.get_MaxTimeToReceive := CallbackCreate(GetMethod(implObj, "get_MaxTimeToReceive"), flags, 2)
        this.vtbl.put_MaxTimeToReceive := CallbackCreate(GetMethod(implObj, "put_MaxTimeToReceive"), flags, 2)
        this.vtbl.get_HashAlgorithm := CallbackCreate(GetMethod(implObj, "get_HashAlgorithm"), flags, 2)
        this.vtbl.put_HashAlgorithm := CallbackCreate(GetMethod(implObj, "put_HashAlgorithm"), flags, 2)
        this.vtbl.get_EncryptAlgorithm := CallbackCreate(GetMethod(implObj, "get_EncryptAlgorithm"), flags, 2)
        this.vtbl.put_EncryptAlgorithm := CallbackCreate(GetMethod(implObj, "put_EncryptAlgorithm"), flags, 2)
        this.vtbl.get_SentTime := CallbackCreate(GetMethod(implObj, "get_SentTime"), flags, 2)
        this.vtbl.get_ArrivedTime := CallbackCreate(GetMethod(implObj, "get_ArrivedTime"), flags, 2)
        this.vtbl.get_DestinationQueueInfo := CallbackCreate(GetMethod(implObj, "get_DestinationQueueInfo"), flags, 2)
        this.vtbl.get_SenderCertificate := CallbackCreate(GetMethod(implObj, "get_SenderCertificate"), flags, 2)
        this.vtbl.put_SenderCertificate := CallbackCreate(GetMethod(implObj, "put_SenderCertificate"), flags, 2)
        this.vtbl.get_SenderId := CallbackCreate(GetMethod(implObj, "get_SenderId"), flags, 2)
        this.vtbl.get_SenderIdType := CallbackCreate(GetMethod(implObj, "get_SenderIdType"), flags, 2)
        this.vtbl.put_SenderIdType := CallbackCreate(GetMethod(implObj, "put_SenderIdType"), flags, 2)
        this.vtbl.Send := CallbackCreate(GetMethod(implObj, "Send"), flags, 3)
        this.vtbl.AttachCurrentSecurityContext := CallbackCreate(GetMethod(implObj, "AttachCurrentSecurityContext"), flags, 1)
        this.vtbl.get_SenderVersion := CallbackCreate(GetMethod(implObj, "get_SenderVersion"), flags, 2)
        this.vtbl.get_Extension := CallbackCreate(GetMethod(implObj, "get_Extension"), flags, 2)
        this.vtbl.put_Extension := CallbackCreate(GetMethod(implObj, "put_Extension"), flags, 2)
        this.vtbl.get_ConnectorTypeGuid := CallbackCreate(GetMethod(implObj, "get_ConnectorTypeGuid"), flags, 2)
        this.vtbl.put_ConnectorTypeGuid := CallbackCreate(GetMethod(implObj, "put_ConnectorTypeGuid"), flags, 2)
        this.vtbl.get_TransactionStatusQueueInfo := CallbackCreate(GetMethod(implObj, "get_TransactionStatusQueueInfo"), flags, 2)
        this.vtbl.get_DestinationSymmetricKey := CallbackCreate(GetMethod(implObj, "get_DestinationSymmetricKey"), flags, 2)
        this.vtbl.put_DestinationSymmetricKey := CallbackCreate(GetMethod(implObj, "put_DestinationSymmetricKey"), flags, 2)
        this.vtbl.get_Signature := CallbackCreate(GetMethod(implObj, "get_Signature"), flags, 2)
        this.vtbl.put_Signature := CallbackCreate(GetMethod(implObj, "put_Signature"), flags, 2)
        this.vtbl.get_AuthenticationProviderType := CallbackCreate(GetMethod(implObj, "get_AuthenticationProviderType"), flags, 2)
        this.vtbl.put_AuthenticationProviderType := CallbackCreate(GetMethod(implObj, "put_AuthenticationProviderType"), flags, 2)
        this.vtbl.get_AuthenticationProviderName := CallbackCreate(GetMethod(implObj, "get_AuthenticationProviderName"), flags, 2)
        this.vtbl.put_AuthenticationProviderName := CallbackCreate(GetMethod(implObj, "put_AuthenticationProviderName"), flags, 2)
        this.vtbl.put_SenderId := CallbackCreate(GetMethod(implObj, "put_SenderId"), flags, 2)
        this.vtbl.get_MsgClass := CallbackCreate(GetMethod(implObj, "get_MsgClass"), flags, 2)
        this.vtbl.put_MsgClass := CallbackCreate(GetMethod(implObj, "put_MsgClass"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
        this.vtbl.get_TransactionId := CallbackCreate(GetMethod(implObj, "get_TransactionId"), flags, 2)
        this.vtbl.get_IsFirstInTransaction := CallbackCreate(GetMethod(implObj, "get_IsFirstInTransaction"), flags, 2)
        this.vtbl.get_IsLastInTransaction := CallbackCreate(GetMethod(implObj, "get_IsLastInTransaction"), flags, 2)
        this.vtbl.get_ResponseQueueInfo_v2 := CallbackCreate(GetMethod(implObj, "get_ResponseQueueInfo_v2"), flags, 2)
        this.vtbl.putref_ResponseQueueInfo_v2 := CallbackCreate(GetMethod(implObj, "putref_ResponseQueueInfo_v2"), flags, 2)
        this.vtbl.get_AdminQueueInfo_v2 := CallbackCreate(GetMethod(implObj, "get_AdminQueueInfo_v2"), flags, 2)
        this.vtbl.putref_AdminQueueInfo_v2 := CallbackCreate(GetMethod(implObj, "putref_AdminQueueInfo_v2"), flags, 2)
        this.vtbl.get_ReceivedAuthenticationLevel := CallbackCreate(GetMethod(implObj, "get_ReceivedAuthenticationLevel"), flags, 2)
        this.vtbl.get_ResponseQueueInfo := CallbackCreate(GetMethod(implObj, "get_ResponseQueueInfo"), flags, 2)
        this.vtbl.putref_ResponseQueueInfo := CallbackCreate(GetMethod(implObj, "putref_ResponseQueueInfo"), flags, 2)
        this.vtbl.get_AdminQueueInfo := CallbackCreate(GetMethod(implObj, "get_AdminQueueInfo"), flags, 2)
        this.vtbl.putref_AdminQueueInfo := CallbackCreate(GetMethod(implObj, "putref_AdminQueueInfo"), flags, 2)
        this.vtbl.get_ResponseDestination := CallbackCreate(GetMethod(implObj, "get_ResponseDestination"), flags, 2)
        this.vtbl.putref_ResponseDestination := CallbackCreate(GetMethod(implObj, "putref_ResponseDestination"), flags, 2)
        this.vtbl.get_Destination := CallbackCreate(GetMethod(implObj, "get_Destination"), flags, 2)
        this.vtbl.get_LookupId := CallbackCreate(GetMethod(implObj, "get_LookupId"), flags, 2)
        this.vtbl.get_IsAuthenticated2 := CallbackCreate(GetMethod(implObj, "get_IsAuthenticated2"), flags, 2)
        this.vtbl.get_IsFirstInTransaction2 := CallbackCreate(GetMethod(implObj, "get_IsFirstInTransaction2"), flags, 2)
        this.vtbl.get_IsLastInTransaction2 := CallbackCreate(GetMethod(implObj, "get_IsLastInTransaction2"), flags, 2)
        this.vtbl.AttachCurrentSecurityContext2 := CallbackCreate(GetMethod(implObj, "AttachCurrentSecurityContext2"), flags, 1)
        this.vtbl.get_SoapEnvelope := CallbackCreate(GetMethod(implObj, "get_SoapEnvelope"), flags, 2)
        this.vtbl.get_CompoundMessage := CallbackCreate(GetMethod(implObj, "get_CompoundMessage"), flags, 2)
        this.vtbl.put_SoapHeader := CallbackCreate(GetMethod(implObj, "put_SoapHeader"), flags, 2)
        this.vtbl.put_SoapBody := CallbackCreate(GetMethod(implObj, "put_SoapBody"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Class)
        CallbackFree(this.vtbl.get_PrivLevel)
        CallbackFree(this.vtbl.put_PrivLevel)
        CallbackFree(this.vtbl.get_AuthLevel)
        CallbackFree(this.vtbl.put_AuthLevel)
        CallbackFree(this.vtbl.get_IsAuthenticated)
        CallbackFree(this.vtbl.get_Delivery)
        CallbackFree(this.vtbl.put_Delivery)
        CallbackFree(this.vtbl.get_Trace)
        CallbackFree(this.vtbl.put_Trace)
        CallbackFree(this.vtbl.get_Priority)
        CallbackFree(this.vtbl.put_Priority)
        CallbackFree(this.vtbl.get_Journal)
        CallbackFree(this.vtbl.put_Journal)
        CallbackFree(this.vtbl.get_ResponseQueueInfo_v1)
        CallbackFree(this.vtbl.putref_ResponseQueueInfo_v1)
        CallbackFree(this.vtbl.get_AppSpecific)
        CallbackFree(this.vtbl.put_AppSpecific)
        CallbackFree(this.vtbl.get_SourceMachineGuid)
        CallbackFree(this.vtbl.get_BodyLength)
        CallbackFree(this.vtbl.get_Body)
        CallbackFree(this.vtbl.put_Body)
        CallbackFree(this.vtbl.get_AdminQueueInfo_v1)
        CallbackFree(this.vtbl.putref_AdminQueueInfo_v1)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_CorrelationId)
        CallbackFree(this.vtbl.put_CorrelationId)
        CallbackFree(this.vtbl.get_Ack)
        CallbackFree(this.vtbl.put_Ack)
        CallbackFree(this.vtbl.get_Label)
        CallbackFree(this.vtbl.put_Label)
        CallbackFree(this.vtbl.get_MaxTimeToReachQueue)
        CallbackFree(this.vtbl.put_MaxTimeToReachQueue)
        CallbackFree(this.vtbl.get_MaxTimeToReceive)
        CallbackFree(this.vtbl.put_MaxTimeToReceive)
        CallbackFree(this.vtbl.get_HashAlgorithm)
        CallbackFree(this.vtbl.put_HashAlgorithm)
        CallbackFree(this.vtbl.get_EncryptAlgorithm)
        CallbackFree(this.vtbl.put_EncryptAlgorithm)
        CallbackFree(this.vtbl.get_SentTime)
        CallbackFree(this.vtbl.get_ArrivedTime)
        CallbackFree(this.vtbl.get_DestinationQueueInfo)
        CallbackFree(this.vtbl.get_SenderCertificate)
        CallbackFree(this.vtbl.put_SenderCertificate)
        CallbackFree(this.vtbl.get_SenderId)
        CallbackFree(this.vtbl.get_SenderIdType)
        CallbackFree(this.vtbl.put_SenderIdType)
        CallbackFree(this.vtbl.Send)
        CallbackFree(this.vtbl.AttachCurrentSecurityContext)
        CallbackFree(this.vtbl.get_SenderVersion)
        CallbackFree(this.vtbl.get_Extension)
        CallbackFree(this.vtbl.put_Extension)
        CallbackFree(this.vtbl.get_ConnectorTypeGuid)
        CallbackFree(this.vtbl.put_ConnectorTypeGuid)
        CallbackFree(this.vtbl.get_TransactionStatusQueueInfo)
        CallbackFree(this.vtbl.get_DestinationSymmetricKey)
        CallbackFree(this.vtbl.put_DestinationSymmetricKey)
        CallbackFree(this.vtbl.get_Signature)
        CallbackFree(this.vtbl.put_Signature)
        CallbackFree(this.vtbl.get_AuthenticationProviderType)
        CallbackFree(this.vtbl.put_AuthenticationProviderType)
        CallbackFree(this.vtbl.get_AuthenticationProviderName)
        CallbackFree(this.vtbl.put_AuthenticationProviderName)
        CallbackFree(this.vtbl.put_SenderId)
        CallbackFree(this.vtbl.get_MsgClass)
        CallbackFree(this.vtbl.put_MsgClass)
        CallbackFree(this.vtbl.get_Properties)
        CallbackFree(this.vtbl.get_TransactionId)
        CallbackFree(this.vtbl.get_IsFirstInTransaction)
        CallbackFree(this.vtbl.get_IsLastInTransaction)
        CallbackFree(this.vtbl.get_ResponseQueueInfo_v2)
        CallbackFree(this.vtbl.putref_ResponseQueueInfo_v2)
        CallbackFree(this.vtbl.get_AdminQueueInfo_v2)
        CallbackFree(this.vtbl.putref_AdminQueueInfo_v2)
        CallbackFree(this.vtbl.get_ReceivedAuthenticationLevel)
        CallbackFree(this.vtbl.get_ResponseQueueInfo)
        CallbackFree(this.vtbl.putref_ResponseQueueInfo)
        CallbackFree(this.vtbl.get_AdminQueueInfo)
        CallbackFree(this.vtbl.putref_AdminQueueInfo)
        CallbackFree(this.vtbl.get_ResponseDestination)
        CallbackFree(this.vtbl.putref_ResponseDestination)
        CallbackFree(this.vtbl.get_Destination)
        CallbackFree(this.vtbl.get_LookupId)
        CallbackFree(this.vtbl.get_IsAuthenticated2)
        CallbackFree(this.vtbl.get_IsFirstInTransaction2)
        CallbackFree(this.vtbl.get_IsLastInTransaction2)
        CallbackFree(this.vtbl.AttachCurrentSecurityContext2)
        CallbackFree(this.vtbl.get_SoapEnvelope)
        CallbackFree(this.vtbl.get_CompoundMessage)
        CallbackFree(this.vtbl.put_SoapHeader)
        CallbackFree(this.vtbl.put_SoapBody)
    }
}
