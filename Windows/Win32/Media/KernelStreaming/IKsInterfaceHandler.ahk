#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsInterfaceHandler extends IUnknown{
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
     * 
     * @param {Pointer<IKsPin>} KsPin 
     * @returns {HRESULT} 
     */
    KsSetPin(KsPin) {
        result := ComCall(3, this, "ptr", KsPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IKsDataTypeHandler>} KsDataTypeHandler 
     * @param {Pointer<IMediaSample>} SampleList 
     * @param {Pointer<Int32>} SampleCount 
     * @param {Integer} IoOperation 
     * @param {Pointer<KSSTREAM_SEGMENT>} StreamSegment 
     * @returns {HRESULT} 
     */
    KsProcessMediaSamples(KsDataTypeHandler, SampleList, SampleCount, IoOperation, StreamSegment) {
        result := ComCall(4, this, "ptr", KsDataTypeHandler, "ptr", SampleList, "int*", SampleCount, "int", IoOperation, "ptr", StreamSegment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSSTREAM_SEGMENT>} StreamSegment 
     * @returns {HRESULT} 
     */
    KsCompleteIo(StreamSegment) {
        result := ComCall(5, this, "ptr", StreamSegment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
