#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IOleWindow.ahk

/**
 * Implemented by container applications and used by object applications to negotiate border space on the document or frame window.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-ioleinplaceuiwindow
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
     * Retrieves the outer rectangle for toolbars and controls while the object is active in place.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The <b>IOleInPlaceUIWindow::GetBorder</b> function, when called on a document or frame window object, returns the outer rectangle (relative to the window) where the object can put toolbars or similar controls.
     * 
     * If the object is to install these tools, it should negotiate space for the tools within this rectangle using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-requestborderspace">IOleInPlaceUIWindow::RequestBorderSpace</a> and then call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-setborderspace">IOleInPlaceUIWindow::SetBorderSpace</a> to get this space allocated.
     * 
     * <div class="alert"><b>Note</b>  While executing <b>IOleInPlaceUIWindow::GetBorder</b>, do not make calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> functions, or a dialog box. Doing so may cause the system to deadlock. There are further restrictions on which OLE interface methods and functions can be called from within <b>GetBorder</b>.</div>
     * <div> </div>
     * @returns {RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure where the outer rectangle is to be returned. The structure's coordinates are relative to the window being represented by the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceuiwindow-getborder
     */
    GetBorder() {
        lprectBorder := RECT()
        result := ComCall(5, this, "ptr", lprectBorder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lprectBorder
    }

    /**
     * Determines whether there is space available for tools to be installed around the object's window frame while the object is active in place.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The active in-place object calls <b>IOleInPlaceUIWindow::RequestBorderSpace</b> to ask if tools can be installed inside the window frame. These tools would be allocated between the rectangle returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-getborder">IOleInPlaceUIWindow::GetBorder</a> and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure specified in the argument to this call.
     * 
     * The space for the tools is not actually allocated to the object until it calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-setborderspace">IOleInPlaceUIWindow::SetBorderSpace</a>, allowing the object to negotiate for space (such as while dragging toolbars around), but deferring the moving of tools until the action is completed.
     * 
     * The object can install these tools by passing the width in pixels that is to be used on each side. For example, if the object required 10 pixels on the top, 0 pixels on the bottom, and 5 pixels on the left and right sides, it would pass the following <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure to <b>IOleInPlaceUIWindow::RequestBorderSpace</b>:
     * 
     * 
     * ``` syntax
     * lpbw-&gt;top    = 10 
     * lpbw-&gt;bottom =  0 
     * lpbw-&gt;lLeft  =  5 
     * lpbw-&gt;right  =  5 
     * ```
     * 
     * <div class="alert"><b>Note</b>  While executing <b>IOleInPlaceUIWindow::RequestBorderSpace</b>, do not make calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> functions, or a dialog box. Doing so may cause the system to deadlock. There are further restrictions on which OLE interface methods and functions can be called from within <b>IOleInPlaceUIWindow::RequestBorderSpace</b>.</div>
     * <div> </div>
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the amount of space an active object uses for its toolbars is irrelevant to the container, it can simply return NOERROR as shown in the following <b>IOleInPlaceUIWindow::RequestBorderSpace</b> example. Containers should not unduly restrict the display of tools by an active in-place object.
     * 
     * 
     * ``` syntax
     * HRESULT InPlaceUIWindow_RequestBorderSpace( 
     *     IOleInPlaceFrame *  lpThis, 
     *     LPCBORDERWIDTHS     pborderwidths) 
     * { 
     *     // Container allows the object to have as much border space as it 
     *     // wants.  
     *     return NOERROR; 
     * } 
     * ```
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceuiwindow-requestborderspace
     */
    RequestBorderSpace(pborderwidths) {
        result := ComCall(6, this, "ptr", pborderwidths, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allocates space for the border requested in the call to IOleInPlaceUIWindow::RequestBorderSpace.
     * @remarks
     * The object must call <b>IOleInPlaceUIWindow::SetBorderSpace</b>. It can do any one of the following:
     * 
     * <ul>
     * <li>Use its own toolbars, requesting border space of a specific size.</li>
     * <li>Use no toolbars, but force the container to remove its toolbars by passing a valid <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure containing nothing but zeros in the <i>pborderwidths</i> parameter.</li>
     * <li>Use no toolbars but allow the in-place container to leave its toolbars up by passing <b>NULL</b> as the <i>pborderwidths</i> parameter.</li>
     * </ul>
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure used in this call would generally have been passed in a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-requestborderspace">IOleInPlaceUIWindow::RequestBorderSpace</a>, which must have returned S_OK.
     * 
     * If an object must renegotiate space on the border, it can call <b>IOleInPlaceUIWindow::SetBorderSpace</b> again with the new widths. If the call to <b>IOleInPlaceUIWindow::SetBorderSpace</b> fails, the object can do a full negotiation for border space with calls to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-getborder">IOleInPlaceUIWindow::GetBorder</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-requestborderspace">IOleInPlaceUIWindow::RequestBorderSpace</a>, and <b>IOleInPlaceUIWindow::SetBorderSpace</b>.
     * 
     * <div class="alert"><b>Note</b>  While executing <b>IOleInPlaceUIWindow::SetBorderSpace</b>, do not make calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> functions, or a dialog box. Doing so may cause the system to deadlock. There are further restrictions on which OLE interface methods and functions can be called from within <b>IOleInPlaceUIWindow::SetBorderSpace</b>.</div>
     * <div> </div>
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
     * The rectangle does not lie within the specifications returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-getborder">IOleInPlaceUIWindow::GetBorder</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceuiwindow-setborderspace
     */
    SetBorderSpace(pborderwidths) {
        result := ComCall(7, this, "ptr", pborderwidths, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides a direct channel of communication between the object and each of the frame and document windows.
     * @remarks
     * Generally, an embedded object should pass <b>NULL</b> for the <i>pszObjName</i> parameter (see Notes to Implementers below). However, if you are working in conjunction with a container that does display the name of the in-place active object in its title bar, then you should compose a string in the following form: &lt;<i>application name</i>&gt; – &lt;<i>object short-type name</i>&gt;.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * <b>IOleInPlaceUIWindow::SetActiveObject</b> is called by the object to establish a direct communication link between itself and the document and frame windows.
     * 
     * When deactivating, the object calls <b>IOleInPlaceUIWindow::SetActiveObject</b>, passing <b>NULL</b> for the <i>pActiveObject</i> and pszObjName parameters.
     * 
     * An object must call <b>IOleInPlaceUIWindow::SetActiveObject</b> before calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-setmenu">IOleInPlaceFrame::SetMenu</a> to give the container the pointer to the active object. The container then uses this pointer in processing <b>IOleInPlaceFrame::SetMenu</b> and to pass to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetmenudescriptor">OleSetMenuDescriptor</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The Microsoft Windows User Interface Design Guide recommends that an in-place container ignore the <i>pszObjName</i> parameter passed in this method. The guide says "The title bar is not affected by in-place activation. It always displays the top-level container's name."
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceuiwindow-setactiveobject
     */
    SetActiveObject(pActiveObject, pszObjName) {
        pszObjName := pszObjName is String ? StrPtr(pszObjName) : pszObjName

        result := ComCall(8, this, "ptr", pActiveObject, "ptr", pszObjName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
