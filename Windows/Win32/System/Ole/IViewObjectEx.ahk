#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\IViewObject2.ahk

/**
 * An extension derived from IViewObject2 to provide support for Enhanced, flicker-free drawing for non-rectangular objects and transparent objects, hit testing for non-rectangular objects, and Control sizing
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iviewobjectex
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IViewObjectEx extends IViewObject2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObjectEx
     * @type {Guid}
     */
    static IID => Guid("{3af24292-0c96-11ce-a0cf-00aa00600ab8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRect", "GetViewStatus", "QueryHitPoint", "QueryHitRect", "GetNaturalExtent"]

    /**
     * Retrieves a rectangle describing a requested drawing aspect.
     * @remarks
     * This method returns a rectangle describing the specified drawing aspect. The returned rectangle is in <b>HIMETRIC</b> units, relative to the object's origin. The rectangle returned depends on the drawing aspect as follows.
     * 
     * <table>
     * <tr>
     * <th>Drawing Aspect</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * DVASPECT_CONTENT
     * 
     * </td>
     * <td>
     * Objects should return the bounding rectangle of the whole object. The top-left corner is at the object's origin and the size is equal to the extent returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject2-getextent">IViewObject2::GetExtent</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DVASPECT_OPAQUE
     * 
     * </td>
     * <td>
     * Objects with a rectangular opaque region should return that rectangle. Others should fail and return error code DV_E_DVASPECT.
     * 
     * If a rectangle is returned, it is guaranteed to be completely obscured by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-draw">IViewObject::Draw</a> for that aspect. The container should use that rectangle to clip out the object's opaque parts before drawing any object behind it during the back to front pass. If this method fails on an object with a non-rectangular opaque region, the container should draw the entire object in the back to front part using the DVASPECT_CONTENT aspect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DVASPECT_TRANSPARENT
     * 
     * </td>
     * <td>
     * Objects should return the rectangle covering all transparent or irregular parts. If the object does not have any transparent or irregular parts, it may return DV_E_ASPECT. A container may use this rectangle to determine whether there are other objects overlapping the transparent parts of a given object.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwAspect The drawing aspect requested.
     * @returns {RECTL} A pointer to the rectangle describing the requested drawing aspect.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-getrect
     */
    GetRect(dwAspect) {
        pRect := RECTL()
        result := ComCall(10, this, "uint", dwAspect, "ptr", pRect, "HRESULT")
        return pRect
    }

    /**
     * Retrieves information about the opacity of the object, and what drawing aspects are supported.
     * @remarks
     * In order to optimize the drawing process, the container needs to be able to determine whether an object is opaque and whether it has a solid background. It is not necessary to redraw objects that are entirely covered by a completely opaque object. Other operations, such as scrolling for example, can also be highly optimized if an object is opaque and has a solid background.
     * 
     * The <b>IViewObjectEx::GetViewStatus</b> method returns whether the object is entirely opaque or not (VIEWSTATUS_OPAQUE bit) and whether its background is solid (VIEWSTATUS_SOLIDBKGND bit). This information may change in time. An object may be opaque at a given time and become totally or partially transparent later on, for example, because of a change of the BackStyle property. An object should notify its sites when it changes using <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iadvisesinkex-onviewstatuschange">IAdviseSinkEx::OnViewStatusChange</a> so the sites can cache this information for high speed access.
     * 
     * Objects not supporting <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> are considered to be always transparent.
     * 
     * The <b>IViewObjectEx::GetViewStatus</b> method also returns a combination of bits indicating which aspects are supported.
     * 
     * If a given drawing aspect is not supported, all <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> methods taking a drawing aspect as an input parameter should fail and return E_INVALIDARG. The <b>IViewObjectEx::GetViewStatus</b> method allows the container to get back information about all drawing aspects in one quick call. Normally the set of supported drawing aspects should not change with time. However, if this was not the case, an object should notify its container using <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iadvisesinkex-onviewstatuschange">IAdviseSinkEx::OnViewStatusChange</a>.
     * 
     * Which drawing aspects are supported is independent of whether the object is opaque, partially transparent, or totally transparent. In particular, a transparent object that does not support DVASPECT_TRANSPARENT should be drawn correctly during the back to front pass using DVASPECT_CONTENT. However, this is likely to result in more flicker.
     * @returns {Integer} A pointer to the view status. This information is returned as a combination of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-viewstatus">VIEWSTATUS</a> enumeration values.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-getviewstatus
     */
    GetViewStatus() {
        result := ComCall(11, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Indicates whether a point is within a given aspect of an object.
     * @remarks
     * To support hit detection on non-rectangular objects, the container needs a reliable way to ask an object 
     *      whether a given location is inside one of its drawing aspects. This function is provided by 
     *      <b>IViewObjectEx::QueryHitPoint</b>.
     * 
     * <div class="alert"><b>Note</b>  Because this method is part of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> 
     *      interface, the container can figure whether a mouse hit is over an object without having to necessarily launch 
     *      the server. If the hit happens to be inside the object, then it is likely that the object will be in-place 
     *      activated and the server started.</div>
     * <div> </div>
     * Typically, the container first quickly determines whether a given location is within the rectangular extent of 
     *      an object. If the location is within the rectangular extent of an object, the container calls 
     *      <b>IViewObjectEx::QueryHitPoint</b> to get 
     *      confirmation that the location is actually inside the object. The hit location is passed in client coordinates of 
     *      the container window. Since the object may be inactive when this method is called, the bounding rectangle of the 
     *      object in the same coordinate system is also passed to this method, similarly to what happens in 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipointerinactive-oninactivesetcursor">IPointerInactive::OnInactiveSetCursor</a>.
     * 
     * Possible returned values include:
     * 
     * <ul>
     * <li>Outside, on a transparent region</li>
     * <li>Close enough to be considered a hit (may be used by small or thin objects)</li>
     * <li>Hit</li>
     * </ul>
     * <b>IViewObjectEx::QueryHitPoint</b> is not 
     *      concerned by the sub-objects of the object it is called for. It merely indicates whether the mouse hit was within 
     *      the object or not.
     * 
     * <b>IViewObjectEx::QueryHitPoint</b> can be called 
     *      for any of the drawing aspects an object supports. It should fail if the it is not supported for the requested 
     *      drawing aspect.
     * 
     * Transparent objects may wish to implement a complex hit-detection mechanism where the user can select either 
     *      the transparent object or an object behind it, depending on where exactly the click happens inside the object. 
     *      For example, a transparent text box showing big enough text may let the user select the object behind, for 
     *      example, a bitmap, when the user clicks between the characters. For this reason, the information returned by 
     *      <b>IViewObjectEx::QueryHitPoint</b> includes 
     *      indication about whether the hit happens on an opaque or transparent region.
     * 
     * An example of non-rectangular and transparent hit detection is a transparent circle control with an object 
     *      behind it (a line in the example below):
     * 
     * :::image type="content" source="./images/a7c7fe0d-f171-4823-ba4c-b51cb90d8733.png" border="false" alt-text="Diagram of a circle with a diagonal line through it, showing the hit detection values for the areas inside and outside the circle and near the line.":::
     * 
     * The values shown are for hit tests against the circle; gray regions are not part of the control, but are shown 
     *      here to indicate an area around the image considered close. Each object implements its own definition of close 
     *      but is assisted by a hint provided by the container so that closeness can be adjusted as images zoom larger or 
     *      smaller.
     * 
     * In the picture above, the points marked Hit, Close, and Transparent would all be hits of varying strength on 
     *      the circle, with the exception of the one marked Transparent, (but for the line, close). This illustrates the 
     *      effect of the different strength of hits. Because the circle responds transparent while the line claims close, 
     *      and transparent is weaker than close, the line takes the hit.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * An object supporting <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> is required to 
     *       implement this method at least for the <b>DVASPECT_CONTENT</b> aspect. The object should 
     *       not take any other action in response to this method other than to return the information; there should be no 
     *       side-effects.
     * @param {Integer} dwAspect The requested drawing aspect.
     * @param {Pointer<RECT>} pRectBounds An object bounding rectangle in client coordinates of the containing window. This rectangle is computed and 
     *        passed by the container so that the object can meaningfully interpret the hit location.
     * @param {POINT} ptlLoc The hit location in client coordinates of the containing window.
     * @param {Integer} lCloseHint Suggested distance in <b>HIMETRIC</b> units that the container considers close. This 
     *        value is a hint, and objects can interpret it in their own way. Objects can also use this hint to roughly infer 
     *        output resolution to choose expansiveness of hit test implementation.
     * @returns {Integer} A pointer to returned information about the hit expressed as the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-hitresult">HITRESULT</a> enumeration values.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-queryhitpoint
     */
    QueryHitPoint(dwAspect, pRectBounds, ptlLoc, lCloseHint) {
        result := ComCall(12, this, "uint", dwAspect, "ptr", pRectBounds, "ptr", ptlLoc, "int", lCloseHint, "uint*", &pHitResult := 0, "HRESULT")
        return pHitResult
    }

    /**
     * Indicates whether any point in a rectangle is within a given drawing aspect of an object.
     * @remarks
     * Containers may need to test whether an object overlaps a given drawing aspect of another object. They can determine whether the objects overlap by requesting a region or at least a bounding rectangle of the aspect in question. However, a quicker way to do this is to call <b>IViewObjectEx::QueryHitRect</b> to ask the object whether a given rectangle intersects one of its drawing aspects.
     * 
     * <div class="alert"><b>Note</b>  Unlike <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iviewobjectex-queryhitpoint">IViewObjectEx::QueryHitPoint</a>, this method does not return HITRESULT_TRANSPARENT or HITRESULT_CLOSE. It is strictly hit or miss, returning HITRESULT_OUTSIDE if no point in the rectangle is hit and HITRESULT_HIT if at least one point in the rectangle is a hit.</div>
     * <div> </div>
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * An object supporting <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> is required to implement this method at least for the DVASPECT_CONTENT aspect. The object should not take any other action in response to this method other than to return the information; there should be no side-effects. If there is any ambiguity about whether a point is a hit, for instance due to coordinates not converting exactly, the object should return HITRESULT_HIT whenever any point in the rectangle might be a hit on the object. That is, it is permissible to claim a hit for a point that is not actually rendered, but never correct to claim a miss for any point that is in the rendered image of the object.
     * @param {Integer} dwAspect The requested drawing aspect.
     * @param {Pointer<RECT>} pRectBounds An object bounding rectangle in client coordinates of the containing window. This rectangle is computed and passed by the container so that the object can meaningfully interpret the hit location.
     * @param {Pointer<RECT>} pRectLoc The hit test rectangle, specified in <b>HIMETRIC</b> units, relative to the top-left corner of the object.
     * @param {Integer} lCloseHint The suggested distance, in <b>HIMETRIC</b> units, that the container considers close. This value is a hint, and objects can interpret it in their own way. Objects can also use this hint to roughly infer output resolution to choose expansiveness of hit test implementation.
     * @returns {Integer} A pointer to returned information about the hit expressed as the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-hitresult">HITRESULT</a> enumeration values.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-queryhitrect
     */
    QueryHitRect(dwAspect, pRectBounds, pRectLoc, lCloseHint) {
        result := ComCall(13, this, "uint", dwAspect, "ptr", pRectBounds, "ptr", pRectLoc, "int", lCloseHint, "uint*", &pHitResult := 0, "HRESULT")
        return pHitResult
    }

    /**
     * Provides sizing hints from the container for the object to use as the user resizes it.
     * @remarks
     * There are two general approaches to sizing a control. The first approach gives the control responsibility for sizing itself; the second approach gives the container responsibility for sizing the control. The first approach is called autosizing. There are two alternatives involved in the second approach: content sizing and integral sizing.
     * 
     * The <b>IViewObjectEx::GetNaturalExtent</b> method supports both content and integral sizing. In content sizing, the container passes the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ns-ocidl-dvextentinfo">DVEXTENTINFO</a> structure to the object into which the object returns a suggested size. In integral sizing, the container passes a preferred size to the object in <b>DVEXTENTINFO</b>, and the object actually adjusts its height. Integral sizing is used when the user rubberbands a new size in design mode.
     * 
     * Autosizing typically occurs with objects such as the Label control which resizes if the autosize property was enabled and the associated text changed. Autosizing is handled differently depending on the state of the object.
     * 
     * If the object is inactive, the following occurs:
     * 
     * <ol>
     * <li>The object calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-requestnewobjectlayout">IOleClientSite::RequestNewObjectLayout</a>.</li>
     * <li>The container calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getextent">IOleObject::GetExtent</a> and retrieves the new extents.</li>
     * <li>The container calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setextent">IOleObject::SetExtent</a> and adjusts the new extents.</li>
     * </ol>
     * If the object is active, the following occurs:
     * 
     * <ol>
     * <li>The object calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-onposrectchange">IOleInPlaceSite::OnPosRectChange</a> to specify that it requires resizing.</li>
     * <li>The container calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-setobjectrects">IOleInPlaceObject::SetObjectRects</a> and specifies the new size.</li>
     * </ol>
     * @param {Integer} dwAspect 
     * @param {Integer} lindex Indicates the portion of the object that is of interest for the draw operation. Its interpretation varies depending on the value in the <i>dwAspect</i> parameter. See the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration for more information.
     * @param {Pointer<DVTARGETDEVICE>} ptd Pointer to the target device structure that describes the device for which the object is to be rendered. If <b>NULL</b>, the view should be rendered for the default target device (typically the display). A value other than <b>NULL</b> is interpreted in conjunction with <i>hicTargetDev</i> and <b>hdcDraw</b>. For example, if <b>hdcDraw</b> specifies a printer as the device context, the <i>ptd</i> parameter points to a structure describing that printer device. The data may actually be printed if <i>hicTargetDev</i> is a valid value or it may be displayed in print preview mode if <i>hicTargetDev</i> is <b>NULL</b>.
     * @param {HDC} hicTargetDev Specifies the information context for the target device indicated by the ptd parameter from which the object can extract device metrics and test the device's capabilities. If <i>ptd</i> is <b>NULL</b>; the object should ignore the value in the <i>hicTargetDev</i> parameter.
     * @param {Pointer<DVEXTENTINFO>} pExtentInfo Pointer to <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ns-ocidl-dvextentinfo">DVEXTENTINFO</a> structure that specifies the sizing data.
     * @returns {SIZE} Pointer to sizing data returned by the object. The returned sizing data is set to -1 for any dimension that was not adjusted. That is if <b>cx</b> is -1 then the width was not adjusted, if <b>cy</b> is -1 then the height was not adjusted. If E_FAIL is returned indicating no size was adjusted then <i>pSizel</i> may be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-getnaturalextent
     */
    GetNaturalExtent(dwAspect, lindex, ptd, hicTargetDev, pExtentInfo) {
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pSizel := SIZE()
        result := ComCall(14, this, "uint", dwAspect, "int", lindex, "ptr", ptd, "ptr", hicTargetDev, "ptr", pExtentInfo, "ptr", pSizel, "HRESULT")
        return pSizel
    }
}
