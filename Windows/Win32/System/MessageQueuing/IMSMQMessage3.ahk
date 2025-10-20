#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQMessage3 extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} plClass 
     * @returns {HRESULT} 
     */
    get_Class(plClass) {
        result := ComCall(7, this, "int*", plClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPrivLevel 
     * @returns {HRESULT} 
     */
    get_PrivLevel(plPrivLevel) {
        result := ComCall(8, this, "int*", plPrivLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPrivLevel 
     * @returns {HRESULT} 
     */
    put_PrivLevel(lPrivLevel) {
        result := ComCall(9, this, "int", lPrivLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAuthLevel 
     * @returns {HRESULT} 
     */
    get_AuthLevel(plAuthLevel) {
        result := ComCall(10, this, "int*", plAuthLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAuthLevel 
     * @returns {HRESULT} 
     */
    put_AuthLevel(lAuthLevel) {
        result := ComCall(11, this, "int", lAuthLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pisAuthenticated 
     * @returns {HRESULT} 
     */
    get_IsAuthenticated(pisAuthenticated) {
        result := ComCall(12, this, "short*", pisAuthenticated, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDelivery 
     * @returns {HRESULT} 
     */
    get_Delivery(plDelivery) {
        result := ComCall(13, this, "int*", plDelivery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lDelivery 
     * @returns {HRESULT} 
     */
    put_Delivery(lDelivery) {
        result := ComCall(14, this, "int", lDelivery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plTrace 
     * @returns {HRESULT} 
     */
    get_Trace(plTrace) {
        result := ComCall(15, this, "int*", plTrace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTrace 
     * @returns {HRESULT} 
     */
    put_Trace(lTrace) {
        result := ComCall(16, this, "int", lTrace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPriority 
     * @returns {HRESULT} 
     */
    get_Priority(plPriority) {
        result := ComCall(17, this, "int*", plPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lPriority) {
        result := ComCall(18, this, "int", lPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plJournal 
     * @returns {HRESULT} 
     */
    get_Journal(plJournal) {
        result := ComCall(19, this, "int*", plJournal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lJournal 
     * @returns {HRESULT} 
     */
    put_Journal(lJournal) {
        result := ComCall(20, this, "int", lJournal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo>} ppqinfoResponse 
     * @returns {HRESULT} 
     */
    get_ResponseQueueInfo_v1(ppqinfoResponse) {
        result := ComCall(21, this, "ptr", ppqinfoResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo>} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo_v1(pqinfoResponse) {
        result := ComCall(22, this, "ptr", pqinfoResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAppSpecific 
     * @returns {HRESULT} 
     */
    get_AppSpecific(plAppSpecific) {
        result := ComCall(23, this, "int*", plAppSpecific, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAppSpecific 
     * @returns {HRESULT} 
     */
    put_AppSpecific(lAppSpecific) {
        result := ComCall(24, this, "int", lAppSpecific, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGuidSrcMachine 
     * @returns {HRESULT} 
     */
    get_SourceMachineGuid(pbstrGuidSrcMachine) {
        result := ComCall(25, this, "ptr", pbstrGuidSrcMachine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcbBody 
     * @returns {HRESULT} 
     */
    get_BodyLength(pcbBody) {
        result := ComCall(26, this, "int*", pcbBody, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarBody 
     * @returns {HRESULT} 
     */
    get_Body(pvarBody) {
        result := ComCall(27, this, "ptr", pvarBody, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varBody 
     * @returns {HRESULT} 
     */
    put_Body(varBody) {
        result := ComCall(28, this, "ptr", varBody, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo>} ppqinfoAdmin 
     * @returns {HRESULT} 
     */
    get_AdminQueueInfo_v1(ppqinfoAdmin) {
        result := ComCall(29, this, "ptr", ppqinfoAdmin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo>} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo_v1(pqinfoAdmin) {
        result := ComCall(30, this, "ptr", pqinfoAdmin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarMsgId 
     * @returns {HRESULT} 
     */
    get_Id(pvarMsgId) {
        result := ComCall(31, this, "ptr", pvarMsgId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarMsgId 
     * @returns {HRESULT} 
     */
    get_CorrelationId(pvarMsgId) {
        result := ComCall(32, this, "ptr", pvarMsgId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varMsgId 
     * @returns {HRESULT} 
     */
    put_CorrelationId(varMsgId) {
        result := ComCall(33, this, "ptr", varMsgId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAck 
     * @returns {HRESULT} 
     */
    get_Ack(plAck) {
        result := ComCall(34, this, "int*", plAck, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAck 
     * @returns {HRESULT} 
     */
    put_Ack(lAck) {
        result := ComCall(35, this, "int", lAck, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLabel 
     * @returns {HRESULT} 
     */
    get_Label(pbstrLabel) {
        result := ComCall(36, this, "ptr", pbstrLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrLabel 
     * @returns {HRESULT} 
     */
    put_Label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(37, this, "ptr", bstrLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMaxTimeToReachQueue 
     * @returns {HRESULT} 
     */
    get_MaxTimeToReachQueue(plMaxTimeToReachQueue) {
        result := ComCall(38, this, "int*", plMaxTimeToReachQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMaxTimeToReachQueue 
     * @returns {HRESULT} 
     */
    put_MaxTimeToReachQueue(lMaxTimeToReachQueue) {
        result := ComCall(39, this, "int", lMaxTimeToReachQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMaxTimeToReceive 
     * @returns {HRESULT} 
     */
    get_MaxTimeToReceive(plMaxTimeToReceive) {
        result := ComCall(40, this, "int*", plMaxTimeToReceive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMaxTimeToReceive 
     * @returns {HRESULT} 
     */
    put_MaxTimeToReceive(lMaxTimeToReceive) {
        result := ComCall(41, this, "int", lMaxTimeToReceive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plHashAlg 
     * @returns {HRESULT} 
     */
    get_HashAlgorithm(plHashAlg) {
        result := ComCall(42, this, "int*", plHashAlg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHashAlg 
     * @returns {HRESULT} 
     */
    put_HashAlgorithm(lHashAlg) {
        result := ComCall(43, this, "int", lHashAlg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plEncryptAlg 
     * @returns {HRESULT} 
     */
    get_EncryptAlgorithm(plEncryptAlg) {
        result := ComCall(44, this, "int*", plEncryptAlg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lEncryptAlg 
     * @returns {HRESULT} 
     */
    put_EncryptAlgorithm(lEncryptAlg) {
        result := ComCall(45, this, "int", lEncryptAlg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSentTime 
     * @returns {HRESULT} 
     */
    get_SentTime(pvarSentTime) {
        result := ComCall(46, this, "ptr", pvarSentTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} plArrivedTime 
     * @returns {HRESULT} 
     */
    get_ArrivedTime(plArrivedTime) {
        result := ComCall(47, this, "ptr", plArrivedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo3>} ppqinfoDest 
     * @returns {HRESULT} 
     */
    get_DestinationQueueInfo(ppqinfoDest) {
        result := ComCall(48, this, "ptr", ppqinfoDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSenderCert 
     * @returns {HRESULT} 
     */
    get_SenderCertificate(pvarSenderCert) {
        result := ComCall(49, this, "ptr", pvarSenderCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varSenderCert 
     * @returns {HRESULT} 
     */
    put_SenderCertificate(varSenderCert) {
        result := ComCall(50, this, "ptr", varSenderCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSenderId 
     * @returns {HRESULT} 
     */
    get_SenderId(pvarSenderId) {
        result := ComCall(51, this, "ptr", pvarSenderId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSenderIdType 
     * @returns {HRESULT} 
     */
    get_SenderIdType(plSenderIdType) {
        result := ComCall(52, this, "int*", plSenderIdType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSenderIdType 
     * @returns {HRESULT} 
     */
    put_SenderIdType(lSenderIdType) {
        result := ComCall(53, this, "int", lSenderIdType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} DestinationQueue 
     * @param {Pointer<VARIANT>} Transaction 
     * @returns {HRESULT} 
     */
    Send(DestinationQueue, Transaction) {
        result := ComCall(54, this, "ptr", DestinationQueue, "ptr", Transaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AttachCurrentSecurityContext() {
        result := ComCall(55, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSenderVersion 
     * @returns {HRESULT} 
     */
    get_SenderVersion(plSenderVersion) {
        result := ComCall(56, this, "int*", plSenderVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarExtension 
     * @returns {HRESULT} 
     */
    get_Extension(pvarExtension) {
        result := ComCall(57, this, "ptr", pvarExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varExtension 
     * @returns {HRESULT} 
     */
    put_Extension(varExtension) {
        result := ComCall(58, this, "ptr", varExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGuidConnectorType 
     * @returns {HRESULT} 
     */
    get_ConnectorTypeGuid(pbstrGuidConnectorType) {
        result := ComCall(59, this, "ptr", pbstrGuidConnectorType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGuidConnectorType 
     * @returns {HRESULT} 
     */
    put_ConnectorTypeGuid(bstrGuidConnectorType) {
        bstrGuidConnectorType := bstrGuidConnectorType is String ? BSTR.Alloc(bstrGuidConnectorType).Value : bstrGuidConnectorType

        result := ComCall(60, this, "ptr", bstrGuidConnectorType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo3>} ppqinfoXactStatus 
     * @returns {HRESULT} 
     */
    get_TransactionStatusQueueInfo(ppqinfoXactStatus) {
        result := ComCall(61, this, "ptr", ppqinfoXactStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarDestSymmKey 
     * @returns {HRESULT} 
     */
    get_DestinationSymmetricKey(pvarDestSymmKey) {
        result := ComCall(62, this, "ptr", pvarDestSymmKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varDestSymmKey 
     * @returns {HRESULT} 
     */
    put_DestinationSymmetricKey(varDestSymmKey) {
        result := ComCall(63, this, "ptr", varDestSymmKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSignature 
     * @returns {HRESULT} 
     */
    get_Signature(pvarSignature) {
        result := ComCall(64, this, "ptr", pvarSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varSignature 
     * @returns {HRESULT} 
     */
    put_Signature(varSignature) {
        result := ComCall(65, this, "ptr", varSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAuthProvType 
     * @returns {HRESULT} 
     */
    get_AuthenticationProviderType(plAuthProvType) {
        result := ComCall(66, this, "int*", plAuthProvType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAuthProvType 
     * @returns {HRESULT} 
     */
    put_AuthenticationProviderType(lAuthProvType) {
        result := ComCall(67, this, "int", lAuthProvType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAuthProvName 
     * @returns {HRESULT} 
     */
    get_AuthenticationProviderName(pbstrAuthProvName) {
        result := ComCall(68, this, "ptr", pbstrAuthProvName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAuthProvName 
     * @returns {HRESULT} 
     */
    put_AuthenticationProviderName(bstrAuthProvName) {
        bstrAuthProvName := bstrAuthProvName is String ? BSTR.Alloc(bstrAuthProvName).Value : bstrAuthProvName

        result := ComCall(69, this, "ptr", bstrAuthProvName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varSenderId 
     * @returns {HRESULT} 
     */
    put_SenderId(varSenderId) {
        result := ComCall(70, this, "ptr", varSenderId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMsgClass 
     * @returns {HRESULT} 
     */
    get_MsgClass(plMsgClass) {
        result := ComCall(71, this, "int*", plMsgClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMsgClass 
     * @returns {HRESULT} 
     */
    put_MsgClass(lMsgClass) {
        result := ComCall(72, this, "int", lMsgClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(73, this, "ptr", ppcolProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarXactId 
     * @returns {HRESULT} 
     */
    get_TransactionId(pvarXactId) {
        result := ComCall(74, this, "ptr", pvarXactId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pisFirstInXact 
     * @returns {HRESULT} 
     */
    get_IsFirstInTransaction(pisFirstInXact) {
        result := ComCall(75, this, "short*", pisFirstInXact, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pisLastInXact 
     * @returns {HRESULT} 
     */
    get_IsLastInTransaction(pisLastInXact) {
        result := ComCall(76, this, "short*", pisLastInXact, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo2>} ppqinfoResponse 
     * @returns {HRESULT} 
     */
    get_ResponseQueueInfo_v2(ppqinfoResponse) {
        result := ComCall(77, this, "ptr", ppqinfoResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo2>} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo_v2(pqinfoResponse) {
        result := ComCall(78, this, "ptr", pqinfoResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo2>} ppqinfoAdmin 
     * @returns {HRESULT} 
     */
    get_AdminQueueInfo_v2(ppqinfoAdmin) {
        result := ComCall(79, this, "ptr", ppqinfoAdmin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo2>} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo_v2(pqinfoAdmin) {
        result := ComCall(80, this, "ptr", pqinfoAdmin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} psReceivedAuthenticationLevel 
     * @returns {HRESULT} 
     */
    get_ReceivedAuthenticationLevel(psReceivedAuthenticationLevel) {
        result := ComCall(81, this, "short*", psReceivedAuthenticationLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo3>} ppqinfoResponse 
     * @returns {HRESULT} 
     */
    get_ResponseQueueInfo(ppqinfoResponse) {
        result := ComCall(82, this, "ptr", ppqinfoResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo3>} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo(pqinfoResponse) {
        result := ComCall(83, this, "ptr", pqinfoResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo3>} ppqinfoAdmin 
     * @returns {HRESULT} 
     */
    get_AdminQueueInfo(ppqinfoAdmin) {
        result := ComCall(84, this, "ptr", ppqinfoAdmin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo3>} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo(pqinfoAdmin) {
        result := ComCall(85, this, "ptr", pqinfoAdmin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppdestResponse 
     * @returns {HRESULT} 
     */
    get_ResponseDestination(ppdestResponse) {
        result := ComCall(86, this, "ptr", ppdestResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pdestResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseDestination(pdestResponse) {
        result := ComCall(87, this, "ptr", pdestResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppdestDestination 
     * @returns {HRESULT} 
     */
    get_Destination(ppdestDestination) {
        result := ComCall(88, this, "ptr", ppdestDestination, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarLookupId 
     * @returns {HRESULT} 
     */
    get_LookupId(pvarLookupId) {
        result := ComCall(89, this, "ptr", pvarLookupId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pisAuthenticated 
     * @returns {HRESULT} 
     */
    get_IsAuthenticated2(pisAuthenticated) {
        result := ComCall(90, this, "ptr", pisAuthenticated, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pisFirstInXact 
     * @returns {HRESULT} 
     */
    get_IsFirstInTransaction2(pisFirstInXact) {
        result := ComCall(91, this, "ptr", pisFirstInXact, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pisLastInXact 
     * @returns {HRESULT} 
     */
    get_IsLastInTransaction2(pisLastInXact) {
        result := ComCall(92, this, "ptr", pisLastInXact, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AttachCurrentSecurityContext2() {
        result := ComCall(93, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSoapEnvelope 
     * @returns {HRESULT} 
     */
    get_SoapEnvelope(pbstrSoapEnvelope) {
        result := ComCall(94, this, "ptr", pbstrSoapEnvelope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarCompoundMessage 
     * @returns {HRESULT} 
     */
    get_CompoundMessage(pvarCompoundMessage) {
        result := ComCall(95, this, "ptr", pvarCompoundMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSoapHeader 
     * @returns {HRESULT} 
     */
    put_SoapHeader(bstrSoapHeader) {
        bstrSoapHeader := bstrSoapHeader is String ? BSTR.Alloc(bstrSoapHeader).Value : bstrSoapHeader

        result := ComCall(96, this, "ptr", bstrSoapHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSoapBody 
     * @returns {HRESULT} 
     */
    put_SoapBody(bstrSoapBody) {
        bstrSoapBody := bstrSoapBody is String ? BSTR.Alloc(bstrSoapBody).Value : bstrSoapBody

        result := ComCall(97, this, "ptr", bstrSoapBody, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
