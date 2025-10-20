#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFileLoader.ahk

/**
 * Represents a font file loader that can access in-memory fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwriteinmemoryfontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteInMemoryFontFileLoader extends IDWriteFontFileLoader{
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
     * 
     * @param {Pointer<IDWriteFactory>} factory 
     * @param {Pointer} fontData 
     * @param {Integer} fontDataSize 
     * @param {Pointer<IUnknown>} ownerObject 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @returns {HRESULT} 
     */
    CreateInMemoryFontFileReference(factory, fontData, fontDataSize, ownerObject, fontFile) {
        result := ComCall(4, this, "ptr", factory, "ptr", fontData, "uint", fontDataSize, "ptr", ownerObject, "ptr", fontFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFileCount() {
        result := ComCall(5, this, "uint")
        return result
    }
}
