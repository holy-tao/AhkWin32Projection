#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1SvgAttribute.ahk
#Include .\ID2D1Resource.ahk

/**
 * Interface describing an SVG attribute.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nn-d2d1svg-id2d1svgattribute
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SvgAttribute extends ID2D1Resource{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetElement", "Clone"]

    /**
     * Returns the element on which this attribute is set. Returns null if the attribute is not set on any element.
     * @param {Pointer<ID2D1SvgElement>} element Type: <b>ID2D1SvgElement**</b>
     * 
     * When this method completes, this will contain a pointer to the element on which this attribute is set.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgattribute-getelement
     */
    GetElement(element) {
        ComCall(4, this, "ptr*", element)
    }

    /**
     * Creates a clone of this attribute value. On creation, the cloned attribute is not set on any element.
     * @returns {ID2D1SvgAttribute} Type: <b>ID2D1SvgAttribute**</b>
     * 
     * Specifies the attribute value to clone.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/nf-d2d1svg-id2d1svgattribute-clone
     */
    Clone() {
        result := ComCall(5, this, "ptr*", &attribute := 0, "HRESULT")
        return ID2D1SvgAttribute(attribute)
    }
}
