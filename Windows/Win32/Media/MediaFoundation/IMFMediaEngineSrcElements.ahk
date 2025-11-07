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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLength", "GetURL", "GetType", "GetMedia", "AddElement", "RemoveAllElements"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-geturl
     */
    GetURL(index) {
        pURL := BSTR()
        result := ComCall(4, this, "uint", index, "ptr", pURL, "HRESULT")
        return pURL
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-gettype
     */
    GetType(index) {
        pType := BSTR()
        result := ComCall(5, this, "uint", index, "ptr", pType, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-getmedia
     */
    GetMedia(index) {
        pMedia := BSTR()
        result := ComCall(6, this, "uint", index, "ptr", pMedia, "HRESULT")
        return pMedia
    }

    /**
     * 
     * @param {BSTR} pURL 
     * @param {BSTR} pType 
     * @param {BSTR} pMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-addelement
     */
    AddElement(pURL, pType, pMedia) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL
        pType := pType is String ? BSTR.Alloc(pType).Value : pType
        pMedia := pMedia is String ? BSTR.Alloc(pMedia).Value : pMedia

        result := ComCall(7, this, "ptr", pURL, "ptr", pType, "ptr", pMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-removeallelements
     */
    RemoveAllElements() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
