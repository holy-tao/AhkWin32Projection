#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @returns {Pointer<IMFSourceBufferList>} 
     */
    GetSourceBuffers() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<IMFSourceBufferList>} 
     */
    GetActiveSourceBuffers() {
        result := ComCall(4, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReadyState() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetDuration() {
        result := ComCall(6, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @returns {HRESULT} 
     */
    SetDuration(duration) {
        result := ComCall(7, this, "double", duration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {Pointer<IMFSourceBufferNotify>} pNotify 
     * @param {Pointer<IMFSourceBuffer>} ppSourceBuffer 
     * @returns {HRESULT} 
     */
    AddSourceBuffer(type, pNotify, ppSourceBuffer) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(8, this, "ptr", type, "ptr", pNotify, "ptr", ppSourceBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFSourceBuffer>} pSourceBuffer 
     * @returns {HRESULT} 
     */
    RemoveSourceBuffer(pSourceBuffer) {
        result := ComCall(9, this, "ptr", pSourceBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} error 
     * @returns {HRESULT} 
     */
    SetEndOfStream(error) {
        result := ComCall(10, this, "int", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @returns {BOOL} 
     */
    IsTypeSupported(type) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(11, this, "ptr", type, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {Pointer<IMFSourceBuffer>} 
     */
    GetSourceBuffer(dwStreamIndex) {
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr")
        return result
    }
}
