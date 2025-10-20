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
     * 
     * @param {Pointer<XPS_MATRIX>} matrix 
     * @returns {HRESULT} 
     */
    GetMatrix(matrix) {
        result := ComCall(5, this, "ptr", matrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_MATRIX>} matrix 
     * @returns {HRESULT} 
     */
    SetMatrix(matrix) {
        result := ComCall(6, this, "ptr", matrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} matrixTransform 
     * @returns {HRESULT} 
     */
    Clone(matrixTransform) {
        result := ComCall(7, this, "ptr", matrixTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
