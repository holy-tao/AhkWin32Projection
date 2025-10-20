#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the Media Engine with a list of media resources.
 * @remarks
 * 
  * The <b>IMFMediaEngineSrcElements</b> interface represents an ordered list of media resources.
  * 
  * This interface enables the application to provide the same audio/video content in several different encoding formats, such as H.264 and Windows Media Video. If a particular codec is not present on the user's computer, the Media Engine will try the next URL in the list. To use this interface, do the following:
  * 
  * <ol>
  * <li>Create an implementation of this interface.</li>
  * <li>Initialize your implementation with a list of URLs. Optionally, provide MIME types and media query strings for each URL.</li>
  * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsourceelements">IMFMediaEngine::SetSourceElements</a> method.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaenginesrcelements
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineSrcElements extends IUnknown{
    /**
     * The interface identifier for IMFMediaEngineSrcElements
     * @type {Guid}
     */
    static IID => Guid("{7a5e5354-b114-4c72-b991-3131d75032ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pURL 
     * @returns {HRESULT} 
     */
    GetURL(index, pURL) {
        result := ComCall(4, this, "uint", index, "ptr", pURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pType 
     * @returns {HRESULT} 
     */
    GetType(index, pType) {
        result := ComCall(5, this, "uint", index, "ptr", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pMedia 
     * @returns {HRESULT} 
     */
    GetMedia(index, pMedia) {
        result := ComCall(6, this, "uint", index, "ptr", pMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pURL 
     * @param {BSTR} pType 
     * @param {BSTR} pMedia 
     * @returns {HRESULT} 
     */
    AddElement(pURL, pType, pMedia) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL
        pType := pType is String ? BSTR.Alloc(pType).Value : pType
        pMedia := pMedia is String ? BSTR.Alloc(pMedia).Value : pMedia

        result := ComCall(7, this, "ptr", pURL, "ptr", pType, "ptr", pMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllElements() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
