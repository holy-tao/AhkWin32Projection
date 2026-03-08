#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables an object to display itself directly without passing a data object to the caller. In addition, this interface can create and manage a connection with an advise sink so the caller can be notified of changes in the view object.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-iviewobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IViewObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObject
     * @type {Guid}
     */
    static IID => Guid("{0000010d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Draw", "GetColorSet", "Freeze", "Unfreeze", "SetAdvise", "GetAdvise"]

    /**
     * Draws a representation of an object onto the specified device context.
     * @remarks
     * A container application issues a call to <b>IViewObject::Draw</b> to create a representation of a contained object. This method draws the specified piece (<i>lindex</i>) of the specified view (<i>dwAspect</i> and <i>pvAspect</i>) on the specified device context (<i>hdcDraw</i>). Formatting, fonts, and other rendering decisions are made on the basis of the target device specified by the ptd parameter.
     * 
     * There is a relationship between the <i>dwDrawAspect</i> value and the <i>lprcbounds</i> value. The <i>lprcbounds</i> value specifies the rectangle on <i>hdcDraw</i> into which the drawing is to be mapped. For <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>_THUMBNAIL, <b>DVASPECT</b>_ICON, and <b>DVASPECT</b>_SMALLICON, the object draws whatever it wants to draw, and it maps it into the space given in the best way. Some objects might scale to fit while some might scale to fit but preserve the aspect ratio. In addition, some might scale so the drawing appears at full width, but the bottom is cropped. The container can suggest a size via <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setextent">IOleObject::SetExtent</a>, but it has no control over the rendering size. In the case of <b>DVASPECT</b>_CONTENT, the <b>IViewObject::Draw</b> implementation should either use the extents given by <b>IOleObject::SetExtent</b> or use the bounding rectangle given in the <i>lprcBounds</i> parameter.
     * 
     * For newer objects that support optimized drawing techniques and for windowless objects, this method should be used as follows:
     * 
     * <ul>
     * <li>New drawing aspects are supported in <i>dwAspect</i> as defined in <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-dvaspect2">DVASPECT2</a>.</li>
     * <li>The pvAspect parameter can be used to pass additional information allowing drawing optimizations through the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ns-ocidl-dvaspectinfo">DVASPECTINFO</a> structure.</li>
     * <li>The <b>IViewObject::Draw</b> method can be called to redraw a windowless in-place active object by setting the <i>lrpcBounds</i> parameter to <b>NULL</b>. In every other situation, <b>NULL</b> is an illegal value and should result in an E_INVALIDARG error code. A windowless object uses the rectangle passed by the activation verb or calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-setobjectrects">IOleInPlaceObject::SetObjectRects</a> instead of using this parameter. If the container passes a non-<b>NULL</b> value to a windowless object, the object should render the requested aspect into the specified device context and rectangle. A container can request this from a windowless object to render a second, non-active view of the object or to print the object. See the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplacesitewindowless">IOleInPlaceSiteWindowless</a> interface for more information on drawing windowless objects.</li>
     * <li>For windowless objects, the <i>dwAspect</i> parameter only allows the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>_CONTENT, <b>DVASPECT</b>_OPAQUE, and <b>DVASPECT</b>_TRANSPARENT aspects.</li>
     * <li>For a windowless object, the hdcDraw parameter should be in MM_TEXT mapping mode with its logical coordinates matching the client coordinates of the containing window. For a windowless object, the device context should be in the same state as the one normally passed by a WM_PAINT message.</li>
     * </ul>
     * To maintain compatibility with older objects and containers that do not support drawing optimizations, all objects, rectangular or not, are required to maintain an origin and a rectangular extent. This allows the container to still consider all its embedded objects as rectangles and to pass them appropriate rendering rectangles in <b>Draw</b>.
     * 
     * An object's extent depends on the drawing aspect. For non-rectangular objects, the extent should be the size of a rectangle covering the entire aspect. By convention, the origin of an object is the top-left corner of the rectangle of the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>_CONTENT aspect. In other words, the origin always coincides with the top-left corner of the rectangle maintained by the object's site, even for a non-rectangular object.
     * @param {Integer} dwDrawAspect Specifies the aspect to be drawn, that is, how the object is to be represented. Representations include content, an icon, a thumbnail, or a printed document. Valid values are taken from the enumerations <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-dvaspect2">DVASPECT2</a>. Note that newer objects and containers that support optimized drawing interfaces support the <b>DVASPECT2</b> enumeration values. Older objects and containers that do not support optimized drawing interfaces may not support <b>DVASPECT2</b>. Windowless objects allow only <b>DVASPECT</b>_CONTENT, <b>DVASPECT</b>_OPAQUE, and <b>DVASPECT</b>_TRANSPARENT.
     * @param {Integer} lindex Portion of the object that is of interest for the draw operation. Its interpretation varies depending on the value in the dwAspect parameter. See the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration for more information.
     * @param {Pointer<Void>} pvAspect Pointer to additional information in a <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ns-ocidl-dvaspectinfo">DVASPECTINFO</a> structure that enables drawing optimizations depending on the aspect specified. Note that newer objects and containers that support optimized drawing interfaces support this parameter as well. Older objects and containers that do not support optimized drawing interfaces always specify <b>NULL</b> for this parameter.
     * @param {Pointer<DVTARGETDEVICE>} ptd Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure that describes the device for which the object is to be rendered. If <b>NULL</b>, the view should be rendered for the default target device (typically the display). A value other than <b>NULL</b> is interpreted in conjunction with <i>hdcTargetDev</i> and <i>hdcDraw</i>. For example, if <i>hdcDraw</i> specifies a printer as the device context, the <i>ptd</i> parameter points to a structure describing that printer device. The data may actually be printed if <i>hdcTargetDev</i> is a valid value or it may be displayed in print preview mode if <i>hdcTargetDev</i> is <b>NULL</b>.
     * @param {HDC} hdcTargetDev Information context for the target device indicated by the ptd parameter from which the object can extract device metrics and test the device's capabilities. If <i>ptd</i> is <b>NULL</b>; the object should ignore the value in the <i>hdcTargetDev</i> parameter.
     * @param {HDC} hdcDraw Device context on which to draw. For a windowless object, the <i>hdcDraw</i> parameter should be in MM_TEXT mapping mode with its logical coordinates matching the client coordinates of the containing window. For a windowless object, the device context should be in the same state as the one normally passed by a WM_PAINT message.
     * @param {Pointer<RECTL>} lprcBounds Pointer to a RECTL structure specifying the rectangle on <i>hdcDraw</i> and in which the object should be drawn. This parameter controls the positioning and stretching of the object. This parameter should be <b>NULL</b> to draw a windowless in-place active object. In every other situation, <b>NULL</b> is not a legal value and should result in an E_INVALIDARG error code. If the container passes a non-<b>NULL</b> value to a windowless object, the object should render the requested aspect into the specified device context and rectangle. A container can request this from a windowless object to render a second, non-active view of the object or to print the object.
     * @param {Pointer<RECTL>} lprcWBounds If <i>hdcDraw</i> is a metafile device context, pointer to a RECTL structure specifying the bounding rectangle in the underlying metafile. The rectangle structure contains the window extent and window origin. These values are useful for drawing metafiles. The rectangle indicated by <i>lprcBounds</i> is nested inside this <i>lprcWBounds</i> rectangle; they are in the same coordinate space.
     * 
     * If <i>hdcDraw</i> is not a metafile device context; <i>lprcWBounds</i> will be <b>NULL</b>.
     * @param {Pointer} pfnContinue Pointer to a callback function that the view object should call periodically during a lengthy drawing operation to determine whether the operation should continue or be canceled. This function returns <b>TRUE</b> to continue drawing. It returns <b>FALSE</b> to stop the drawing in which case <b>IViewObject::Draw</b> returns DRAW_E_ABORT.
     * @param {Pointer} dwContinue Value to pass as a parameter to the function pointed to by the <i>pfnContinue</i> parameter. Typically, <i>dwContinue</i> is a pointer to an application-defined structure needed inside the callback function.
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
     * <dt><b>OLE_E_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No data to draw from.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRAW_E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draw operation aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VIEW_E_DRAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error in drawing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_LINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid value for lindex; currently only -1 is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_DVASPECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid value for <i>dwAspect</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_INVALIDRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid rectangle.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-draw
     */
    Draw(dwDrawAspect, lindex, pvAspect, ptd, hdcTargetDev, hdcDraw, lprcBounds, lprcWBounds, pfnContinue, dwContinue) {
        hdcTargetDev := hdcTargetDev is Win32Handle ? NumGet(hdcTargetDev, "ptr") : hdcTargetDev
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hdcTargetDev, "ptr", hdcDraw, "ptr", lprcBounds, "ptr", lprcWBounds, "ptr", pfnContinue, "ptr", dwContinue, "HRESULT")
        return result
    }

    /**
     * Returns the logical palette that the object will use for drawing in its IViewObject::Draw method with the corresponding parameters.
     * @remarks
     * The <b>IViewObject::GetColorSet</b> method recursively queries any nested objects and returns a color set that represents the union of all colors requested. The color set eventually percolates to the top-level container that owns the window frame. This container can call <b>IViewObject::GetColorSet</b> on each of its embedded objects to obtain all the colors needed to draw the embedded objects. The container can use the color sets obtained in conjunction with other colors it needs for itself to set the overall color palette.
     * 
     * The OLE-provided implementation of <b>IViewObject::GetColorSet</b> looks at the data it has on hand to draw the picture. If CF_DIB is the drawing format, the palette found in the bitmap is used. For a regular bitmap, no color information is returned. If the drawing format is a metafile, the object handler enumerates the metafile looking for a CreatePalette metafile record. If one is found, the handler uses it as the color set.
     * @param {Integer} dwDrawAspect Specifies how the object is to be represented. Representations include content, an icon, a thumbnail, or a printed document. Valid values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>. See the <b>DVASPECT</b> enumeration for more information.
     * @param {Integer} lindex Portion of the object that is of interest for the draw operation. Its interpretation varies with <i>dwDrawAspect</i>. See the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration for more information.
     * @param {Pointer<Void>} pvAspect Pointer to additional information about the view of the object specified in <i>dwDrawAspect</i>. Since none of the current aspects support additional information, <i>pvAspect</i> must always be <b>NULL</b>.
     * @param {Pointer<DVTARGETDEVICE>} ptd Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure that describes the device for which the object is to be rendered. If <b>NULL</b>, the view should be rendered for the default target device (typically the display). A value other than <b>NULL</b> is interpreted in conjunction with <i>hicTargetDev</i> and <i>hdcDraw</i>. For example, if <i>hdcDraw</i> specifies a printer as the device context, ptd points to a structure describing that printer device. The data may actually be printed if <i>hicTargetDev</i> is a valid value or it may be displayed in print preview mode if <i>hicTargetDev</i> is <b>NULL</b>.
     * @param {HDC} hicTargetDev Information context for the target device indicated by the <i>ptd</i> parameter from which the object can extract device metrics and test the device's capabilities. If <i>ptd</i> is <b>NULL</b>, the object should ignore the <i>hicTargetDev</i> parameter.
     * @returns {Pointer<LOGPALETTE>} Address of LOGPALETTE pointer variable that receives a pointer to the LOGPALETTE structure. The LOGPALETTE structure contains the set of colors that would be used if <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-draw">IViewObject::Draw</a> were called with the same parameters for <i>dwAspect</i>, <i>lindex</i>, <i>pvAspect</i>, <i>ptd</i>, and <i>hicTargetDev</i>. If <i>ppColorSet</i> is <b>NULL</b>, the object does not use a palette.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-getcolorset
     */
    GetColorSet(dwDrawAspect, lindex, pvAspect, ptd, hicTargetDev) {
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hicTargetDev, "ptr*", &ppColorSet := 0, "HRESULT")
        return ppColorSet
    }

    /**
     * Freezes the drawn representation of an object so that it will not change until the IViewObject::Unfreeze method is called. The most common use of this method is for banded printing.
     * @remarks
     * The <b>IViewObject::Freeze</b> method causes the view object to freeze its drawn representation until a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-unfreeze">IViewObject::Unfreeze</a> releases it. After calling <b>IViewObject::Freeze</b>, successive calls to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-draw">IViewObject::Draw</a> with the same parameters produce the same picture until <b>IViewObject::Unfreeze</b> is called.
     * 
     * <b>IViewObject::Freeze</b> is not part of the persistent state of the object and does not continue across unloads and reloads of the object.
     * 
     * The most common use of this method is for banded printing.
     * 
     * While in a frozen state, view notifications are not sent. Pending view notifications are deferred to the subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-unfreeze">IViewObject::Unfreeze</a>.
     * @param {Integer} dwDrawAspect Specifies how the object is to be represented. Representations include content, an icon, a thumbnail, or a printed document. Valid values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>. See the <b>DVASPECT</b> enumeration for more information.
     * @param {Integer} lindex Portion of the object that is of interest for the draw operation. Its interpretation varies with dwAspect. See the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration for more information.
     * @param {Pointer<Void>} pvAspect Pointer to additional information about the view of the object specified in <i>dwAspect</i>. Since none of the current aspects support additional information, <i>pvAspect</i> must always be <b>NULL</b>.
     * @returns {Integer} Pointer to where an identifying DWORD key is returned. This unique key is later used to cancel the freeze by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-unfreeze">IViewObject::Unfreeze</a>. This key is an index that the default cache uses to keep track of which object is frozen.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-freeze
     */
    Freeze(dwDrawAspect, lindex, pvAspect) {
        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "uint*", &pdwFreeze := 0, "HRESULT")
        return pdwFreeze
    }

    /**
     * Releases a drawing that was previously frozen using IViewObject::Freeze. The most common use of this method is for banded printing.
     * @param {Integer} dwFreeze Contains a key previously returned from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-freeze">IViewObject::Freeze</a> that determines which view object to unfreeze.
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
     * <dt><b>OLE_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error in the unfreezing process or the object is currently not frozen.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-unfreeze
     */
    Unfreeze(dwFreeze) {
        result := ComCall(6, this, "uint", dwFreeze, "HRESULT")
        return result
    }

    /**
     * Establishes a connection between the view object and an advise sink so that the advise sink can be notified about changes in the object's view.
     * @remarks
     * A container application that is requesting a draw operation on a view object can also register with the <b>IViewObject::SetAdvise</b> method to be notified when the presentation of the view object changes. To find out about when an object's underlying data changes, you must call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a> separately.
     * 
     * To remove an existing advisory connection, call the <b>IViewObject::SetAdvise</b> method with <i>pAdvSink</i> set to <b>NULL</b>.
     * 
     * If the view object changes, a call is made to the appropriate advise sink through its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onviewchange">IAdviseSink::OnViewChange</a> method.
     * 
     * At any time, a given view object can support only one advisory connection. Therefore, when <b>IViewObject::SetAdvise</b> is called and the view object is already holding on to an advise sink pointer, OLE releases the existing pointer before the new one is registered.
     * @param {Integer} aspects View for which the advisory connection is being set up. Valid values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>. See the <b>DVASPECT</b> enumeration for more information.
     * @param {Integer} advf Contains a group of flags for controlling the advisory connection. Valid values are from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a>. However, only some of the possible <b>ADVF</b> values are relevant for this method. The following table briefly describes the relevant values. See the <b>ADVF</b> enumeration for a more detailed description.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADVF_ONLYONCE"></a><a id="advf_onlyonce"></a><dl>
     * <dt><b>ADVF_ONLYONCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the advisory connection to be destroyed after the first notification is sent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADVF_PRIMEFIRST"></a><a id="advf_primefirst"></a><dl>
     * <dt><b>ADVF_PRIMEFIRST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes an initial notification to be sent regardless of whether data has changed from its current state.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  The ADVF_ONLYONCE and ADVF_PRIMEFIRST can be combined to provide an asynchronous call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. </div>
     * <div> </div>
     * @param {IAdviseSink} pAdvSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface on the advisory sink that is to be informed of changes. A <b>NULL</b> value deletes any existing advisory connection.
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
     * <dt><b>OLE_E_ADVISENOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Advisory notifications are not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_DVASPECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid value for <i>dwAspect</i>.
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
     * One or more of the supplied values is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-setadvise
     */
    SetAdvise(aspects, advf, pAdvSink) {
        result := ComCall(7, this, "uint", aspects, "uint", advf, "ptr", pAdvSink, "HRESULT")
        return result
    }

    /**
     * Retrieves the advisory connection on the object that was used in the most recent call to IViewObject::SetAdvise.
     * @param {Pointer<Integer>} pAspects Pointer to where the <i>dwAspect</i> parameter from the previous <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-setadvise">IViewObject::SetAdvise</a> call is returned. If this pointer is <b>NULL</b>, the caller does not permit this value to be returned.
     * @param {Pointer<Integer>} pAdvf Pointer to where the <i>advf</i> parameter from the previous <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-setadvise">IViewObject::SetAdvise</a> call is returned. If this pointer is <b>NULL</b>, the caller does not permit this value to be returned.
     * @param {Pointer<IAdviseSink>} ppAdvSink Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> pointer variable that receives the interface pointer to the advise sink. The connection to this advise sink must have been established with a previous <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-setadvise">IViewObject::SetAdvise</a> call, which provides the <i>pAdvSink</i> parameter. If <i>ppvAdvSink</i> is <b>NULL</b>, there is no established advisory connection.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-getadvise
     */
    GetAdvise(pAspects, pAdvf, ppAdvSink) {
        pAspectsMarshal := pAspects is VarRef ? "uint*" : "ptr"
        pAdvfMarshal := pAdvf is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pAspectsMarshal, pAspects, pAdvfMarshal, pAdvf, "ptr*", ppAdvSink, "HRESULT")
        return result
    }
}
