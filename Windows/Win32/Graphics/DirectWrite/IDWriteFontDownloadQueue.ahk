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
     * 
     * @param {Pointer<IDWriteFontDownloadListener>} listener 
     * @param {Pointer<UInt32>} token 
     * @returns {HRESULT} 
     */
    AddListener(listener, token) {
        result := ComCall(3, this, "ptr", listener, "uint*", token, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} token 
     * @returns {HRESULT} 
     */
    RemoveListener(token) {
        result := ComCall(4, this, "uint", token, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsEmpty() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} context 
     * @returns {HRESULT} 
     */
    BeginDownload(context) {
        result := ComCall(6, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelDownload() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGenerationCount() {
        result := ComCall(8, this, "uint")
        return result
    }
}
