#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XPS_MATRIX.ahk
#Include .\IXpsOMMatrixTransform.ahk
#Include .\IXpsOMShareable.ahk

/**
 * Specifies an affine matrix transform that can be applied to other objects in the object model.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMMatrixTransform extends IXpsOMShareable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMMatrixTransform
     * @type {Guid}
     */
    static IID => Guid("{b77330ff-bb37-4501-a93e-f1b1e50bfc46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMatrix", "SetMatrix", "Clone"]

    /**
     * Gets the XPS_MATRIX structure, which specifies the transform matrix.
     * @returns {XPS_MATRIX} The address of a variable that receives the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_matrix">XPS_MATRIX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-getmatrix
     */
    GetMatrix() {
        matrix := XPS_MATRIX()
        result := ComCall(5, this, "ptr", matrix, "HRESULT")
        return matrix
    }

    /**
     * Sets the XPS_MATRIX structure, which specifies the transform matrix.
     * @param {Pointer<XPS_MATRIX>} matrix The address of the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_matrix">XPS_MATRIX</a> structure.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-setmatrix
     */
    SetMatrix(matrix) {
        result := ComCall(6, this, "ptr", matrix, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMMatrixTransform} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-clone
     */
    Clone() {
        result := ComCall(7, this, "ptr*", &matrixTransform := 0, "HRESULT")
        return IXpsOMMatrixTransform(matrixTransform)
    }
}
