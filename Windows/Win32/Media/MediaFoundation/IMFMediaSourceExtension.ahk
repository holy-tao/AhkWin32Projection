#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFSourceBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides functionality for the Media Source Extension (MSE).
 * @remarks
 * 
 *   Media Source Extensions (MSE) is a World Wide Web Consortium (W3C) standard that extends the HTML5 media  elements to enable dynamically changing the media stream without the use of plug-ins. The   <b>IMFMediaSourceExtension</b> interface  and the related Microsoft Win32 API implement MSE and are expected to only be called by web browsers implementing MSE.  
 * 
 * The MSE media source keeps track of the ready state of the of the source as well as a list of <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfsourcebuffer">IMFSourceBuffer</a> objects which provide media data for the source.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediasourceextension
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSourceExtension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSourceExtension
     * @type {Guid}
     */
    static IID => Guid("{e467b94e-a713-4562-a802-816a42e9008a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSourceBuffers", "GetActiveSourceBuffers", "GetReadyState", "GetDuration", "SetDuration", "AddSourceBuffer", "RemoveSourceBuffer", "SetEndOfStream", "IsTypeSupported", "GetSourceBuffer"]

    /**
     * Gets the collection of source buffers associated with this media source.
     * @returns {IMFSourceBufferList} The collection of source buffers.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getsourcebuffers
     */
    GetSourceBuffers() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * Gets the source buffers that are actively supplying media data to the media source.
     * @returns {IMFSourceBufferList} The list of active source buffers.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getactivesourcebuffers
     */
    GetActiveSourceBuffers() {
        result := ComCall(4, this, "ptr")
        return result
    }

    /**
     * Gets the ready state of the media source.
     * @returns {Integer} The ready state of the media source.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getreadystate
     */
    GetReadyState() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Gets the duration of the media source in 100-nanosecond units.
     * @returns {Float} The duration of the media source in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getduration
     */
    GetDuration() {
        result := ComCall(6, this, "double")
        return result
    }

    /**
     * Sets the duration of the media source in 100-nanosecond units.
     * @param {Float} duration The duration of the media source in 100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-setduration
     */
    SetDuration(duration) {
        result := ComCall(7, this, "double", duration, "HRESULT")
        return result
    }

    /**
     * Adds a IMFSourceBuffer to the collection of buffers associated with the IMFMediaSourceExtension.
     * @param {BSTR} type 
     * @param {IMFSourceBufferNotify} pNotify 
     * @returns {IMFSourceBuffer} 
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-addsourcebuffer
     */
    AddSourceBuffer(type, pNotify) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(8, this, "ptr", type, "ptr", pNotify, "ptr*", &ppSourceBuffer := 0, "HRESULT")
        return IMFSourceBuffer(ppSourceBuffer)
    }

    /**
     * Removes the specified source buffer from the collection of source buffers managed by the IMFMediaSourceExtension object.
     * @param {IMFSourceBuffer} pSourceBuffer The buffer to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-removesourcebuffer
     */
    RemoveSourceBuffer(pSourceBuffer) {
        result := ComCall(9, this, "ptr", pSourceBuffer, "HRESULT")
        return result
    }

    /**
     * Indicate that the end of the media stream has been reached.
     * @param {Integer} error Used to pass error information.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-setendofstream
     */
    SetEndOfStream(error) {
        result := ComCall(10, this, "int", error, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates if the specified MIME type is supported by the media source.
     * @param {BSTR} type The media type to check support for.
     * @returns {BOOL} <b>true</b> if the media type is supported; otherwise, <b>false</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-istypesupported
     */
    IsTypeSupported(type) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(11, this, "ptr", type, "int")
        return result
    }

    /**
     * Gets the IMFSourceBuffer at the specified index in the collection of buffers.
     * @param {Integer} dwStreamIndex The location of the buffer in the colloection.
     * @returns {IMFSourceBuffer} The source buffer.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediasourceextension-getsourcebuffer
     */
    GetSourceBuffer(dwStreamIndex) {
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr")
        return result
    }
}
