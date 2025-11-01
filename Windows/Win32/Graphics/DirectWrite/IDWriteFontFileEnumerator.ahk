#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates a collection of font files. The font system uses this interface to enumerate font files when building a font collection.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontfileenumerator
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFileEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFileEnumerator
     * @type {Guid}
     */
    static IID => Guid("{72755049-5ff7-435d-8348-4be97cfa6c7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveNext", "GetCurrentFontFile"]

    /**
     * 
     * @param {Pointer<BOOL>} hasCurrentFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfileenumerator-movenext
     */
    MoveNext(hasCurrentFile) {
        result := ComCall(3, this, "ptr", hasCurrentFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfileenumerator-getcurrentfontfile
     */
    GetCurrentFontFile(fontFile) {
        result := ComCall(4, this, "ptr*", fontFile, "HRESULT")
        return result
    }
}
