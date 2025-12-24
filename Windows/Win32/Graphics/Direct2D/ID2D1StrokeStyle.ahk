#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Describes the caps, miter limit, line join, and dash information for a stroke.
 * @remarks
 * 
 * <h3><a id="Creating_ID2D1StrokeStyle_Objects"></a><a id="creating_id2d1strokestyle_objects"></a><a id="CREATING_ID2D1STROKESTYLE_OBJECTS"></a>Creating ID2D1StrokeStyle Objects</h3>
 * To create a stroke style, use the <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1factory-createstrokestyle">ID2D1Factory::CreateStrokeStyle</a> method.
 * 
 * A stroke style is a device-indenpendent resource; you can create it once then retain it for the life of your application. For more information about resources, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1strokestyle
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1StrokeStyle extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1StrokeStyle
     * @type {Guid}
     */
    static IID => Guid("{2cd9069d-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStartCap", "GetEndCap", "GetDashCap", "GetMiterLimit", "GetLineJoin", "GetDashOffset", "GetDashStyle", "GetDashesCount", "GetDashes"]

    /**
     * Retrieves the type of shape used at the beginning of a stroke.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The type of shape used at the beginning of a stroke.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getstartcap
     */
    GetStartCap() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Retrieves the type of shape used at the end of a stroke.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The type of shape used at the end of a stroke.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getendcap
     */
    GetEndCap() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Gets a value that specifies how the ends of each dash are drawn.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * A value that specifies how the ends of each dash are drawn.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getdashcap
     */
    GetDashCap() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * Retrieves the limit on the ratio of the miter length to half the stroke's thickness.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * A positive number greater than or equal to 1.0f that describes the limit on the ratio of the miter length to half the stroke's thickness.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getmiterlimit
     */
    GetMiterLimit() {
        result := ComCall(7, this, "float")
        return result
    }

    /**
     * Retrieves the type of joint used at the vertices of a shape's outline.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_line_join">D2D1_LINE_JOIN</a></b>
     * 
     * A value that specifies the type of joint used at the vertices of a shape's outline.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getlinejoin
     */
    GetLineJoin() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * Retrieves a value that specifies how far in the dash sequence the stroke will start.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * A value that specifies how far in the dash sequence the stroke will start.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getdashoffset
     */
    GetDashOffset() {
        result := ComCall(9, this, "float")
        return result
    }

    /**
     * Gets a value that describes the stroke's dash pattern.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_dash_style">D2D1_DASH_STYLE</a></b>
     * 
     * A value that describes the predefined dash pattern used, or <a href="/windows/win32/api/d2d1/ne-d2d1-d2d1_dash_style">D2D1_DASH_STYLE_CUSTOM</a> if a custom dash style is used.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getdashstyle
     */
    GetDashStyle() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * Retrieves the number of entries in the dashes array.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of entries in the dashes array if the stroke is dashed; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getdashescount
     */
    GetDashesCount() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * Copies the dash pattern to the specified array.
     * @remarks
     * 
     * The dashes are specified in units that are a multiple of the stroke width, with subsequent members of the array indicating the dashes and gaps between dashes: the first entry indicates a filled dash, the second a gap, and so on.
     * 
     * 
     * @param {Pointer<Float>} dashes Type: <b>FLOAT*</b>
     * 
     * A pointer to an array that will receive the dash pattern. The array must be able to contain at least as many elements as specified by <i>dashesCount</i>. You must allocate storage for this array.
     * @param {Integer} dashesCount Type: <b>UINT</b>
     * 
     * The number of dashes to copy. If this value is less than the number of dashes in the stroke style's dashes array, the returned dashes are truncated to <i>dashesCount</i>. If this value is greater than the number of dashes in the stroke style's dashes array, the extra dashes are set to 0.0f. To obtain the actual number of dashes in the stroke style's dashes array, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getdashescount">GetDashesCount</a> method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1strokestyle-getdashes
     */
    GetDashes(dashes, dashesCount) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        ComCall(12, this, dashesMarshal, dashes, "uint", dashesCount)
    }
}
