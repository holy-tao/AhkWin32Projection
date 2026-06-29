#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\XPS_MATRIX.ahk" { XPS_MATRIX }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMShareable.ahk" { IXpsOMShareable }

/**
 * Specifies an affine matrix transform that can be applied to other objects in the object model.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMMatrixTransform    *newInterface;
 * // The following value is defined outside of 
 * // this example.
 * XPS_MATRIX        newMatrix;
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
 *     hr = xpsFactory->CreateMatrixTransform (
 *         &newMatrix,
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
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMMatrixTransform extends IXpsOMShareable {
    /**
     * The interface identifier for IXpsOMMatrixTransform
     * @type {Guid}
     */
    static IID := Guid("{b77330ff-bb37-4501-a93e-f1b1e50bfc46}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMMatrixTransform interfaces
    */
    struct Vtbl extends IXpsOMShareable.Vtbl {
        GetMatrix : IntPtr
        SetMatrix : IntPtr
        Clone     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMMatrixTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the XPS_MATRIX structure, which specifies the transform matrix.
     * @returns {XPS_MATRIX} The address of a variable that receives the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_matrix">XPS_MATRIX</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-getmatrix
     */
    GetMatrix() {
        _matrix := XPS_MATRIX()
        result := ComCall(5, this, XPS_MATRIX.Ptr, _matrix, "HRESULT")
        return _matrix
    }

    /**
     * Sets the XPS_MATRIX structure, which specifies the transform matrix.
     * @param {Pointer<XPS_MATRIX>} _matrix The address of the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_matrix">XPS_MATRIX</a> structure.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>matrix</i> is <b>NULL</b>.
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
     * The matrix referenced by <i>matrix</i> is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-setmatrix
     */
    SetMatrix(_matrix) {
        result := ComCall(6, this, XPS_MATRIX.Ptr, _matrix, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMMatrixTransform.Clone)
     * @returns {IXpsOMMatrixTransform} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-clone
     */
    Clone() {
        result := ComCall(7, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IXpsOMMatrixTransform(matrixTransform)
    }

    Query(iid) {
        if (IXpsOMMatrixTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMatrix := CallbackCreate(GetMethod(implObj, "GetMatrix"), flags, 2)
        this.vtbl.SetMatrix := CallbackCreate(GetMethod(implObj, "SetMatrix"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMatrix)
        CallbackFree(this.vtbl.SetMatrix)
        CallbackFree(this.vtbl.Clone)
    }
}
