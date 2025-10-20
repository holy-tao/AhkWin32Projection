#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQMessage2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQMessage2
     * @type {Guid}
     */
    static IID => Guid("{d9933be0-a567-11d2-b0f3-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Class", "get_PrivLevel", "put_PrivLevel", "get_AuthLevel", "put_AuthLevel", "get_IsAuthenticated", "get_Delivery", "put_Delivery", "get_Trace", "put_Trace", "get_Priority", "put_Priority", "get_Journal", "put_Journal", "get_ResponseQueueInfo_v1", "putref_ResponseQueueInfo_v1", "get_AppSpecific", "put_AppSpecific", "get_SourceMachineGuid", "get_BodyLength", "get_Body", "put_Body", "get_AdminQueueInfo_v1", "putref_AdminQueueInfo_v1", "get_Id", "get_CorrelationId", "put_CorrelationId", "get_Ack", "put_Ack", "get_Label", "put_Label", "get_MaxTimeToReachQueue", "put_MaxTimeToReachQueue", "get_MaxTimeToReceive", "put_MaxTimeToReceive", "get_HashAlgorithm", "put_HashAlgorithm", "get_EncryptAlgorithm", "put_EncryptAlgorithm", "get_SentTime", "get_ArrivedTime", "get_DestinationQueueInfo", "get_SenderCertificate", "put_SenderCertificate", "get_SenderId", "get_SenderIdType", "put_SenderIdType", "Send", "AttachCurrentSecurityContext", "get_SenderVersion", "get_Extension", "put_Extension", "get_ConnectorTypeGuid", "put_ConnectorTypeGuid", "get_TransactionStatusQueueInfo", "get_DestinationSymmetricKey", "put_DestinationSymmetricKey", "get_Signature", "put_Signature", "get_AuthenticationProviderType", "put_AuthenticationProviderType", "get_AuthenticationProviderName", "put_AuthenticationProviderName", "put_SenderId", "get_MsgClass", "put_MsgClass", "get_Properties", "get_TransactionId", "get_IsFirstInTransaction", "get_IsLastInTransaction", "get_ResponseQueueInfo", "putref_ResponseQueueInfo", "get_AdminQueueInfo", "putref_AdminQueueInfo", "get_ReceivedAuthenticationLevel"]

    /**
     * 
     * @param {Pointer<Integer>} plClass 
     * @returns {HRESULT} 
     */
    get_Class(plClass) {
        result := ComCall(7, this, "int*", plClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPrivLevel 
     * @returns {HRESULT} 
     */
    get_PrivLevel(plPrivLevel) {
        result := ComCall(8, this, "int*", plPrivLevel, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plAuthLevel 
     * @returns {HRESULT} 
     */
    get_AuthLevel(plAuthLevel) {
        result := ComCall(10, this, "int*", plAuthLevel, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pisAuthenticated 
     * @returns {HRESULT} 
     */
    get_IsAuthenticated(pisAuthenticated) {
        result := ComCall(12, this, "short*", pisAuthenticated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDelivery 
     * @returns {HRESULT} 
     */
    get_Delivery(plDelivery) {
        result := ComCall(13, this, "int*", plDelivery, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plTrace 
     * @returns {HRESULT} 
     */
    get_Trace(plTrace) {
        result := ComCall(15, this, "int*", plTrace, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plPriority 
     * @returns {HRESULT} 
     */
    get_Priority(plPriority) {
        result := ComCall(17, this, "int*", plPriority, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plJournal 
     * @returns {HRESULT} 
     */
    get_Journal(plJournal) {
        result := ComCall(19, this, "int*", plJournal, "HRESULT")
        return result
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
     * @param {Pointer<IMSMQQueueInfo>} ppqinfoResponse 
     * @returns {HRESULT} 
     */
    get_ResponseQueueInfo_v1(ppqinfoResponse) {
        result := ComCall(21, this, "ptr*", ppqinfoResponse, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plAppSpecific 
     * @returns {HRESULT} 
     */
    get_AppSpecific(plAppSpecific) {
        result := ComCall(23, this, "int*", plAppSpecific, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrGuidSrcMachine 
     * @returns {HRESULT} 
     */
    get_SourceMachineGuid(pbstrGuidSrcMachine) {
        result := ComCall(25, this, "ptr", pbstrGuidSrcMachine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbBody 
     * @returns {HRESULT} 
     */
    get_BodyLength(pcbBody) {
        result := ComCall(26, this, "int*", pcbBody, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarBody 
     * @returns {HRESULT} 
     */
    get_Body(pvarBody) {
        result := ComCall(27, this, "ptr", pvarBody, "HRESULT")
        return result
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
     * @param {Pointer<IMSMQQueueInfo>} ppqinfoAdmin 
     * @returns {HRESULT} 
     */
    get_AdminQueueInfo_v1(ppqinfoAdmin) {
        result := ComCall(29, this, "ptr*", ppqinfoAdmin, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarMsgId 
     * @returns {HRESULT} 
     */
    get_Id(pvarMsgId) {
        result := ComCall(31, this, "ptr", pvarMsgId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarMsgId 
     * @returns {HRESULT} 
     */
    get_CorrelationId(pvarMsgId) {
        result := ComCall(32, this, "ptr", pvarMsgId, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plAck 
     * @returns {HRESULT} 
     */
    get_Ack(plAck) {
        result := ComCall(34, this, "int*", plAck, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrLabel 
     * @returns {HRESULT} 
     */
    get_Label(pbstrLabel) {
        result := ComCall(36, this, "ptr", pbstrLabel, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plMaxTimeToReachQueue 
     * @returns {HRESULT} 
     */
    get_MaxTimeToReachQueue(plMaxTimeToReachQueue) {
        result := ComCall(38, this, "int*", plMaxTimeToReachQueue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plMaxTimeToReceive 
     * @returns {HRESULT} 
     */
    get_MaxTimeToReceive(plMaxTimeToReceive) {
        result := ComCall(40, this, "int*", plMaxTimeToReceive, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plHashAlg 
     * @returns {HRESULT} 
     */
    get_HashAlgorithm(plHashAlg) {
        result := ComCall(42, this, "int*", plHashAlg, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plEncryptAlg 
     * @returns {HRESULT} 
     */
    get_EncryptAlgorithm(plEncryptAlg) {
        result := ComCall(44, this, "int*", plEncryptAlg, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSentTime 
     * @returns {HRESULT} 
     */
    get_SentTime(pvarSentTime) {
        result := ComCall(46, this, "ptr", pvarSentTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} plArrivedTime 
     * @returns {HRESULT} 
     */
    get_ArrivedTime(plArrivedTime) {
        result := ComCall(47, this, "ptr", plArrivedTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo2>} ppqinfoDest 
     * @returns {HRESULT} 
     */
    get_DestinationQueueInfo(ppqinfoDest) {
        result := ComCall(48, this, "ptr*", ppqinfoDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSenderCert 
     * @returns {HRESULT} 
     */
    get_SenderCertificate(pvarSenderCert) {
        result := ComCall(49, this, "ptr", pvarSenderCert, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSenderId 
     * @returns {HRESULT} 
     */
    get_SenderId(pvarSenderId) {
        result := ComCall(51, this, "ptr", pvarSenderId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSenderIdType 
     * @returns {HRESULT} 
     */
    get_SenderIdType(plSenderIdType) {
        result := ComCall(52, this, "int*", plSenderIdType, "HRESULT")
        return result
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
     * @param {IMSMQQueue2} DestinationQueue 
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
     * @param {Pointer<Integer>} plSenderVersion 
     * @returns {HRESULT} 
     */
    get_SenderVersion(plSenderVersion) {
        result := ComCall(56, this, "int*", plSenderVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarExtension 
     * @returns {HRESULT} 
     */
    get_Extension(pvarExtension) {
        result := ComCall(57, this, "ptr", pvarExtension, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrGuidConnectorType 
     * @returns {HRESULT} 
     */
    get_ConnectorTypeGuid(pbstrGuidConnectorType) {
        result := ComCall(59, this, "ptr", pbstrGuidConnectorType, "HRESULT")
        return result
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
     * @param {Pointer<IMSMQQueueInfo2>} ppqinfoXactStatus 
     * @returns {HRESULT} 
     */
    get_TransactionStatusQueueInfo(ppqinfoXactStatus) {
        result := ComCall(61, this, "ptr*", ppqinfoXactStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarDestSymmKey 
     * @returns {HRESULT} 
     */
    get_DestinationSymmetricKey(pvarDestSymmKey) {
        result := ComCall(62, this, "ptr", pvarDestSymmKey, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSignature 
     * @returns {HRESULT} 
     */
    get_Signature(pvarSignature) {
        result := ComCall(64, this, "ptr", pvarSignature, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plAuthProvType 
     * @returns {HRESULT} 
     */
    get_AuthenticationProviderType(plAuthProvType) {
        result := ComCall(66, this, "int*", plAuthProvType, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrAuthProvName 
     * @returns {HRESULT} 
     */
    get_AuthenticationProviderName(pbstrAuthProvName) {
        result := ComCall(68, this, "ptr", pbstrAuthProvName, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plMsgClass 
     * @returns {HRESULT} 
     */
    get_MsgClass(plMsgClass) {
        result := ComCall(71, this, "int*", plMsgClass, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(73, this, "ptr*", ppcolProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarXactId 
     * @returns {HRESULT} 
     */
    get_TransactionId(pvarXactId) {
        result := ComCall(74, this, "ptr", pvarXactId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pisFirstInXact 
     * @returns {HRESULT} 
     */
    get_IsFirstInTransaction(pisFirstInXact) {
        result := ComCall(75, this, "short*", pisFirstInXact, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pisLastInXact 
     * @returns {HRESULT} 
     */
    get_IsLastInTransaction(pisLastInXact) {
        result := ComCall(76, this, "short*", pisLastInXact, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo2>} ppqinfoResponse 
     * @returns {HRESULT} 
     */
    get_ResponseQueueInfo(ppqinfoResponse) {
        result := ComCall(77, this, "ptr*", ppqinfoResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSMQQueueInfo2} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo(pqinfoResponse) {
        result := ComCall(78, this, "ptr", pqinfoResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo2>} ppqinfoAdmin 
     * @returns {HRESULT} 
     */
    get_AdminQueueInfo(ppqinfoAdmin) {
        result := ComCall(79, this, "ptr*", ppqinfoAdmin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSMQQueueInfo2} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo(pqinfoAdmin) {
        result := ComCall(80, this, "ptr", pqinfoAdmin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} psReceivedAuthenticationLevel 
     * @returns {HRESULT} 
     */
    get_ReceivedAuthenticationLevel(psReceivedAuthenticationLevel) {
        result := ComCall(81, this, "short*", psReceivedAuthenticationLevel, "HRESULT")
        return result
    }
}
