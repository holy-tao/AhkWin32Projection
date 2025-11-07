#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMGeometryFigureCollection.ahk
#Include .\IXpsOMMatrixTransform.ahk
#Include .\IXpsOMGeometry.ahk
#Include .\IXpsOMShareable.ahk

/**
 * Describes the shape of a path or of a clipping region.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMGeometry    *newInterface;
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
  *     hr = xpsFactory->CreateGeometry (&newInterface);
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
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGeometry extends IXpsOMShareable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMGeometry
     * @type {Guid}
     */
    static IID => Guid("{64fcf3d7-4d58-44ba-ad73-a13af6492072}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFigures", "GetFillRule", "SetFillRule", "GetTransform", "GetTransformLocal", "SetTransformLocal", "GetTransformLookup", "SetTransformLookup", "Clone"]

    /**
     * 
     * @returns {IXpsOMGeometryFigureCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-getfigures
     */
    GetFigures() {
        result := ComCall(5, this, "ptr*", &figures := 0, "HRESULT")
        return IXpsOMGeometryFigureCollection(figures)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-getfillrule
     */
    GetFillRule() {
        result := ComCall(6, this, "int*", &fillRule := 0, "HRESULT")
        return fillRule
    }

    /**
     * 
     * @param {Integer} fillRule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-setfillrule
     */
    SetFillRule(fillRule) {
        result := ComCall(7, this, "int", fillRule, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-gettransform
     */
    GetTransform() {
        result := ComCall(8, this, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * 
     * @returns {IXpsOMMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-gettransformlocal
     */
    GetTransformLocal() {
        result := ComCall(9, this, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * 
     * @param {IXpsOMMatrixTransform} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-settransformlocal
     */
    SetTransformLocal(transform) {
        result := ComCall(10, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-gettransformlookup
     */
    GetTransformLookup() {
        result := ComCall(11, this, "ptr*", &lookup := 0, "HRESULT")
        return lookup
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-settransformlookup
     */
    SetTransformLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(12, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMGeometry} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometry-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &geometry := 0, "HRESULT")
        return IXpsOMGeometry(geometry)
    }
}
