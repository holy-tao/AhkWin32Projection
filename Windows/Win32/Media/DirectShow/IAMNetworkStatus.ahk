#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMNetworkStatus interface reports the quality of the network connection for the legacy Windows Media Player 6.4 source filter.
 * @remarks
 * 
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iamnetworkstatus
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMNetworkStatus extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMNetworkStatus
     * @type {Guid}
     */
    static IID => Guid("{fa2aa8f3-8b62-11d0-a520-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReceivedPackets", "get_RecoveredPackets", "get_LostPackets", "get_ReceptionQuality", "get_BufferingCount", "get_IsBroadcast", "get_BufferingProgress"]

    /**
     */
    ReceivedPackets {
        get => this.get_ReceivedPackets()
    }

    /**
     */
    RecoveredPackets {
        get => this.get_RecoveredPackets()
    }

    /**
     */
    LostPackets {
        get => this.get_LostPackets()
    }

    /**
     */
    ReceptionQuality {
        get => this.get_ReceptionQuality()
    }

    /**
     */
    BufferingCount {
        get => this.get_BufferingCount()
    }

    /**
     */
    IsBroadcast {
        get => this.get_IsBroadcast()
    }

    /**
     */
    BufferingProgress {
        get => this.get_BufferingProgress()
    }

    /**
     * The get_ReceivedPackets method retrieves the number of packets that have been received.
     * @param {Pointer<Integer>} pReceivedPackets Pointer to a variable that receives the number of received packets.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetworkstatus-get_receivedpackets
     */
    get_ReceivedPackets(pReceivedPackets) {
        pReceivedPacketsMarshal := pReceivedPackets is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pReceivedPacketsMarshal, pReceivedPackets, "HRESULT")
        return result
    }

    /**
     * The get_RecoveredPackets method retrieves the number of recovered packets.
     * @param {Pointer<Integer>} pRecoveredPackets Pointer to a variable that receives the number of recovered packets.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetworkstatus-get_recoveredpackets
     */
    get_RecoveredPackets(pRecoveredPackets) {
        pRecoveredPacketsMarshal := pRecoveredPackets is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pRecoveredPacketsMarshal, pRecoveredPackets, "HRESULT")
        return result
    }

    /**
     * The get_LostPackets method retrieves the number of packets that have been lost.
     * @param {Pointer<Integer>} pLostPackets Pointer to a variable that receives the number of lost packets.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetworkstatus-get_lostpackets
     */
    get_LostPackets(pLostPackets) {
        pLostPacketsMarshal := pLostPackets is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pLostPacketsMarshal, pLostPackets, "HRESULT")
        return result
    }

    /**
     * The get_ReceptionQuality method retrieves a value indicating the reception quality.
     * @param {Pointer<Integer>} pReceptionQuality Pointer to a variable that receives a value from 0 to 100, indicating the reception quality. This value is percentage of packets that the filter received without requiring resending or error correction.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetworkstatus-get_receptionquality
     */
    get_ReceptionQuality(pReceptionQuality) {
        pReceptionQualityMarshal := pReceptionQuality is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pReceptionQualityMarshal, pReceptionQuality, "HRESULT")
        return result
    }

    /**
     * The get_BufferingCount method retrieves the number of times the network source has buffered the data.
     * @param {Pointer<Integer>} pBufferingCount Pointer to a variable that receives the buffering count.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetworkstatus-get_bufferingcount
     */
    get_BufferingCount(pBufferingCount) {
        pBufferingCountMarshal := pBufferingCount is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pBufferingCountMarshal, pBufferingCount, "HRESULT")
        return result
    }

    /**
     * The get_IsBroadcast method retrieves a value indicating whether the current stream is a broadcast stream.
     * @param {Pointer<VARIANT_BOOL>} pIsBroadcast Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetworkstatus-get_isbroadcast
     */
    get_IsBroadcast(pIsBroadcast) {
        pIsBroadcastMarshal := pIsBroadcast is VarRef ? "short*" : "ptr"

        result := ComCall(12, this, pIsBroadcastMarshal, pIsBroadcast, "HRESULT")
        return result
    }

    /**
     * The get_BufferingProgress method retrieves a value indicating the buffering progress.
     * @param {Pointer<Integer>} pBufferingProgress Pointer to a variable that receives a value from 0 to 100, indicating what percentage has completed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetworkstatus-get_bufferingprogress
     */
    get_BufferingProgress(pBufferingProgress) {
        pBufferingProgressMarshal := pBufferingProgress is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pBufferingProgressMarshal, pBufferingProgress, "HRESULT")
        return result
    }
}
