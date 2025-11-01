#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by all Media Foundation Transforms (MFTs).
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/nn-mftransform-imftransform
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTransform extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTransform
     * @type {Guid}
     */
    static IID => Guid("{bf94c121-5b05-4e6f-8000-ba598961414d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamLimits", "GetStreamCount", "GetStreamIDs", "GetInputStreamInfo", "GetOutputStreamInfo", "GetAttributes", "GetInputStreamAttributes", "GetOutputStreamAttributes", "DeleteInputStream", "AddInputStreams", "GetInputAvailableType", "GetOutputAvailableType", "SetInputType", "SetOutputType", "GetInputCurrentType", "GetOutputCurrentType", "GetInputStatus", "GetOutputStatus", "SetOutputBounds", "ProcessEvent", "ProcessMessage", "ProcessInput", "ProcessOutput"]

    /**
     * 
     * @param {Pointer<Integer>} pdwInputMinimum 
     * @param {Pointer<Integer>} pdwInputMaximum 
     * @param {Pointer<Integer>} pdwOutputMinimum 
     * @param {Pointer<Integer>} pdwOutputMaximum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamlimits
     */
    GetStreamLimits(pdwInputMinimum, pdwInputMaximum, pdwOutputMinimum, pdwOutputMaximum) {
        pdwInputMinimumMarshal := pdwInputMinimum is VarRef ? "uint*" : "ptr"
        pdwInputMaximumMarshal := pdwInputMaximum is VarRef ? "uint*" : "ptr"
        pdwOutputMinimumMarshal := pdwOutputMinimum is VarRef ? "uint*" : "ptr"
        pdwOutputMaximumMarshal := pdwOutputMaximum is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwInputMinimumMarshal, pdwInputMinimum, pdwInputMaximumMarshal, pdwInputMaximum, pdwOutputMinimumMarshal, pdwOutputMinimum, pdwOutputMaximumMarshal, pdwOutputMaximum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcInputStreams 
     * @param {Pointer<Integer>} pcOutputStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputIDArraySize 
     * @param {Pointer<Integer>} pdwInputIDs 
     * @param {Integer} dwOutputIDArraySize 
     * @param {Pointer<Integer>} pdwOutputIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamids
     */
    GetStreamIDs(dwInputIDArraySize, pdwInputIDs, dwOutputIDArraySize, pdwOutputIDs) {
        pdwInputIDsMarshal := pdwInputIDs is VarRef ? "uint*" : "ptr"
        pdwOutputIDsMarshal := pdwOutputIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwInputIDArraySize, pdwInputIDsMarshal, pdwInputIDs, "uint", dwOutputIDArraySize, pdwOutputIDsMarshal, pdwOutputIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<MFT_INPUT_STREAM_INFO>} pStreamInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstreaminfo
     */
    GetInputStreamInfo(dwInputStreamID, pStreamInfo) {
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr", pStreamInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<MFT_OUTPUT_STREAM_INFO>} pStreamInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo
     */
    GetOutputStreamInfo(dwOutputStreamID, pStreamInfo) {
        result := ComCall(7, this, "uint", dwOutputStreamID, "ptr", pStreamInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getattributes
     */
    GetAttributes(pAttributes) {
        result := ComCall(8, this, "ptr*", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFAttributes>} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstreamattributes
     */
    GetInputStreamAttributes(dwInputStreamID, pAttributes) {
        result := ComCall(9, this, "uint", dwInputStreamID, "ptr*", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<IMFAttributes>} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstreamattributes
     */
    GetOutputStreamAttributes(dwOutputStreamID, pAttributes) {
        result := ComCall(10, this, "uint", dwOutputStreamID, "ptr*", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-deleteinputstream
     */
    DeleteInputStream(dwStreamID) {
        result := ComCall(11, this, "uint", dwStreamID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cStreams 
     * @param {Pointer<Integer>} adwStreamIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-addinputstreams
     */
    AddInputStreams(cStreams, adwStreamIDs) {
        adwStreamIDsMarshal := adwStreamIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", cStreams, adwStreamIDsMarshal, adwStreamIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputavailabletype
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex, ppType) {
        result := ComCall(13, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr*", ppType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputavailabletype
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex, ppType) {
        result := ComCall(14, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr*", ppType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {IMFMediaType} pType 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-setinputtype
     */
    SetInputType(dwInputStreamID, pType, dwFlags) {
        result := ComCall(15, this, "uint", dwInputStreamID, "ptr", pType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {IMFMediaType} pType 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-setoutputtype
     */
    SetOutputType(dwOutputStreamID, pType, dwFlags) {
        result := ComCall(16, this, "uint", dwOutputStreamID, "ptr", pType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamID, ppType) {
        result := ComCall(17, this, "uint", dwInputStreamID, "ptr*", ppType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamID, ppType) {
        result := ComCall(18, this, "uint", dwOutputStreamID, "ptr*", ppType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstatus
     */
    GetInputStatus(dwInputStreamID, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "uint", dwInputStreamID, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstatus
     */
    GetOutputStatus(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hnsLowerBound 
     * @param {Integer} hnsUpperBound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-setoutputbounds
     */
    SetOutputBounds(hnsLowerBound, hnsUpperBound) {
        result := ComCall(21, this, "int64", hnsLowerBound, "int64", hnsUpperBound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {IMFMediaEvent} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processevent
     */
    ProcessEvent(dwInputStreamID, pEvent) {
        result := ComCall(22, this, "uint", dwInputStreamID, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eMessage 
     * @param {Pointer} ulParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(23, this, "int", eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {IMFSample} pSample 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processinput
     */
    ProcessInput(dwInputStreamID, pSample, dwFlags) {
        result := ComCall(24, this, "uint", dwInputStreamID, "ptr", pSample, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cOutputBufferCount 
     * @param {Pointer<MFT_OUTPUT_DATA_BUFFER>} pOutputSamples 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSamples, pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSamples, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }
}
