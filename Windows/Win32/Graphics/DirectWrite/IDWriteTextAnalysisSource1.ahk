#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextAnalysisSource.ahk

/**
 * The interface you implement to provide needed information to the text analyzer, like the text and associated text properties.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritetextanalysissource1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalysisSource1 extends IDWriteTextAnalysisSource{
    /**
     * The interface identifier for IDWriteTextAnalysisSource1
     * @type {Guid}
     */
    static IID => Guid("{639cfad8-0fb4-4b21-a58a-067920120009}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<UInt32>} textLength 
     * @param {Pointer<Int32>} glyphOrientation 
     * @param {Pointer<Byte>} bidiLevel 
     * @returns {HRESULT} 
     */
    GetVerticalGlyphOrientation(textPosition, textLength, glyphOrientation, bidiLevel) {
        result := ComCall(8, this, "uint", textPosition, "uint*", textLength, "int*", glyphOrientation, "char*", bidiLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
