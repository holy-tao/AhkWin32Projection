#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IOleWindow.ahk

/**
 * Implemented by container applications and used by object applications to negotiate border space on the document or frame window.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplaceuiwindow
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceUIWindow extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceUIWindow
     * @type {Guid}
     */
    static IID => Guid("{00000115-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBorder", "RequestBorderSpace", "SetBorderSpace", "SetActiveObject"]

    /**
     * Retrieves the outer rectange for toolbars and controls while the object is active in place.
     * @returns {RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure where the outer rectangle is to be returned. The structure's coordinates are relative to the window being represented by the interface.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceuiwindow-getborder
     */
    GetBorder() {
        lprectBorder := RECT()
        result := ComCall(5, this, "ptr", lprectBorder, "HRESULT")
        return lprectBorder
    }

    /**
     * Determines whether there is space available for tools to be installed around the object's window frame while the object is active in place.
     * @param {Pointer<RECT>} pborderwidths A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure containing the requested widths (in pixels) needed on each side of the window for the tools.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>INPLACE_E_NOTOOLSPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object cannot install toolbars in this window object because the implementation does not support toolbars, or there is insufficient space to install the toolbars.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceuiwindow-requestborderspace
     */
    RequestBorderSpace(pborderwidths) {
        result := ComCall(6, this, "ptr", pborderwidths, "HRESULT")
        return result
    }

    /**
     * Allocates space for the border requested in the call to IOleInPlaceUIWindow::RequestBorderSpace.
     * @param {Pointer<RECT>} pborderwidths Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure containing the requested width of the tools, in pixels. It can be <b>NULL</b>, indicating the object does not need any space.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_INVALIDRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rectangle does not lie within the specifications returned by <a href="/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-getborder">IOleInPlaceUIWindow::GetBorder</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceuiwindow-setborderspace
     */
    SetBorderSpace(pborderwidths) {
        result := ComCall(7, this, "ptr", pborderwidths, "HRESULT")
        return result
    }

    /**
     * Provides a direct channel of communication between the object and each of the frame and document windows.
     * @param {IOleInPlaceActiveObject} pActiveObject A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceactiveobject">IOleInPlaceActiveObject</a> interface on the active in-place object.
     * @param {PWSTR} pszObjName A pointer to a string containing a name that describes the object an embedding container can use in composing its window title. It can be <b>NULL</b> if the object does not require the container to change its window titles. Containers should ignore this parameter and always use their own name in the title bar.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceuiwindow-setactiveobject
     */
    SetActiveObject(pActiveObject, pszObjName) {
        pszObjName := pszObjName is String ? StrPtr(pszObjName) : pszObjName

        result := ComCall(8, this, "ptr", pActiveObject, "ptr", pszObjName, "HRESULT")
        return result
    }
}
