#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspin
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsPin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsPin
     * @type {Guid}
     */
    static IID => Guid("{b61178d1-a2d9-11cf-9e53-00aa00a216a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsQueryMediums", "KsQueryInterfaces", "KsCreateSinkPinHandle", "KsGetCurrentCommunication", "KsPropagateAcquire", "KsDeliver", "KsMediaSamplesCompleted", "KsPeekAllocator", "KsReceiveAllocator", "KsRenegotiateAllocator", "KsIncrementPendingIoCount", "KsDecrementPendingIoCount", "KsQualityNotify"]

    /**
     * 
     * @param {Pointer<Pointer<KSMULTIPLE_ITEM>>} MediumList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspin-ksquerymediums
     */
    KsQueryMediums(MediumList) {
        MediumListMarshal := MediumList is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, MediumListMarshal, MediumList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<KSMULTIPLE_ITEM>>} InterfaceList 
     * @returns {HRESULT} 
     */
    KsQueryInterfaces(InterfaceList) {
        InterfaceListMarshal := InterfaceList is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, InterfaceListMarshal, InterfaceList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Interface 
     * @param {Pointer<KSIDENTIFIER>} Medium 
     * @returns {HRESULT} 
     */
    KsCreateSinkPinHandle(Interface, Medium) {
        result := ComCall(5, this, "ptr", Interface, "ptr", Medium, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Communication 
     * @param {Pointer<KSIDENTIFIER>} Interface 
     * @param {Pointer<KSIDENTIFIER>} Medium 
     * @returns {HRESULT} 
     */
    KsGetCurrentCommunication(Communication, Interface, Medium) {
        CommunicationMarshal := Communication is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, CommunicationMarshal, Communication, "ptr", Interface, "ptr", Medium, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    KsPropagateAcquire() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaSample} Sample 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    KsDeliver(Sample, Flags) {
        result := ComCall(8, this, "ptr", Sample, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSSTREAM_SEGMENT>} StreamSegment 
     * @returns {HRESULT} 
     */
    KsMediaSamplesCompleted(StreamSegment) {
        result := ComCall(9, this, "ptr", StreamSegment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Operation 
     * @returns {IMemAllocator} 
     */
    KsPeekAllocator(Operation) {
        result := ComCall(10, this, "int", Operation, "ptr")
        return result
    }

    /**
     * 
     * @param {IMemAllocator} MemAllocator 
     * @returns {HRESULT} 
     */
    KsReceiveAllocator(MemAllocator) {
        result := ComCall(11, this, "ptr", MemAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    KsRenegotiateAllocator() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsIncrementPendingIoCount() {
        result := ComCall(13, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsDecrementPendingIoCount() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Proportion 
     * @param {Integer} TimeDelta 
     * @returns {HRESULT} 
     */
    KsQualityNotify(Proportion, TimeDelta) {
        result := ComCall(15, this, "uint", Proportion, "int64", TimeDelta, "HRESULT")
        return result
    }
}
