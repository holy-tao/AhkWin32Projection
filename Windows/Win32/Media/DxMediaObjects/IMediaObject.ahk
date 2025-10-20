#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaObject interface provides methods for manipulating a Microsoft DirectX Media Object (DMO).
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-imediaobject
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IMediaObject extends IUnknown{
    /**
     * The interface identifier for IMediaObject
     * @type {Guid}
     */
    static IID => Guid("{d8ad0f58-5494-4102-97c5-ec798e59bcf4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcInputStreams 
     * @param {Pointer<UInt32>} pcOutputStreams 
     * @returns {HRESULT} 
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        result := ComCall(3, this, "uint*", pcInputStreams, "uint*", pcOutputStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetInputStreamInfo(dwInputStreamIndex, pdwFlags) {
        result := ComCall(4, this, "uint", dwInputStreamIndex, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetOutputStreamInfo(dwOutputStreamIndex, pdwFlags) {
        result := ComCall(5, this, "uint", dwOutputStreamIndex, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    GetInputType(dwInputStreamIndex, dwTypeIndex, pmt) {
        result := ComCall(6, this, "uint", dwInputStreamIndex, "uint", dwTypeIndex, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    GetOutputType(dwOutputStreamIndex, dwTypeIndex, pmt) {
        result := ComCall(7, this, "uint", dwOutputStreamIndex, "uint", dwTypeIndex, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetInputType(dwInputStreamIndex, pmt, dwFlags) {
        result := ComCall(8, this, "uint", dwInputStreamIndex, "ptr", pmt, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetOutputType(dwOutputStreamIndex, pmt, dwFlags) {
        result := ComCall(9, this, "uint", dwOutputStreamIndex, "ptr", pmt, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    GetInputCurrentType(dwInputStreamIndex, pmt) {
        result := ComCall(10, this, "uint", dwInputStreamIndex, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    GetOutputCurrentType(dwOutputStreamIndex, pmt) {
        result := ComCall(11, this, "uint", dwOutputStreamIndex, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<UInt32>} pcbSize 
     * @param {Pointer<UInt32>} pcbMaxLookahead 
     * @param {Pointer<UInt32>} pcbAlignment 
     * @returns {HRESULT} 
     */
    GetInputSizeInfo(dwInputStreamIndex, pcbSize, pcbMaxLookahead, pcbAlignment) {
        result := ComCall(12, this, "uint", dwInputStreamIndex, "uint*", pcbSize, "uint*", pcbMaxLookahead, "uint*", pcbAlignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Pointer<UInt32>} pcbSize 
     * @param {Pointer<UInt32>} pcbAlignment 
     * @returns {HRESULT} 
     */
    GetOutputSizeInfo(dwOutputStreamIndex, pcbSize, pcbAlignment) {
        result := ComCall(13, this, "uint", dwOutputStreamIndex, "uint*", pcbSize, "uint*", pcbAlignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<Int64>} prtMaxLatency 
     * @returns {HRESULT} 
     */
    GetInputMaxLatency(dwInputStreamIndex, prtMaxLatency) {
        result := ComCall(14, this, "uint", dwInputStreamIndex, "int64*", prtMaxLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Integer} rtMaxLatency 
     * @returns {HRESULT} 
     */
    SetInputMaxLatency(dwInputStreamIndex, rtMaxLatency) {
        result := ComCall(15, this, "uint", dwInputStreamIndex, "int64", rtMaxLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @returns {HRESULT} 
     */
    Discontinuity(dwInputStreamIndex) {
        result := ComCall(17, this, "uint", dwInputStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AllocateStreamingResources() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FreeStreamingResources() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<UInt32>} dwFlags 
     * @returns {HRESULT} 
     */
    GetInputStatus(dwInputStreamIndex, dwFlags) {
        result := ComCall(20, this, "uint", dwInputStreamIndex, "uint*", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<IMediaBuffer>} pBuffer 
     * @param {Integer} dwFlags 
     * @param {Integer} rtTimestamp 
     * @param {Integer} rtTimelength 
     * @returns {HRESULT} 
     */
    ProcessInput(dwInputStreamIndex, pBuffer, dwFlags, rtTimestamp, rtTimelength) {
        result := ComCall(21, this, "uint", dwInputStreamIndex, "ptr", pBuffer, "uint", dwFlags, "int64", rtTimestamp, "int64", rtTimelength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cOutputBufferCount 
     * @param {Pointer<DMO_OUTPUT_DATA_BUFFER>} pOutputBuffers 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputBuffers, pdwStatus) {
        result := ComCall(22, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputBuffers, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bLock 
     * @returns {HRESULT} 
     */
    Lock(bLock) {
        result := ComCall(23, this, "int", bLock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
