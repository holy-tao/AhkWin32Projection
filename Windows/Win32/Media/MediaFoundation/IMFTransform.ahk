#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFT_INPUT_STREAM_INFO.ahk
#Include .\MFT_OUTPUT_STREAM_INFO.ahk
#Include .\IMFAttributes.ahk
#Include .\IMFMediaType.ahk
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
     * @returns {MFT_INPUT_STREAM_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstreaminfo
     */
    GetInputStreamInfo(dwInputStreamID) {
        pStreamInfo := MFT_INPUT_STREAM_INFO()
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr", pStreamInfo, "HRESULT")
        return pStreamInfo
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @returns {MFT_OUTPUT_STREAM_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo
     */
    GetOutputStreamInfo(dwOutputStreamID) {
        pStreamInfo := MFT_OUTPUT_STREAM_INFO()
        result := ComCall(7, this, "uint", dwOutputStreamID, "ptr", pStreamInfo, "HRESULT")
        return pStreamInfo
    }

    /**
     * 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getattributes
     */
    GetAttributes() {
        result := ComCall(8, this, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstreamattributes
     */
    GetInputStreamAttributes(dwInputStreamID) {
        result := ComCall(9, this, "uint", dwInputStreamID, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstreamattributes
     */
    GetOutputStreamAttributes(dwOutputStreamID) {
        result := ComCall(10, this, "uint", dwOutputStreamID, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
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
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputavailabletype
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex) {
        result := ComCall(13, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Integer} dwTypeIndex 
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputavailabletype
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex) {
        result := ComCall(14, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
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
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamID) {
        result := ComCall(17, this, "uint", dwInputStreamID, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamID) {
        result := ComCall(18, this, "uint", dwOutputStreamID, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstatus
     */
    GetInputStatus(dwInputStreamID) {
        result := ComCall(19, this, "uint", dwInputStreamID, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstatus
     */
    GetOutputStatus() {
        result := ComCall(20, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSamples) {
        result := ComCall(25, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSamples, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }
}
