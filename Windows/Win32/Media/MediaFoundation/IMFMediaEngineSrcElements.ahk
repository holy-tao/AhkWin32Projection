#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the Media Engine with a list of media resources.
 * @remarks
 * The <b>IMFMediaEngineSrcElements</b> interface represents an ordered list of media resources.
 * 
 * This interface enables the application to provide the same audio/video content in several different encoding formats, such as H.264 and Windows Media Video. If a particular codec is not present on the user's computer, the Media Engine will try the next URL in the list. To use this interface, do the following:
 * 
 * <ol>
 * <li>Create an implementation of this interface.</li>
 * <li>Initialize your implementation with a list of URLs. Optionally, provide MIME types and media query strings for each URL.</li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsourceelements">IMFMediaEngine::SetSourceElements</a> method.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaenginesrcelements
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineSrcElements extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineSrcElements
     * @type {Guid}
     */
    static IID := Guid("{7a5e5354-b114-4c72-b991-3131d75032ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineSrcElements interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLength         : IntPtr
        GetURL            : IntPtr
        GetType           : IntPtr
        GetMedia          : IntPtr
        AddElement        : IntPtr
        RemoveAllElements : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineSrcElements.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of source elements in the list.
     * @returns {Integer} Returns the number of source elements.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-getlength
     */
    GetLength() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Gets the URL of an element in the list.
     * @param {Integer} index The zero-based index of the source element. To get the number of source elements, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-getlength">IMFMediaEngineSrcElements::GetLength</a>.
     * @returns {BSTR} Receives a <b>BSTR</b> that contains the URL of the source element. The caller must free the  <b>BSTR</b> by calling <b>SysFreeString</b>. If no URL is set, this parameter receives the value <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-geturl
     */
    GetURL(index) {
        pURL := BSTR.Owned()
        result := ComCall(4, this, "uint", index, BSTR.Ptr, pURL, "HRESULT")
        return pURL
    }

    /**
     * Gets the MIME type of an element in the list.
     * @param {Integer} index The zero-based index of the source element. To get the number of source elements, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-getlength">IMFMediaEngineSrcElements::GetLength</a>.
     * @returns {BSTR} Receives a <b>BSTR</b> that contains the MIME type. The caller must free the  <b>BSTR</b> by calling <b>SysFreeString</b>. If no MIME type is set, this parameter receives the value <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-gettype
     */
    GetType(index) {
        pType := BSTR.Owned()
        result := ComCall(5, this, "uint", index, BSTR.Ptr, pType, "HRESULT")
        return pType
    }

    /**
     * Gets the intended media type of an element in the list.
     * @remarks
     * The string returned in <i>pMedia</i> should be a media-query string that conforms to the W3C <i>Media Queries</i> specification.
     * @param {Integer} index The zero-based index of the source element. To get the number of source elements, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-getlength">IMFMediaEngineSrcElements::GetLength</a>.
     * @returns {BSTR} Receives a <b>BSTR</b> that contains a media-query string. The caller must free the  <b>BSTR</b> by calling <b>SysFreeString</b>. If no media type is set, this parameter receives the value <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-getmedia
     */
    GetMedia(index) {
        pMedia := BSTR.Owned()
        result := ComCall(6, this, "uint", index, BSTR.Ptr, pMedia, "HRESULT")
        return pMedia
    }

    /**
     * Adds a source element to the end of the list.
     * @remarks
     * Any of the parameters to this method can be <b>NULL</b>.
     * 
     * This method allocates copies of the <b>BSTR</b>s that are passed in.
     * @param {BSTR} pURL The URL of the source element, or <b>NULL</b>.
     * @param {BSTR} pType The MIME type of the source element, or <b>NULL</b>.
     * @param {BSTR} pMedia A media-query string that specifies the intended media type, or <b>NULL</b>. If specified, the string should conform to the W3C <i>Media Queries</i> specification.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-addelement
     */
    AddElement(pURL, pType, pMedia) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL
        pType := pType is String ? BSTR.Alloc(pType).Value : pType
        pMedia := pMedia is String ? BSTR.Alloc(pMedia).Value : pMedia

        result := ComCall(7, this, BSTR, pURL, BSTR, pType, BSTR, pMedia, "HRESULT")
        return result
    }

    /**
     * Removes all of the source elements from the list.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelements-removeallelements
     */
    RemoveAllElements() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineSrcElements.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 1)
        this.vtbl.GetURL := CallbackCreate(GetMethod(implObj, "GetURL"), flags, 3)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 3)
        this.vtbl.GetMedia := CallbackCreate(GetMethod(implObj, "GetMedia"), flags, 3)
        this.vtbl.AddElement := CallbackCreate(GetMethod(implObj, "AddElement"), flags, 4)
        this.vtbl.RemoveAllElements := CallbackCreate(GetMethod(implObj, "RemoveAllElements"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetURL)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetMedia)
        CallbackFree(this.vtbl.AddElement)
        CallbackFree(this.vtbl.RemoveAllElements)
    }
}
