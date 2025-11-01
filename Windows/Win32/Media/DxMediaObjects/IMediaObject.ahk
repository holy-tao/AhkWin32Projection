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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetInputStreamInfo", "GetOutputStreamInfo", "GetInputType", "GetOutputType", "SetInputType", "SetOutputType", "GetInputCurrentType", "GetOutputCurrentType", "GetInputSizeInfo", "GetOutputSizeInfo", "GetInputMaxLatency", "SetInputMaxLatency", "Flush", "Discontinuity", "AllocateStreamingResources", "FreeStreamingResources", "GetInputStatus", "ProcessInput", "ProcessOutput", "Lock"]

    /**
     * 
     * @param {Pointer<Integer>} pcInputStreams 
     * @param {Pointer<Integer>} pcOutputStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputstreaminfo
     */
    GetInputStreamInfo(dwInputStreamIndex, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwInputStreamIndex, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getoutputstreaminfo
     */
    GetOutputStreamInfo(dwOutputStreamIndex, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwOutputStreamIndex, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputtype
     */
    GetInputType(dwInputStreamIndex, dwTypeIndex, pmt) {
        result := ComCall(6, this, "uint", dwInputStreamIndex, "uint", dwTypeIndex, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getoutputtype
     */
    GetOutputType(dwOutputStreamIndex, dwTypeIndex, pmt) {
        result := ComCall(7, this, "uint", dwOutputStreamIndex, "uint", dwTypeIndex, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-setinputtype
     */
    SetInputType(dwInputStreamIndex, pmt, dwFlags) {
        result := ComCall(8, this, "uint", dwInputStreamIndex, "ptr", pmt, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-setoutputtype
     */
    SetOutputType(dwOutputStreamIndex, pmt, dwFlags) {
        result := ComCall(9, this, "uint", dwOutputStreamIndex, "ptr", pmt, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamIndex, pmt) {
        result := ComCall(10, this, "uint", dwInputStreamIndex, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamIndex, pmt) {
        result := ComCall(11, this, "uint", dwOutputStreamIndex, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<Integer>} pcbSize 
     * @param {Pointer<Integer>} pcbMaxLookahead 
     * @param {Pointer<Integer>} pcbAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputsizeinfo
     */
    GetInputSizeInfo(dwInputStreamIndex, pcbSize, pcbMaxLookahead, pcbAlignment) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"
        pcbMaxLookaheadMarshal := pcbMaxLookahead is VarRef ? "uint*" : "ptr"
        pcbAlignmentMarshal := pcbAlignment is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", dwInputStreamIndex, pcbSizeMarshal, pcbSize, pcbMaxLookaheadMarshal, pcbMaxLookahead, pcbAlignmentMarshal, pcbAlignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Pointer<Integer>} pcbSize 
     * @param {Pointer<Integer>} pcbAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getoutputsizeinfo
     */
    GetOutputSizeInfo(dwOutputStreamIndex, pcbSize, pcbAlignment) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"
        pcbAlignmentMarshal := pcbAlignment is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwOutputStreamIndex, pcbSizeMarshal, pcbSize, pcbAlignmentMarshal, pcbAlignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<Integer>} prtMaxLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputmaxlatency
     */
    GetInputMaxLatency(dwInputStreamIndex, prtMaxLatency) {
        prtMaxLatencyMarshal := prtMaxLatency is VarRef ? "int64*" : "ptr"

        result := ComCall(14, this, "uint", dwInputStreamIndex, prtMaxLatencyMarshal, prtMaxLatency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Integer} rtMaxLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-setinputmaxlatency
     */
    SetInputMaxLatency(dwInputStreamIndex, rtMaxLatency) {
        result := ComCall(15, this, "uint", dwInputStreamIndex, "int64", rtMaxLatency, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-flush
     */
    Flush() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-discontinuity
     */
    Discontinuity(dwInputStreamIndex) {
        result := ComCall(17, this, "uint", dwInputStreamIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-allocatestreamingresources
     */
    AllocateStreamingResources() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-freestreamingresources
     */
    FreeStreamingResources() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<Integer>} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputstatus
     */
    GetInputStatus(dwInputStreamIndex, dwFlags) {
        dwFlagsMarshal := dwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "uint", dwInputStreamIndex, dwFlagsMarshal, dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputStreamIndex 
     * @param {IMediaBuffer} pBuffer 
     * @param {Integer} dwFlags 
     * @param {Integer} rtTimestamp 
     * @param {Integer} rtTimelength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-processinput
     */
    ProcessInput(dwInputStreamIndex, pBuffer, dwFlags, rtTimestamp, rtTimelength) {
        result := ComCall(21, this, "uint", dwInputStreamIndex, "ptr", pBuffer, "uint", dwFlags, "int64", rtTimestamp, "int64", rtTimelength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cOutputBufferCount 
     * @param {Pointer<DMO_OUTPUT_DATA_BUFFER>} pOutputBuffers 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputBuffers, pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputBuffers, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bLock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-lock
     */
    Lock(bLock) {
        result := ComCall(23, this, "int", bLock, "HRESULT")
        return result
    }
}
