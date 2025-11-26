#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaEngineSrcElements.ahk

/**
 * Extends the IMFMediaEngineSrcElements interface to provide additional capabilities.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaenginesrcelementsex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineSrcElementsEx extends IMFMediaEngineSrcElements{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineSrcElementsEx
     * @type {Guid}
     */
    static IID => Guid("{654a6bb3-e1a3-424a-9908-53a43a0dfda0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddElementEx", "GetKeySystem"]

    /**
     * Provides an enhanced version of IMFMediaEngineSrcElements::AddElement to add the key system intended to be used with content to an element.
     * @param {BSTR} pURL The URL of the source element, or <b>NULL</b>.
     * @param {BSTR} pType The MIME type of the source element, or <b>NULL</b>.
     * @param {BSTR} pMedia A media-query string that specifies the intended media type, or <b>NULL</b>. If specified, the string should conform to the W3C <i>Media Queries</i> specification.
     * @param {BSTR} keySystem The media key session.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelementsex-addelementex
     */
    AddElementEx(pURL, pType, pMedia, keySystem) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL
        pType := pType is String ? BSTR.Alloc(pType).Value : pType
        pMedia := pMedia is String ? BSTR.Alloc(pMedia).Value : pMedia
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem

        result := ComCall(9, this, "ptr", pURL, "ptr", pType, "ptr", pMedia, "ptr", keySystem, "HRESULT")
        return result
    }

    /**
     * Gets the key system for the given source element index.
     * @param {Integer} index The source element index.
     * @returns {BSTR} The MIME type of the source element.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaenginesrcelementsex-getkeysystem
     */
    GetKeySystem(index) {
        pType := BSTR()
        result := ComCall(10, this, "uint", index, "ptr", pType, "HRESULT")
        return pType
    }
}
