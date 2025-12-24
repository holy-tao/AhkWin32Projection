#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMShareable.ahk

/**
 * Defines objects that are used to paint graphical objects. Classes that derive from IXpsOMBrush describe how the area is painted.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMBrush extends IXpsOMShareable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMBrush
     * @type {Guid}
     */
    static IID => Guid("{56a3f80c-ea4c-4187-a57b-a2a473b2b42b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOpacity", "SetOpacity"]

    /**
     * Gets the opacity of the brush.
     * @returns {Float} The opacity value of the brush.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsombrush-getopacity
     */
    GetOpacity() {
        result := ComCall(5, this, "float*", &opacity := 0, "HRESULT")
        return opacity
    }

    /**
     * Sets the opacity of the brush.
     * @param {Float} opacity The opacity value of the brush.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>opacity</i> is not a valid value. See the Remarks section.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsombrush-setopacity
     */
    SetOpacity(opacity) {
        result := ComCall(6, this, "float", opacity, "HRESULT")
        return result
    }
}
