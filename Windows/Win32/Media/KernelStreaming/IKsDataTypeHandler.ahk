#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsDataTypeHandler extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsCompleteIoOperation", "KsIsMediaTypeInRanges", "KsPrepareIoOperation", "KsQueryExtendedSize", "KsSetMediaType"]

    /**
     * 
     * @param {IMediaSample} Sample 
     * @param {Pointer<Void>} StreamHeader 
     * @param {Integer} IoOperation 
     * @param {BOOL} Cancelled 
     * @returns {HRESULT} 
     */
    KsCompleteIoOperation(Sample, StreamHeader, IoOperation, Cancelled) {
        StreamHeaderMarshal := StreamHeader is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", Sample, StreamHeaderMarshal, StreamHeader, "int", IoOperation, "int", Cancelled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataRanges 
     * @returns {HRESULT} 
     */
    KsIsMediaTypeInRanges(DataRanges) {
        DataRangesMarshal := DataRanges is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, DataRangesMarshal, DataRanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaSample} Sample 
     * @param {Pointer<Void>} StreamHeader 
     * @param {Integer} IoOperation 
     * @returns {HRESULT} 
     */
    KsPrepareIoOperation(Sample, StreamHeader, IoOperation) {
        StreamHeaderMarshal := StreamHeader is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", Sample, StreamHeaderMarshal, StreamHeader, "int", IoOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsQueryExtendedSize() {
        result := ComCall(6, this, "uint*", &ExtendedSize := 0, "HRESULT")
        return ExtendedSize
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} AmMediaType 
     * @returns {HRESULT} 
     */
    KsSetMediaType(AmMediaType) {
        result := ComCall(7, this, "ptr", AmMediaType, "HRESULT")
        return result
    }
}
