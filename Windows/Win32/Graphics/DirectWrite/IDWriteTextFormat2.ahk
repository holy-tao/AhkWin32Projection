#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_LINE_SPACING.ahk
#Include .\IDWriteTextFormat1.ahk

/**
 * Describes the font and paragraph properties used to format text, and it describes locale information.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritetextformat2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextFormat2 extends IDWriteTextFormat1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextFormat2
     * @type {Guid}
     */
    static IID => Guid("{f67e0edd-9e3d-4ecc-8c32-4183253dfe70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLineSpacing", "GetLineSpacing"]

    /**
     * 
     * @param {Pointer<DWRITE_LINE_SPACING>} lineSpacingOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritetextformat2-setlinespacing
     */
    SetLineSpacing(lineSpacingOptions) {
        result := ComCall(36, this, "ptr", lineSpacingOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DWRITE_LINE_SPACING} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat2-getlinespacing
     */
    GetLineSpacing() {
        lineSpacingOptions := DWRITE_LINE_SPACING()
        result := ComCall(37, this, "ptr", lineSpacingOptions, "HRESULT")
        return lineSpacingOptions
    }
}
