#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFactory6.ahk

/**
 * This interface represents a factory object from which all DirectWrite objects are created. **IDWriteFactory7** adds new facilities for working with system fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefactory7
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFactory7 extends IDWriteFactory6{
    /**
     * The interface identifier for IDWriteFactory7
     * @type {Guid}
     */
    static IID => Guid("{35d0e0b3-9076-4d2e-a016-a91b568a06b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 55

    /**
     * 
     * @param {BOOL} includeDownloadableFonts 
     * @param {Pointer<IDWriteFontSet2>} fontSet 
     * @returns {HRESULT} 
     */
    GetSystemFontSet(includeDownloadableFonts, fontSet) {
        result := ComCall(55, this, "int", includeDownloadableFonts, "ptr", fontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} includeDownloadableFonts 
     * @param {Integer} fontFamilyModel 
     * @param {Pointer<IDWriteFontCollection3>} fontCollection 
     * @returns {HRESULT} 
     */
    GetSystemFontCollection(includeDownloadableFonts, fontFamilyModel, fontCollection) {
        result := ComCall(56, this, "int", includeDownloadableFonts, "int", fontFamilyModel, "ptr", fontCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
