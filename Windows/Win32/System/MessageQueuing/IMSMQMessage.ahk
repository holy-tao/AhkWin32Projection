#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} plClass 
     * @returns {HRESULT} 
     */
    get_Class(plClass) {
        plClassMarshal := plClass is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plClassMarshal, plClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPrivLevel 
     * @returns {HRESULT} 
     */
    get_PrivLevel(plPrivLevel) {
        plPrivLevelMarshal := plPrivLevel is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plPrivLevelMarshal, plPrivLevel, "HRESULT")
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
        plAuthLevelMarshal := plAuthLevel is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plAuthLevelMarshal, plAuthLevel, "HRESULT")
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
        pisAuthenticatedMarshal := pisAuthenticated is VarRef ? "short*" : "ptr"

        result := ComCall(12, this, pisAuthenticatedMarshal, pisAuthenticated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDelivery 
     * @returns {HRESULT} 
     */
    get_Delivery(plDelivery) {
        plDeliveryMarshal := plDelivery is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plDeliveryMarshal, plDelivery, "HRESULT")
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
        plTraceMarshal := plTrace is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plTraceMarshal, plTrace, "HRESULT")
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
        plPriorityMarshal := plPriority is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, plPriorityMarshal, plPriority, "HRESULT")
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
        plJournalMarshal := plJournal is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, plJournalMarshal, plJournal, "HRESULT")
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
    get_ResponseQueueInfo(ppqinfoResponse) {
        result := ComCall(21, this, "ptr*", ppqinfoResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSMQQueueInfo} pqinfoResponse 
     * @returns {HRESULT} 
     */
    putref_ResponseQueueInfo(pqinfoResponse) {
        result := ComCall(22, this, "ptr", pqinfoResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plAppSpecific 
     * @returns {HRESULT} 
     */
    get_AppSpecific(plAppSpecific) {
        plAppSpecificMarshal := plAppSpecific is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, plAppSpecificMarshal, plAppSpecific, "HRESULT")
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
        pcbBodyMarshal := pcbBody is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pcbBodyMarshal, pcbBody, "HRESULT")
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
    get_AdminQueueInfo(ppqinfoAdmin) {
        result := ComCall(29, this, "ptr*", ppqinfoAdmin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSMQQueueInfo} pqinfoAdmin 
     * @returns {HRESULT} 
     */
    putref_AdminQueueInfo(pqinfoAdmin) {
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
        plAckMarshal := plAck is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, plAckMarshal, plAck, "HRESULT")
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
        plMaxTimeToReachQueueMarshal := plMaxTimeToReachQueue is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, plMaxTimeToReachQueueMarshal, plMaxTimeToReachQueue, "HRESULT")
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
        plMaxTimeToReceiveMarshal := plMaxTimeToReceive is VarRef ? "int*" : "ptr"

        result := ComCall(40, this, plMaxTimeToReceiveMarshal, plMaxTimeToReceive, "HRESULT")
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
        plHashAlgMarshal := plHashAlg is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, plHashAlgMarshal, plHashAlg, "HRESULT")
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
        plEncryptAlgMarshal := plEncryptAlg is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, plEncryptAlgMarshal, plEncryptAlg, "HRESULT")
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
     * @param {Pointer<IMSMQQueueInfo>} ppqinfoDest 
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
        plSenderIdTypeMarshal := plSenderIdType is VarRef ? "int*" : "ptr"

        result := ComCall(52, this, plSenderIdTypeMarshal, plSenderIdType, "HRESULT")
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
     * @param {IMSMQQueue} DestinationQueue 
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
}
