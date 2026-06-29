#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IAMNetworkStatus interface reports the quality of the network connection for the legacy Windows Media Player 6.4 source filter.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iamnetworkstatus
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMNetworkStatus extends IDispatch {
    /**
     * The interface identifier for IAMNetworkStatus
     * @type {Guid}
     */
    static IID := Guid("{fa2aa8f3-8b62-11d0-a520-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMNetworkStatus interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ReceivedPackets   : IntPtr
        get_RecoveredPackets  : IntPtr
        get_LostPackets       : IntPtr
        get_ReceptionQuality  : IntPtr
        get_BufferingCount    : IntPtr
        get_IsBroadcast       : IntPtr
        get_BufferingProgress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMNetworkStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_receivedpackets
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_recoveredpackets
     */
    get_RecoveredPackets(pRecoveredPackets) {
        pRecoveredPacketsMarshal := pRecoveredPackets is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pRecoveredPacketsMarshal, pRecoveredPackets, "HRESULT")
        return result
    }

    /**
     * The get_LostPackets method retrieves the number of packets that have been lost.
     * @remarks
     * This property is only valid for streaming media, and will equal zero when using the HTTP protocol, which is lossless. Packets may be lost for a number of reasons, such as the type and quality of the network connection.
     * 
     * Whenever playback is stopped and restarted, this property is set to zero. It is not reset if playback is paused and restarted.
     * @param {Pointer<Integer>} pLostPackets Pointer to a variable that receives the number of lost packets.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_lostpackets
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_receptionquality
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_bufferingcount
     */
    get_BufferingCount(pBufferingCount) {
        pBufferingCountMarshal := pBufferingCount is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pBufferingCountMarshal, pBufferingCount, "HRESULT")
        return result
    }

    /**
     * The get_IsBroadcast method retrieves a value indicating whether the current stream is a broadcast stream.
     * @remarks
     * A broadcast stream can be unicast or multicast. In a broadcast connection, the client is passive and does not control when the stream starts or stops. In an on-demand connection, the client is active and controls when the stream is started and stopped.
     * @param {Pointer<VARIANT_BOOL>} pIsBroadcast Pointer to a variable that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_isbroadcast
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetworkstatus-get_bufferingprogress
     */
    get_BufferingProgress(pBufferingProgress) {
        pBufferingProgressMarshal := pBufferingProgress is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pBufferingProgressMarshal, pBufferingProgress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMNetworkStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ReceivedPackets := CallbackCreate(GetMethod(implObj, "get_ReceivedPackets"), flags, 2)
        this.vtbl.get_RecoveredPackets := CallbackCreate(GetMethod(implObj, "get_RecoveredPackets"), flags, 2)
        this.vtbl.get_LostPackets := CallbackCreate(GetMethod(implObj, "get_LostPackets"), flags, 2)
        this.vtbl.get_ReceptionQuality := CallbackCreate(GetMethod(implObj, "get_ReceptionQuality"), flags, 2)
        this.vtbl.get_BufferingCount := CallbackCreate(GetMethod(implObj, "get_BufferingCount"), flags, 2)
        this.vtbl.get_IsBroadcast := CallbackCreate(GetMethod(implObj, "get_IsBroadcast"), flags, 2)
        this.vtbl.get_BufferingProgress := CallbackCreate(GetMethod(implObj, "get_BufferingProgress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ReceivedPackets)
        CallbackFree(this.vtbl.get_RecoveredPackets)
        CallbackFree(this.vtbl.get_LostPackets)
        CallbackFree(this.vtbl.get_ReceptionQuality)
        CallbackFree(this.vtbl.get_BufferingCount)
        CallbackFree(this.vtbl.get_IsBroadcast)
        CallbackFree(this.vtbl.get_BufferingProgress)
    }
}
