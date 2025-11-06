#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include .\IMFAttributes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This section contains reference information for the IMFDeviceTransform interface.
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/nn-mftransform-imfdevicetransform
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDeviceTransform extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeTransform", "GetInputAvailableType", "GetInputCurrentType", "GetInputStreamAttributes", "GetOutputAvailableType", "GetOutputCurrentType", "GetOutputStreamAttributes", "GetStreamCount", "GetStreamIDs", "ProcessEvent", "ProcessInput", "ProcessMessage", "ProcessOutput", "SetInputStreamState", "GetInputStreamState", "SetOutputStreamState", "GetOutputStreamState", "GetInputStreamPreferredState", "FlushInputStream", "FlushOutputStream"]

    /**
     * 
     * @param {IMFAttributes} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-initializetransform
     */
    InitializeTransform(pAttributes) {
        result := ComCall(3, this, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {Integer} dwTypeIndex 
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputavailabletype
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex) {
        result := ComCall(4, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamID) {
        result := ComCall(5, this, "uint", dwInputStreamID, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputstreamattributes
     */
    GetInputStreamAttributes(dwInputStreamID) {
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Integer} dwTypeIndex 
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getoutputavailabletype
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex) {
        result := ComCall(7, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamID) {
        result := ComCall(8, this, "uint", dwOutputStreamID, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getoutputstreamattributes
     */
    GetOutputStreamAttributes(dwOutputStreamID) {
        result := ComCall(9, this, "uint", dwOutputStreamID, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcInputStreams 
     * @param {Pointer<Integer>} pcOutputStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputIDArraySize 
     * @param {Pointer<Integer>} pdwInputStreamIds 
     * @param {Integer} dwOutputIDArraySize 
     * @param {Pointer<Integer>} pdwOutputStreamIds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids
     */
    GetStreamIDs(dwInputIDArraySize, pdwInputStreamIds, dwOutputIDArraySize, pdwOutputStreamIds) {
        pdwInputStreamIdsMarshal := pdwInputStreamIds is VarRef ? "uint*" : "ptr"
        pdwOutputStreamIdsMarshal := pdwOutputStreamIds is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", dwInputIDArraySize, pdwInputStreamIdsMarshal, pdwInputStreamIds, "uint", dwOutputIDArraySize, pdwOutputStreamIdsMarshal, pdwOutputStreamIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {IMFMediaEvent} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-processevent
     */
    ProcessEvent(dwInputStreamID, pEvent) {
        result := ComCall(12, this, "uint", dwInputStreamID, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamID 
     * @param {IMFSample} pSample 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-processinput
     */
    ProcessInput(dwInputStreamID, pSample, dwFlags) {
        result := ComCall(13, this, "uint", dwInputStreamID, "ptr", pSample, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eMessage 
     * @param {Pointer} ulParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(14, this, "int", eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cOutputBufferCount 
     * @param {Pointer<MFT_OUTPUT_DATA_BUFFER>} pOutputSample 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSample) {
        result := ComCall(15, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSample, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {IMFMediaType} pMediaType 
     * @param {Integer} value 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-setinputstreamstate
     */
    SetInputStreamState(dwStreamID, pMediaType, value, dwFlags) {
        result := ComCall(16, this, "uint", dwStreamID, "ptr", pMediaType, "int", value, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputstreamstate
     */
    GetInputStreamState(dwStreamID) {
        result := ComCall(17, this, "uint", dwStreamID, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {IMFMediaType} pMediaType 
     * @param {Integer} value 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-setoutputstreamstate
     */
    SetOutputStreamState(dwStreamID, pMediaType, value, dwFlags) {
        result := ComCall(18, this, "uint", dwStreamID, "ptr", pMediaType, "int", value, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getoutputstreamstate
     */
    GetOutputStreamState(dwStreamID) {
        result := ComCall(19, this, "uint", dwStreamID, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Integer>} value 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputstreampreferredstate
     */
    GetInputStreamPreferredState(dwStreamID, value, ppMediaType) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "uint", dwStreamID, valueMarshal, value, "ptr*", ppMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-flushinputstream
     */
    FlushInputStream(dwStreamIndex, dwFlags) {
        result := ComCall(21, this, "uint", dwStreamIndex, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-flushoutputstream
     */
    FlushOutputStream(dwStreamIndex, dwFlags) {
        result := ComCall(22, this, "uint", dwStreamIndex, "uint", dwFlags, "HRESULT")
        return result
    }
}
