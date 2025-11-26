#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFile.ahk
#Include .\IDWriteFontFileLoader.ahk

/**
 * Represents a font file loader that can access in-memory fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwriteinmemoryfontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteInMemoryFontFileLoader extends IDWriteFontFileLoader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteInMemoryFontFileLoader
     * @type {Guid}
     */
    static IID => Guid("{dc102f47-a12d-4b1c-822d-9e117e33043f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInMemoryFontFileReference", "GetFileCount"]

    /**
     * Creates a font file reference (IDWriteFontFile object) from an array of bytes.
     * @param {IDWriteFactory} factory Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefactory">IDWriteFactory</a>*</b>
     * 
     * Factory object used to create the font file reference.
     * @param {Pointer} fontData Type: <b>void const*</b>
     * 
     * Pointer to a memory block containing the font data.
     * @param {Integer} fontDataSize Type: <b>UINT32</b>
     * 
     * Size of the font data.
     * @param {IUnknown} ownerObject Type: <b><a href="https://docs.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Optional object that owns the memory specified by the fontData parameter. If this parameter is not NULL, the method stores a
     *           pointer to the font data and adds a reference to the owner object. The fontData pointer must remain valid until the owner object is released. If
     *           this parameter is NULL, the method makes a copy of the font data.
     * @returns {IDWriteFontFile} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfile">IDWriteFontFile</a>**</b>
     * 
     * Receives a pointer to the newly-created font file reference.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteinmemoryfontfileloader-createinmemoryfontfilereference
     */
    CreateInMemoryFontFileReference(factory, fontData, fontDataSize, ownerObject) {
        result := ComCall(4, this, "ptr", factory, "ptr", fontData, "uint", fontDataSize, "ptr", ownerObject, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * Returns the number of font file references that have been created using this loader instance.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of font file references that have been created using this loader instance.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteinmemoryfontfileloader-getfilecount
     */
    GetFileCount() {
        result := ComCall(5, this, "uint")
        return result
    }
}
