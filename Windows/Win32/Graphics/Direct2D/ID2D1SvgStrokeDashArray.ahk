#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1SvgAttribute.ahk

/**
 * Interface describing an SVG stroke-dasharray value.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgstrokedasharray
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgStrokeDashArray extends ID2D1SvgAttribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1SvgStrokeDashArray
     * @type {Guid}
     */
    static IID => Guid("{f1c0ca52-92a3-4f00-b4ce-f35691efd9d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemoveDashesAtEnd", "UpdateDashes", "UpdateDashes1", "GetDashes", "GetDashes1", "GetDashesCount"]

    /**
     * 
     * @param {Integer} dashesCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgstrokedasharray-removedashesatend
     */
    RemoveDashesAtEnd(dashesCount) {
        result := ComCall(6, this, "uint", dashesCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_SVG_LENGTH>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgstrokedasharray-updatedashes-overload
     */
    UpdateDashes(dashes, dashesCount, startIndex) {
        result := ComCall(7, this, "ptr", dashes, "uint", dashesCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgstrokedasharray-updatedashes-overload
     */
    UpdateDashes1(dashes, dashesCount, startIndex) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, dashesMarshal, dashes, "uint", dashesCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_SVG_LENGTH>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgstrokedasharray-getdashes-overload
     */
    GetDashes(dashes, dashesCount, startIndex) {
        result := ComCall(9, this, "ptr", dashes, "uint", dashesCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgstrokedasharray-getdashes-overload
     */
    GetDashes1(dashes, dashesCount, startIndex) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        result := ComCall(10, this, dashesMarshal, dashes, "uint", dashesCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgstrokedasharray-getdashescount
     */
    GetDashesCount() {
        result := ComCall(11, this, "uint")
        return result
    }
}
