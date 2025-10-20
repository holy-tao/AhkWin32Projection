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
     * 
     * @returns {Integer} 
     */
    GetStartCap() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEndCap() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDashCap() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * The GetMiterLimit function retrieves the miter limit for the specified device context.
     * @returns {Float} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getmiterlimit
     */
    GetMiterLimit() {
        result := ComCall(7, this, "float")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLineJoin() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetDashOffset() {
        result := ComCall(9, this, "float")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDashStyle() {
        result := ComCall(10, this, "int")
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

    /**
     * 
     * @param {Pointer<Single>} dashes 
     * @param {Integer} dashesCount 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDashes(dashes, dashesCount) {
        ComCall(12, this, "float*", dashes, "uint", dashesCount)
        return result
    }
}
