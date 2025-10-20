#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsDataTypeHandler extends IUnknown{
    /**
     * The interface identifier for IKsDataTypeHandler
     * @type {Guid}
     */
    static IID => Guid("{5ffbaa02-49a3-11d0-9f36-00aa00a216a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMediaSample>} Sample 
     * @param {Pointer<Void>} StreamHeader 
     * @param {Integer} IoOperation 
     * @param {BOOL} Cancelled 
     * @returns {HRESULT} 
     */
    KsCompleteIoOperation(Sample, StreamHeader, IoOperation, Cancelled) {
        result := ComCall(3, this, "ptr", Sample, "ptr", StreamHeader, "int", IoOperation, "int", Cancelled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataRanges 
     * @returns {HRESULT} 
     */
    KsIsMediaTypeInRanges(DataRanges) {
        result := ComCall(4, this, "ptr", DataRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaSample>} Sample 
     * @param {Pointer<Void>} StreamHeader 
     * @param {Integer} IoOperation 
     * @returns {HRESULT} 
     */
    KsPrepareIoOperation(Sample, StreamHeader, IoOperation) {
        result := ComCall(5, this, "ptr", Sample, "ptr", StreamHeader, "int", IoOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} ExtendedSize 
     * @returns {HRESULT} 
     */
    KsQueryExtendedSize(ExtendedSize) {
        result := ComCall(6, this, "uint*", ExtendedSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} AmMediaType 
     * @returns {HRESULT} 
     */
    KsSetMediaType(AmMediaType) {
        result := ComCall(7, this, "ptr", AmMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
