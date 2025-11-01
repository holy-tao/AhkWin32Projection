#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextFormat2.ahk

/**
 * Describes the font and paragraph properties used to format text, and it describes locale information.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritetextformat3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextFormat3 extends IDWriteTextFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextFormat3
     * @type {Guid}
     */
    static IID => Guid("{6d3b5641-e550-430d-a85b-b7bf48a93427}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFontAxisValues", "GetFontAxisValueCount", "GetFontAxisValues", "GetAutomaticFontAxes", "SetAutomaticFontAxes"]

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-setfontaxisvalues
     */
    SetFontAxisValues(fontAxisValues, fontAxisValueCount) {
        result := ComCall(38, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-getfontaxisvaluecount
     */
    GetFontAxisValueCount() {
        result := ComCall(39, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-getfontaxisvalues
     */
    GetFontAxisValues(fontAxisValues, fontAxisValueCount) {
        result := ComCall(40, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-getautomaticfontaxes
     */
    GetAutomaticFontAxes() {
        result := ComCall(41, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} automaticFontAxes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-setautomaticfontaxes
     */
    SetAutomaticFontAxes(automaticFontAxes) {
        result := ComCall(42, this, "int", automaticFontAxes, "HRESULT")
        return result
    }
}
