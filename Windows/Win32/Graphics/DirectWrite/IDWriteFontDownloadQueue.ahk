#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Interface that enqueues download requests for remote fonts, characters, glyphs, and font fragments.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontdownloadqueue
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontDownloadQueue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontDownloadQueue
     * @type {Guid}
     */
    static IID => Guid("{b71e6052-5aea-4fa3-832e-f60d431f7e91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddListener", "RemoveListener", "IsEmpty", "BeginDownload", "CancelDownload", "GetGenerationCount"]

    /**
     * 
     * @param {IDWriteFontDownloadListener} listener 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-addlistener
     */
    AddListener(listener) {
        result := ComCall(3, this, "ptr", listener, "uint*", &token := 0, "HRESULT")
        return token
    }

    /**
     * 
     * @param {Integer} token 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-removelistener
     */
    RemoveListener(token) {
        result := ComCall(4, this, "uint", token, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-isempty
     */
    IsEmpty() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {IUnknown} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-begindownload
     */
    BeginDownload(context) {
        result := ComCall(6, this, "ptr", context, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-canceldownload
     */
    CancelDownload() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontdownloadqueue-getgenerationcount
     */
    GetGenerationCount() {
        result := ComCall(8, this, "uint")
        return result
    }
}
