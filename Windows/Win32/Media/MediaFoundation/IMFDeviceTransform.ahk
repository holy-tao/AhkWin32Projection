#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This section contains reference information for the IMFDeviceTransform interface.
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/nn-mftransform-imfdevicetransform
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDeviceTransform extends IUnknown{
    /**
     * The interface identifier for IMFDeviceTransform
     * @type {Guid}
     */
    static IID => Guid("{d818fbd8-fc46-42f2-87ac-1ea2d1f9bf32}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFAttributes>} pAttributes 
     * @returns {HRESULT} 
     */
    InitializeTransform(pAttributes) {
        result := ComCall(3, this, "ptr", pAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @returns {HRESULT} 
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex, pMediaType) {
        result := ComCall(4, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @returns {HRESULT} 
     */
    GetInputCurrentType(dwInputStreamID, pMediaType) {
        result := ComCall(5, this, "uint", dwInputStreamID, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetInputStreamAttributes(dwInputStreamID, ppAttributes) {
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @returns {HRESULT} 
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex, pMediaType) {
        result := ComCall(7, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @returns {HRESULT} 
     */
    GetOutputCurrentType(dwOutputStreamID, pMediaType) {
        result := ComCall(8, this, "uint", dwOutputStreamID, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetOutputStreamAttributes(dwOutputStreamID, ppAttributes) {
        result := ComCall(9, this, "uint", dwOutputStreamID, "ptr", ppAttributes, "int")
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
        result := ComCall(10, this, "uint*", pcInputStreams, "uint*", pcOutputStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputIDArraySize 
     * @param {Pointer<UInt32>} pdwInputStreamIds 
     * @param {Integer} dwOutputIDArraySize 
     * @param {Pointer<UInt32>} pdwOutputStreamIds 
     * @returns {HRESULT} 
     */
    GetStreamIDs(dwInputIDArraySize, pdwInputStreamIds, dwOutputIDArraySize, pdwOutputStreamIds) {
        result := ComCall(11, this, "uint", dwInputIDArraySize, "uint*", pdwInputStreamIds, "uint", dwOutputIDArraySize, "uint*", pdwOutputStreamIds, "int")
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
        result := ComCall(12, this, "uint", dwInputStreamID, "ptr", pEvent, "int")
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
        result := ComCall(13, this, "uint", dwInputStreamID, "ptr", pSample, "uint", dwFlags, "int")
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
        result := ComCall(14, this, "int", eMessage, "ptr", ulParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cOutputBufferCount 
     * @param {Pointer<MFT_OUTPUT_DATA_BUFFER>} pOutputSample 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSample, pdwStatus) {
        result := ComCall(15, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSample, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @param {Integer} value 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetInputStreamState(dwStreamID, pMediaType, value, dwFlags) {
        result := ComCall(16, this, "uint", dwStreamID, "ptr", pMediaType, "int", value, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    GetInputStreamState(dwStreamID, value) {
        result := ComCall(17, this, "uint", dwStreamID, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @param {Integer} value 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetOutputStreamState(dwStreamID, pMediaType, value, dwFlags) {
        result := ComCall(18, this, "uint", dwStreamID, "ptr", pMediaType, "int", value, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    GetOutputStreamState(dwStreamID, value) {
        result := ComCall(19, this, "uint", dwStreamID, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Int32>} value 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetInputStreamPreferredState(dwStreamID, value, ppMediaType) {
        result := ComCall(20, this, "uint", dwStreamID, "int*", value, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FlushInputStream(dwStreamIndex, dwFlags) {
        result := ComCall(21, this, "uint", dwStreamIndex, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FlushOutputStream(dwStreamIndex, dwFlags) {
        result := ComCall(22, this, "uint", dwStreamIndex, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
