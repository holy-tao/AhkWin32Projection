#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\IViewObject2.ahk

/**
 * An extension derived from IViewObject2 to provide support for Enhanced, flicker-free drawing for non-rectangular objects and transparent objects, hit testing for non-rectangular objects, and Control sizing
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iviewobjectex
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
     * @param {Integer} dwAspect The drawing aspect requested.
     * @returns {RECTL} A pointer to the rectangle describing the requested drawing aspect.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iviewobjectex-getrect
     */
    GetRect(dwAspect) {
        pRect := RECTL()
        result := ComCall(10, this, "uint", dwAspect, "ptr", pRect, "HRESULT")
        return pRect
    }

    /**
     * Retrieves information about the opacity of the object, and what drawing aspects are supported.
     * @returns {Integer} A pointer to the view status. This information is returned as a combination of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-viewstatus">VIEWSTATUS</a> enumeration values.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iviewobjectex-getviewstatus
     */
    GetViewStatus() {
        result := ComCall(11, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Indicates whether a point is within a given aspect of an object.
     * @param {Integer} dwAspect The requested drawing aspect.
     * @param {Pointer<RECT>} pRectBounds An object bounding rectangle in client coordinates of the containing window. This rectangle is computed and 
     *        passed by the container so that the object can meaningfully interpret the hit location.
     * @param {POINT} ptlLoc The hit location in client coordinates of the containing window.
     * @param {Integer} lCloseHint Suggested distance in <b>HIMETRIC</b> units that the container considers close. This 
     *        value is a hint, and objects can interpret it in their own way. Objects can also use this hint to roughly infer 
     *        output resolution to choose expansiveness of hit test implementation.
     * @returns {Integer} A pointer to returned information about the hit expressed as the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-hitresult">HITRESULT</a> enumeration values.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iviewobjectex-queryhitpoint
     */
    QueryHitPoint(dwAspect, pRectBounds, ptlLoc, lCloseHint) {
        result := ComCall(12, this, "uint", dwAspect, "ptr", pRectBounds, "ptr", ptlLoc, "int", lCloseHint, "uint*", &pHitResult := 0, "HRESULT")
        return pHitResult
    }

    /**
     * Indicates whether any point in a rectangle is within a given drawing aspect of an object.
     * @param {Integer} dwAspect The requested drawing aspect.
     * @param {Pointer<RECT>} pRectBounds An object bounding rectangle in client coordinates of the containing window. This rectangle is computed and passed by the container so that the object can meaningfully interpret the hit location.
     * @param {Pointer<RECT>} pRectLoc The hit test rectangle, specified in <b>HIMETRIC</b> units, relative to the top-left corner of the object.
     * @param {Integer} lCloseHint The suggested distance, in <b>HIMETRIC</b> units, that the container considers close. This value is a hint, and objects can interpret it in their own way. Objects can also use this hint to roughly infer output resolution to choose expansiveness of hit test implementation.
     * @returns {Integer} A pointer to returned information about the hit expressed as the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-hitresult">HITRESULT</a> enumeration values.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iviewobjectex-queryhitrect
     */
    QueryHitRect(dwAspect, pRectBounds, pRectLoc, lCloseHint) {
        result := ComCall(13, this, "uint", dwAspect, "ptr", pRectBounds, "ptr", pRectLoc, "int", lCloseHint, "uint*", &pHitResult := 0, "HRESULT")
        return pHitResult
    }

    /**
     * Provides sizing hints from the container for the object to use as the user resizes it.
     * @param {Integer} dwAspect 
     * @param {Integer} lindex Indicates the portion of the object that is of interest for the draw operation. Its interpretation varies depending on the value in the <i>dwAspect</i> parameter. See the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration for more information.
     * @param {Pointer<DVTARGETDEVICE>} ptd Pointer to the target device structure that describes the device for which the object is to be rendered. If <b>NULL</b>, the view should be rendered for the default target device (typically the display). A value other than <b>NULL</b> is interpreted in conjunction with <i>hicTargetDev</i> and <b>hdcDraw</b>. For example, if <b>hdcDraw</b> specifies a printer as the device context, the <i>ptd</i> parameter points to a structure describing that printer device. The data may actually be printed if <i>hicTargetDev</i> is a valid value or it may be displayed in print preview mode if <i>hicTargetDev</i> is <b>NULL</b>.
     * @param {HDC} hicTargetDev Specifies the information context for the target device indicated by the ptd parameter from which the object can extract device metrics and test the device's capabilities. If <i>ptd</i> is <b>NULL</b>; the object should ignore the value in the <i>hicTargetDev</i> parameter.
     * @param {Pointer<DVEXTENTINFO>} pExtentInfo Pointer to <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ns-ocidl-dvextentinfo">DVEXTENTINFO</a> structure that specifies the sizing data.
     * @returns {SIZE} Pointer to sizing data returned by the object. The returned sizing data is set to -1 for any dimension that was not adjusted. That is if <b>cx</b> is -1 then the width was not adjusted, if <b>cy</b> is -1 then the height was not adjusted. If E_FAIL is returned indicating no size was adjusted then <i>pSizel</i> may be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iviewobjectex-getnaturalextent
     */
    GetNaturalExtent(dwAspect, lindex, ptd, hicTargetDev, pExtentInfo) {
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pSizel := SIZE()
        result := ComCall(14, this, "uint", dwAspect, "int", lindex, "ptr", ptd, "ptr", hicTargetDev, "ptr", pExtentInfo, "ptr", pSizel, "HRESULT")
        return pSizel
    }
}
