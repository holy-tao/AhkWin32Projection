#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<XPS_MATRIX>} matrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-getmatrix
     */
    GetMatrix(matrix) {
        result := ComCall(5, this, "ptr", matrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_MATRIX>} matrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-setmatrix
     */
    SetMatrix(matrix) {
        result := ComCall(6, this, "ptr", matrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} matrixTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsommatrixtransform-clone
     */
    Clone(matrixTransform) {
        result := ComCall(7, this, "ptr*", matrixTransform, "HRESULT")
        return result
    }
}
