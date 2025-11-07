#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsInterfaceHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsInterfaceHandler
     * @type {Guid}
     */
    static IID => Guid("{d3abc7e0-9a61-11d0-a40d-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsSetPin", "KsProcessMediaSamples", "KsCompleteIo"]

    /**
     * 
     * @param {IKsPin} KsPin 
     * @returns {HRESULT} 
     */
    KsSetPin(KsPin) {
        result := ComCall(3, this, "ptr", KsPin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IKsDataTypeHandler} KsDataTypeHandler 
     * @param {Pointer<IMediaSample>} SampleList 
     * @param {Pointer<Integer>} SampleCount 
     * @param {Integer} IoOperation 
     * @returns {Pointer<KSSTREAM_SEGMENT>} 
     */
    KsProcessMediaSamples(KsDataTypeHandler, SampleList, SampleCount, IoOperation) {
        SampleCountMarshal := SampleCount is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", KsDataTypeHandler, "ptr*", SampleList, SampleCountMarshal, SampleCount, "int", IoOperation, "ptr*", &StreamSegment := 0, "HRESULT")
        return StreamSegment
    }

    /**
     * 
     * @param {Pointer<KSSTREAM_SEGMENT>} StreamSegment 
     * @returns {HRESULT} 
     */
    KsCompleteIo(StreamSegment) {
        result := ComCall(5, this, "ptr", StreamSegment, "HRESULT")
        return result
    }
}
