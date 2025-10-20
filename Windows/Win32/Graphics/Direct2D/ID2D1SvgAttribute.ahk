#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Interface describing an SVG attribute.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgattribute
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgAttribute extends ID2D1Resource{
    /**
     * The interface identifier for ID2D1SvgAttribute
     * @type {Guid}
     */
    static IID => Guid("{c9cdb0dd-f8c9-4e70-b7c2-301c80292c5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<ID2D1SvgElement>} element 
     * @returns {String} Nothing - always returns an empty string
     */
    GetElement(element) {
        ComCall(4, this, "ptr", element)
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1SvgAttribute>} attribute 
     * @returns {HRESULT} 
     */
    Clone(attribute) {
        result := ComCall(5, this, "ptr", attribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
