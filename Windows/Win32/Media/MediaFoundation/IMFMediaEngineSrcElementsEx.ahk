#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaEngineSrcElements.ahk" { IMFMediaEngineSrcElements }

/**
 * Extends the IMFMediaEngineSrcElements interface to provide additional capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaenginesrcelementsex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineSrcElementsEx extends IMFMediaEngineSrcElements {
    /**
     * The interface identifier for IMFMediaEngineSrcElementsEx
     * @type {Guid}
     */
    static IID := Guid("{654a6bb3-e1a3-424a-9908-53a43a0dfda0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineSrcElementsEx interfaces
    */
    struct Vtbl extends IMFMediaEngineSrcElements.Vtbl {
        AddElementEx : IntPtr
        GetKeySystem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineSrcElementsEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides an enhanced version of IMFMediaEngineSrcElements::AddElement to add the key system intended to be used with content to an element.
     * @param {BSTR} pURL The URL of the source element, or <b>NULL</b>.
     * @param {BSTR} pType The MIME type of the source element, or <b>NULL</b>.
     * @param {BSTR} pMedia A media-query string that specifies the intended media type, or <b>NULL</b>. If specified, the string should conform to the W3C <i>Media Queries</i> specification.
     * @param {BSTR} keySystem The media key session.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelementsex-addelementex
     */
    AddElementEx(pURL, pType, pMedia, keySystem) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL
        pType := pType is String ? BSTR.Alloc(pType).Value : pType
        pMedia := pMedia is String ? BSTR.Alloc(pMedia).Value : pMedia
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem

        result := ComCall(9, this, BSTR, pURL, BSTR, pType, BSTR, pMedia, BSTR, keySystem, "HRESULT")
        return result
    }

    /**
     * Gets the key system for the given source element index.
     * @param {Integer} index The source element index.
     * @returns {BSTR} The MIME type of the source element.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelementsex-getkeysystem
     */
    GetKeySystem(index) {
        pType := BSTR.Owned()
        result := ComCall(10, this, "uint", index, BSTR.Ptr, pType, "HRESULT")
        return pType
    }

    Query(iid) {
        if (IMFMediaEngineSrcElementsEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddElementEx := CallbackCreate(GetMethod(implObj, "AddElementEx"), flags, 5)
        this.vtbl.GetKeySystem := CallbackCreate(GetMethod(implObj, "GetKeySystem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddElementEx)
        CallbackFree(this.vtbl.GetKeySystem)
    }
}
