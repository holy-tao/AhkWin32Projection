#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsOMGradientBrush.ahk" { IXpsOMGradientBrush }
#Import ".\XPS_POINT.ahk" { XPS_POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Specifies a linear gradient, which is the color gradient along a vector.
 * @remarks
 * In the illustration that follows, the start and end points of a linear gradient are also the start and end points of the gradient path, which is the straight line that connects those points.
 * 
 * The gradient region of a linear gradient is the area between and including the start and end points and extending in both directions at a right angle to the gradient path. The spread area is the area of the geometry that lies outside the gradient region.
 * 
 * Gradient stops are used to define the color at specific locations along the gradient path. In the illustration, gradient stop 0 is located at the start point of the gradient path, and gradient stop 1 is at the end point. The <b>XPS_SPREAD_METHOD_PAD</b> spread method is used to fill the spread area.
 * 
 * <img alt="A figure that shows the terms used in a linear gradient" src="./images/LinearGradient1.png"/>
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMLinearGradientBrush    *newInterface;
 * // The following values are defined outside of 
 * // this example.
 * //  IXpsOMGradientStop       *gradStop1, *gradStop2;
 * //  XPS_POINT                startPoint, endPoint;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = xpsFactory->CreateLinearGradientBrush (
 *         gradStop1,
 *         gradStop2,
 *         &startPoint,
 *         &endPoint,
 *         &newInterface);
 * 
 *     if (SUCCEEDED(hr))
 *     {
 *         // use newInterface
 * 
 *         newInterface->Release();
 *     }
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomlineargradientbrush
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMLinearGradientBrush extends IXpsOMGradientBrush {
    /**
     * The interface identifier for IXpsOMLinearGradientBrush
     * @type {Guid}
     */
    static IID := Guid("{005e279f-c30d-40ff-93ec-1950d3c528db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMLinearGradientBrush interfaces
    */
    struct Vtbl extends IXpsOMGradientBrush.Vtbl {
        GetStartPoint : IntPtr
        SetStartPoint : IntPtr
        GetEndPoint   : IntPtr
        SetEndPoint   : IntPtr
        Clone         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMLinearGradientBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the start point of the gradient.
     * @remarks
     * The coordinates are relative to the page and are expressed in the units of the transform that is in effect.
     * @returns {XPS_POINT} The x and y coordinates of the start point.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomlineargradientbrush-getstartpoint
     */
    GetStartPoint() {
        startPoint := XPS_POINT()
        result := ComCall(17, this, XPS_POINT.Ptr, startPoint, "HRESULT")
        return startPoint
    }

    /**
     * Sets the start point of the gradient.
     * @remarks
     * The coordinates are relative to the page and are expressed in the units of the  transform that is in effect.
     * @param {Pointer<XPS_POINT>} startPoint The x and y coordinates of the start point.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The point described by <i>startPoint</i> was not valid. The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure must contain valid and finite floating-point values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>startPoint</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomlineargradientbrush-setstartpoint
     */
    SetStartPoint(startPoint) {
        result := ComCall(18, this, XPS_POINT.Ptr, startPoint, "HRESULT")
        return result
    }

    /**
     * Gets the end point of the gradient.
     * @remarks
     * The coordinates are relative to the page and are expressed in units of the transform that is in effect.
     * @returns {XPS_POINT} The x and y coordinates of the end point.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomlineargradientbrush-getendpoint
     */
    GetEndPoint() {
        endPoint := XPS_POINT()
        result := ComCall(19, this, XPS_POINT.Ptr, endPoint, "HRESULT")
        return endPoint
    }

    /**
     * Sets the end point of the gradient.
     * @remarks
     * The coordinates are relative to the page and are expressed in the units of the transform that is in effect.
     * @param {Pointer<XPS_POINT>} endPoint The x and y coordinates of the end point.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The point described by <i>endPoint</i> was not valid. The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure must contain valid and finite floating-point values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>endPoint</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomlineargradientbrush-setendpoint
     */
    SetEndPoint(endPoint) {
        result := ComCall(20, this, XPS_POINT.Ptr, endPoint, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMLinearGradientBrush.Clone)
     * @remarks
     * This method does not update any of the resource pointers in the copy.
     * @returns {IXpsOMLinearGradientBrush} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomlineargradientbrush-clone
     */
    Clone() {
        result := ComCall(21, this, "ptr*", &linearGradientBrush := 0, "HRESULT")
        return IXpsOMLinearGradientBrush(linearGradientBrush)
    }

    Query(iid) {
        if (IXpsOMLinearGradientBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStartPoint := CallbackCreate(GetMethod(implObj, "GetStartPoint"), flags, 2)
        this.vtbl.SetStartPoint := CallbackCreate(GetMethod(implObj, "SetStartPoint"), flags, 2)
        this.vtbl.GetEndPoint := CallbackCreate(GetMethod(implObj, "GetEndPoint"), flags, 2)
        this.vtbl.SetEndPoint := CallbackCreate(GetMethod(implObj, "SetEndPoint"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStartPoint)
        CallbackFree(this.vtbl.SetStartPoint)
        CallbackFree(this.vtbl.GetEndPoint)
        CallbackFree(this.vtbl.SetEndPoint)
        CallbackFree(this.vtbl.Clone)
    }
}
