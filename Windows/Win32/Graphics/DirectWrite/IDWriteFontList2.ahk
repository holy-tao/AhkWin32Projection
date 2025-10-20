#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontList1.ahk

/**
 * Represents a list of fonts. **IDWriteFontList2** adds new facilities, including retrieving the underlying font set used by the list.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontlist2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontList2 extends IDWriteFontList1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontList2
     * @type {Guid}
     */
    static IID => Guid("{c0763a34-77af-445a-b735-08c37b0a5bf5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontSet"]

    /**
     * 
     * @param {Pointer<IDWriteFontSet1>} fontSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontlist2-getfontset
     */
    GetFontSet(fontSet) {
        result := ComCall(9, this, "ptr*", fontSet, "HRESULT")
        return result
    }
}
