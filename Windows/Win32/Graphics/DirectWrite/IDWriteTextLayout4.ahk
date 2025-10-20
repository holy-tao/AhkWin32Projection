#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteTextLayout3.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritetextlayout4
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextLayout4 extends IDWriteTextLayout3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextLayout4
     * @type {Guid}
     */
    static IID => Guid("{05a9bf42-223f-4441-b5fb-8263685f55e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 84

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFontAxisValues", "GetFontAxisValueCount", "GetFontAxisValues", "GetAutomaticFontAxes", "SetAutomaticFontAxes"]

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetFontAxisValues(fontAxisValues, fontAxisValueCount, textRange) {
        result := ComCall(84, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @returns {Integer} 
     */
    GetFontAxisValueCount(currentPosition) {
        result := ComCall(85, this, "uint", currentPosition, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontAxisValues(currentPosition, fontAxisValues, fontAxisValueCount, textRange) {
        result := ComCall(86, this, "uint", currentPosition, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr", textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAutomaticFontAxes() {
        result := ComCall(87, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} automaticFontAxes 
     * @returns {HRESULT} 
     */
    SetAutomaticFontAxes(automaticFontAxes) {
        result := ComCall(88, this, "int", automaticFontAxes, "HRESULT")
        return result
    }
}
