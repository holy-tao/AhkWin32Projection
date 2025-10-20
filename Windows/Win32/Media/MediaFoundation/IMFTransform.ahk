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
     * 
     * @param {Pointer<UInt32>} pdwInputMinimum 
     * @param {Pointer<UInt32>} pdwInputMaximum 
     * @param {Pointer<UInt32>} pdwOutputMinimum 
     * @param {Pointer<UInt32>} pdwOutputMaximum 
     * @returns {HRESULT} 
     */
    GetStreamLimits(pdwInputMinimum, pdwInputMaximum, pdwOutputMinimum, pdwOutputMaximum) {
        result := ComCall(3, this, "uint*", pdwInputMinimum, "uint*", pdwInputMaximum, "uint*", pdwOutputMinimum, "uint*", pdwOutputMaximum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcInputStreams 
     * @param {Pointer<UInt32>} pcOutputStreams 
     * @returns {HRESULT} 
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        result := ComCall(4, this, "uint*", pcInputStreams, "uint*", pcOutputStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputIDArraySize 
     * @param {Pointer<UInt32>} pdwInputIDs 
     * @param {Integer} dwOutputIDArraySize 
     * @param {Pointer<UInt32>} pdwOutputIDs 
     * @returns {HRESULT} 
     */
    GetStreamIDs(dwInputIDArraySize, pdwInputIDs, dwOutputIDArraySize, pdwOutputIDs) {
        result := ComCall(5, this, "uint", dwInputIDArraySize, "uint*", pdwInputIDs, "uint", dwOutputIDArraySize, "uint*", pdwOutputIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<MFT_INPUT_STREAM_INFO>} pStreamInfo 
     * @returns {HRESULT} 
     */
    GetInputStreamInfo(dwInputStreamID, pStreamInfo) {
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr", pStreamInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<MFT_OUTPUT_STREAM_INFO>} pStreamInfo 
     * @returns {HRESULT} 
     */
    GetOutputStreamInfo(dwOutputStreamID, pStreamInfo) {
        result := ComCall(7, this, "uint", dwOutputStreamID, "ptr", pStreamInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} pAttributes 
     * @returns {HRESULT} 
     */
    GetAttributes(pAttributes) {
        result := ComCall(8, this, "ptr", pAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFAttributes>} pAttributes 
     * @returns {HRESULT} 
     */
    GetInputStreamAttributes(dwInputStreamID, pAttributes) {
        result := ComCall(9, this, "uint", dwInputStreamID, "ptr", pAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<IMFAttributes>} pAttributes 
     * @returns {HRESULT} 
     */
    GetOutputStreamAttributes(dwOutputStreamID, pAttributes) {
        result := ComCall(10, this, "uint", dwOutputStreamID, "ptr", pAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @returns {HRESULT} 
     */
    DeleteInputStream(dwStreamID) {
        result := ComCall(11, this, "uint", dwStreamID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cStreams 
     * @param {Pointer<UInt32>} adwStreamIDs 
     * @returns {HRESULT} 
     */
    AddInputStreams(cStreams, adwStreamIDs) {
        result := ComCall(12, this, "uint", cStreams, "uint*", adwStreamIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex, ppType) {
        result := ComCall(13, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex, ppType) {
        result := ComCall(14, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFMediaType>} pType 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetInputType(dwInputStreamID, pType, dwFlags) {
        result := ComCall(15, this, "uint", dwInputStreamID, "ptr", pType, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<IMFMediaType>} pType 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetOutputType(dwOutputStreamID, pType, dwFlags) {
        result := ComCall(16, this, "uint", dwOutputStreamID, "ptr", pType, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     */
    GetInputCurrentType(dwInputStreamID, ppType) {
        result := ComCall(17, this, "uint", dwInputStreamID, "ptr", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     */
    GetOutputCurrentType(dwOutputStreamID, ppType) {
        result := ComCall(18, this, "uint", dwOutputStreamID, "ptr", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetInputStatus(dwInputStreamID, pdwFlags) {
        result := ComCall(19, this, "uint", dwInputStreamID, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetOutputStatus(pdwFlags) {
        result := ComCall(20, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsLowerBound 
     * @param {Integer} hnsUpperBound 
     * @returns {HRESULT} 
     */
    SetOutputBounds(hnsLowerBound, hnsUpperBound) {
        result := ComCall(21, this, "int64", hnsLowerBound, "int64", hnsUpperBound, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFMediaEvent>} pEvent 
     * @returns {HRESULT} 
     */
    ProcessEvent(dwInputStreamID, pEvent) {
        result := ComCall(22, this, "uint", dwInputStreamID, "ptr", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eMessage 
     * @param {Pointer} ulParam 
     * @returns {HRESULT} 
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(23, this, "int", eMessage, "ptr", ulParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFSample>} pSample 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ProcessInput(dwInputStreamID, pSample, dwFlags) {
        result := ComCall(24, this, "uint", dwInputStreamID, "ptr", pSample, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cOutputBufferCount 
     * @param {Pointer<MFT_OUTPUT_DATA_BUFFER>} pOutputSamples 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSamples, pdwStatus) {
        result := ComCall(25, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSamples, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
