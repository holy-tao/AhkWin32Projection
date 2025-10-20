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
     * 
     * @param {Pointer<Int32>} pReceivedPackets 
     * @returns {HRESULT} 
     */
    get_ReceivedPackets(pReceivedPackets) {
        result := ComCall(7, this, "int*", pReceivedPackets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRecoveredPackets 
     * @returns {HRESULT} 
     */
    get_RecoveredPackets(pRecoveredPackets) {
        result := ComCall(8, this, "int*", pRecoveredPackets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLostPackets 
     * @returns {HRESULT} 
     */
    get_LostPackets(pLostPackets) {
        result := ComCall(9, this, "int*", pLostPackets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pReceptionQuality 
     * @returns {HRESULT} 
     */
    get_ReceptionQuality(pReceptionQuality) {
        result := ComCall(10, this, "int*", pReceptionQuality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pBufferingCount 
     * @returns {HRESULT} 
     */
    get_BufferingCount(pBufferingCount) {
        result := ComCall(11, this, "int*", pBufferingCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pIsBroadcast 
     * @returns {HRESULT} 
     */
    get_IsBroadcast(pIsBroadcast) {
        result := ComCall(12, this, "ptr", pIsBroadcast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pBufferingProgress 
     * @returns {HRESULT} 
     */
    get_BufferingProgress(pBufferingProgress) {
        result := ComCall(13, this, "int*", pBufferingProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
