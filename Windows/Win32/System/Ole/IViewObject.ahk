#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables an object to display itself directly without passing a data object to the caller. In addition, this interface can create and manage a connection with an advise sink so the caller can be notified of changes in the view object.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iviewobject
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iviewobject-draw
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
     * @param {Integer} dwDrawAspect Specifies how the object is to be represented. Representations include content, an icon, a thumbnail, or a printed document. Valid values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>. See the <b>DVASPECT</b> enumeration for more information.
     * @param {Integer} lindex Portion of the object that is of interest for the draw operation. Its interpretation varies with <i>dwDrawAspect</i>. See the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration for more information.
     * @param {Pointer<Void>} pvAspect Pointer to additional information about the view of the object specified in <i>dwDrawAspect</i>. Since none of the current aspects support additional information, <i>pvAspect</i> must always be <b>NULL</b>.
     * @param {Pointer<DVTARGETDEVICE>} ptd Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure that describes the device for which the object is to be rendered. If <b>NULL</b>, the view should be rendered for the default target device (typically the display). A value other than <b>NULL</b> is interpreted in conjunction with <i>hicTargetDev</i> and <i>hdcDraw</i>. For example, if <i>hdcDraw</i> specifies a printer as the device context, ptd points to a structure describing that printer device. The data may actually be printed if <i>hicTargetDev</i> is a valid value or it may be displayed in print preview mode if <i>hicTargetDev</i> is <b>NULL</b>.
     * @param {HDC} hicTargetDev Information context for the target device indicated by the <i>ptd</i> parameter from which the object can extract device metrics and test the device's capabilities. If <i>ptd</i> is <b>NULL</b>, the object should ignore the <i>hicTargetDev</i> parameter.
     * @returns {Pointer<LOGPALETTE>} Address of LOGPALETTE pointer variable that receives a pointer to the LOGPALETTE structure. The LOGPALETTE structure contains the set of colors that would be used if <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-draw">IViewObject::Draw</a> were called with the same parameters for <i>dwAspect</i>, <i>lindex</i>, <i>pvAspect</i>, <i>ptd</i>, and <i>hicTargetDev</i>. If <i>ppColorSet</i> is <b>NULL</b>, the object does not use a palette.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iviewobject-getcolorset
     */
    GetColorSet(dwDrawAspect, lindex, pvAspect, ptd, hicTargetDev) {
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hicTargetDev, "ptr*", &ppColorSet := 0, "HRESULT")
        return ppColorSet
    }

    /**
     * Freezes the drawn representation of an object so that it will not change until the IViewObject::Unfreeze method is called. The most common use of this method is for banded printing.
     * @param {Integer} dwDrawAspect Specifies how the object is to be represented. Representations include content, an icon, a thumbnail, or a printed document. Valid values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>. See the <b>DVASPECT</b> enumeration for more information.
     * @param {Integer} lindex Portion of the object that is of interest for the draw operation. Its interpretation varies with dwAspect. See the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration for more information.
     * @param {Pointer<Void>} pvAspect Pointer to additional information about the view of the object specified in <i>dwAspect</i>. Since none of the current aspects support additional information, <i>pvAspect</i> must always be <b>NULL</b>.
     * @returns {Integer} Pointer to where an identifying DWORD key is returned. This unique key is later used to cancel the freeze by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-unfreeze">IViewObject::Unfreeze</a>. This key is an index that the default cache uses to keep track of which object is frozen.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iviewobject-freeze
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iviewobject-unfreeze
     */
    Unfreeze(dwFreeze) {
        result := ComCall(6, this, "uint", dwFreeze, "HRESULT")
        return result
    }

    /**
     * Establishes a connection between the view object and an advise sink so that the advise sink can be notified about changes in the object's view.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iviewobject-setadvise
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iviewobject-getadvise
     */
    GetAdvise(pAspects, pAdvf, ppAdvSink) {
        pAspectsMarshal := pAspects is VarRef ? "uint*" : "ptr"
        pAdvfMarshal := pAdvf is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pAspectsMarshal, pAspects, pAdvfMarshal, pAdvf, "ptr*", ppAdvSink, "HRESULT")
        return result
    }
}
