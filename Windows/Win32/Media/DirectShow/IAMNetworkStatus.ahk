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
     * 
     * @param {Pointer<Integer>} pReceivedPackets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_receivedpackets
     */
    get_ReceivedPackets(pReceivedPackets) {
        result := ComCall(7, this, "int*", pReceivedPackets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRecoveredPackets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_recoveredpackets
     */
    get_RecoveredPackets(pRecoveredPackets) {
        result := ComCall(8, this, "int*", pRecoveredPackets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLostPackets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_lostpackets
     */
    get_LostPackets(pLostPackets) {
        result := ComCall(9, this, "int*", pLostPackets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pReceptionQuality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_receptionquality
     */
    get_ReceptionQuality(pReceptionQuality) {
        result := ComCall(10, this, "int*", pReceptionQuality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBufferingCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_bufferingcount
     */
    get_BufferingCount(pBufferingCount) {
        result := ComCall(11, this, "int*", pBufferingCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pIsBroadcast 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_isbroadcast
     */
    get_IsBroadcast(pIsBroadcast) {
        result := ComCall(12, this, "ptr", pIsBroadcast, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBufferingProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_bufferingprogress
     */
    get_BufferingProgress(pBufferingProgress) {
        result := ComCall(13, this, "int*", pBufferingProgress, "HRESULT")
        return result
    }
}
