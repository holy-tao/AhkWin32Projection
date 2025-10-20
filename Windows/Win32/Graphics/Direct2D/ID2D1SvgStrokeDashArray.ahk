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
     * 
     * @param {Integer} dashesCount 
     * @returns {HRESULT} 
     */
    RemoveDashesAtEnd(dashesCount) {
        result := ComCall(6, this, "uint", dashesCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_SVG_LENGTH>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     */
    UpdateDashes(dashes, dashesCount, startIndex) {
        result := ComCall(7, this, "ptr", dashes, "uint", dashesCount, "uint", startIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     */
    UpdateDashes(dashes, dashesCount, startIndex) {
        result := ComCall(8, this, "float*", dashes, "uint", dashesCount, "uint", startIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_SVG_LENGTH>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     */
    GetDashes(dashes, dashesCount, startIndex) {
        result := ComCall(9, this, "ptr", dashes, "uint", dashesCount, "uint", startIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     */
    GetDashes(dashes, dashesCount, startIndex) {
        result := ComCall(10, this, "float*", dashes, "uint", dashesCount, "uint", startIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDashesCount() {
        result := ComCall(11, this, "uint")
        return result
    }
}
