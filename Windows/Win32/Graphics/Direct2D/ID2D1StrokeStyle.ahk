#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_DASH_STYLE.ahk" { D2D1_DASH_STYLE }
#Import ".\D2D1_CAP_STYLE.ahk" { D2D1_CAP_STYLE }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }
#Import ".\D2D1_LINE_JOIN.ahk" { D2D1_LINE_JOIN }

/**
 * Describes the caps, miter limit, line join, and dash information for a stroke. (ID2D1StrokeStyle)
 * @remarks
 * <h3><a id="Creating_ID2D1StrokeStyle_Objects"></a><a id="creating_id2d1strokestyle_objects"></a><a id="CREATING_ID2D1STROKESTYLE_OBJECTS"></a>Creating ID2D1StrokeStyle Objects</h3>
 * To create a stroke style, use the <a href="https://docs.microsoft.com/windows/win32/Direct2D/id2d1factory-createstrokestyle">ID2D1Factory::CreateStrokeStyle</a> method.
 * 
 * A stroke style is a device-independent resource; you can create it once then retain it for the life of your application. For more information about resources, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1strokestyle
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1StrokeStyle extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1StrokeStyle
     * @type {Guid}
     */
    static IID := Guid("{2cd9069d-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1StrokeStyle interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        GetStartCap    : IntPtr
        GetEndCap      : IntPtr
        GetDashCap     : IntPtr
        GetMiterLimit  : IntPtr
        GetLineJoin    : IntPtr
        GetDashOffset  : IntPtr
        GetDashStyle   : IntPtr
        GetDashesCount : IntPtr
        GetDashes      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1StrokeStyle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the type of shape used at the beginning of a stroke.
     * @returns {D2D1_CAP_STYLE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The type of shape used at the beginning of a stroke.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getstartcap
     */
    GetStartCap() {
        result := ComCall(4, this, D2D1_CAP_STYLE)
        return result
    }

    /**
     * Retrieves the type of shape used at the end of a stroke.
     * @returns {D2D1_CAP_STYLE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The type of shape used at the end of a stroke.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getendcap
     */
    GetEndCap() {
        result := ComCall(5, this, D2D1_CAP_STYLE)
        return result
    }

    /**
     * Gets a value that specifies how the ends of each dash are drawn.
     * @returns {D2D1_CAP_STYLE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * A value that specifies how the ends of each dash are drawn.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getdashcap
     */
    GetDashCap() {
        result := ComCall(6, this, D2D1_CAP_STYLE)
        return result
    }

    /**
     * Retrieves the limit on the ratio of the miter length to half the stroke's thickness.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * A positive number greater than or equal to 1.0f that describes the limit on the ratio of the miter length to half the stroke's thickness.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getmiterlimit
     */
    GetMiterLimit() {
        result := ComCall(7, this, Float32)
        return result
    }

    /**
     * Retrieves the type of joint used at the vertices of a shape's outline.
     * @returns {D2D1_LINE_JOIN} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_line_join">D2D1_LINE_JOIN</a></b>
     * 
     * A value that specifies the type of joint used at the vertices of a shape's outline.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getlinejoin
     */
    GetLineJoin() {
        result := ComCall(8, this, D2D1_LINE_JOIN)
        return result
    }

    /**
     * Retrieves a value that specifies how far in the dash sequence the stroke will start.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * A value that specifies how far in the dash sequence the stroke will start.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getdashoffset
     */
    GetDashOffset() {
        result := ComCall(9, this, Float32)
        return result
    }

    /**
     * Gets a value that describes the stroke's dash pattern.
     * @remarks
     * If a custom dash style is specified, the dash pattern is described by the dashes array, which can be retrieved by calling the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getdashes">GetDashes</a> method.
     * @returns {D2D1_DASH_STYLE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_dash_style">D2D1_DASH_STYLE</a></b>
     * 
     * A value that describes the predefined dash pattern used, or <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_dash_style">D2D1_DASH_STYLE_CUSTOM</a> if a custom dash style is used.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getdashstyle
     */
    GetDashStyle() {
        result := ComCall(10, this, D2D1_DASH_STYLE)
        return result
    }

    /**
     * Retrieves the number of entries in the dashes array.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of entries in the dashes array if the stroke is dashed; otherwise, 0.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getdashescount
     */
    GetDashesCount() {
        result := ComCall(11, this, UInt32)
        return result
    }

    /**
     * Copies the dash pattern to the specified array.
     * @remarks
     * The dashes are specified in units that are a multiple of the stroke width, with subsequent members of the array indicating the dashes and gaps between dashes: the first entry indicates a filled dash, the second a gap, and so on.
     * @param {Pointer<Float>} dashes Type: <b>FLOAT*</b>
     * 
     * A pointer to an array that will receive the dash pattern. The array must be able to contain at least as many elements as specified by <i>dashesCount</i>. You must allocate storage for this array.
     * @param {Integer} dashesCount Type: <b>UINT</b>
     * 
     * The number of dashes to copy. If this value is less than the number of dashes in the stroke style's dashes array, the returned dashes are truncated to <i>dashesCount</i>. If this value is greater than the number of dashes in the stroke style's dashes array, the extra dashes are set to 0.0f. To obtain the actual number of dashes in the stroke style's dashes array, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getdashescount">GetDashesCount</a> method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1strokestyle-getdashes
     */
    GetDashes(dashes, dashesCount) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        ComCall(12, this, dashesMarshal, dashes, "uint", dashesCount)
    }

    Query(iid) {
        if (ID2D1StrokeStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStartCap := CallbackCreate(GetMethod(implObj, "GetStartCap"), flags, 1)
        this.vtbl.GetEndCap := CallbackCreate(GetMethod(implObj, "GetEndCap"), flags, 1)
        this.vtbl.GetDashCap := CallbackCreate(GetMethod(implObj, "GetDashCap"), flags, 1)
        this.vtbl.GetMiterLimit := CallbackCreate(GetMethod(implObj, "GetMiterLimit"), flags, 1)
        this.vtbl.GetLineJoin := CallbackCreate(GetMethod(implObj, "GetLineJoin"), flags, 1)
        this.vtbl.GetDashOffset := CallbackCreate(GetMethod(implObj, "GetDashOffset"), flags, 1)
        this.vtbl.GetDashStyle := CallbackCreate(GetMethod(implObj, "GetDashStyle"), flags, 1)
        this.vtbl.GetDashesCount := CallbackCreate(GetMethod(implObj, "GetDashesCount"), flags, 1)
        this.vtbl.GetDashes := CallbackCreate(GetMethod(implObj, "GetDashes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStartCap)
        CallbackFree(this.vtbl.GetEndCap)
        CallbackFree(this.vtbl.GetDashCap)
        CallbackFree(this.vtbl.GetMiterLimit)
        CallbackFree(this.vtbl.GetLineJoin)
        CallbackFree(this.vtbl.GetDashOffset)
        CallbackFree(this.vtbl.GetDashStyle)
        CallbackFree(this.vtbl.GetDashesCount)
        CallbackFree(this.vtbl.GetDashes)
    }
}
