#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMTileBrush.ahk

/**
 * A brush that uses a visual element as a source.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMVisualBrush        *newInterface;
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
  *     hr = xpsFactory->CreateVisualBrush (
  *         &viewBox,
  *         &viewPort,
  *         &newInterface);
  * 
  *     if (SUCCEEDED(hr))
  *     {
  *         // assign visual using one of the following:
  *         newInterface->SetVisualLocal (localVisual);
  *         // or
  *         newInterface->SetVisualLookup (visualLookupKey);
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
  * // use newInterface
  * 
  * newInterface->Release();
  * xpsFactory->Release();
  * 
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisualbrush
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMVisualBrush extends IXpsOMTileBrush{
    /**
     * The interface identifier for IXpsOMVisualBrush
     * @type {Guid}
     */
    static IID => Guid("{97e294af-5b37-46b4-8057-874d2f64119b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Pointer<IXpsOMVisual>} visual 
     * @returns {HRESULT} 
     */
    GetVisual(visual) {
        result := ComCall(18, this, "ptr", visual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMVisual>} visual 
     * @returns {HRESULT} 
     */
    GetVisualLocal(visual) {
        result := ComCall(19, this, "ptr", visual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMVisual>} visual 
     * @returns {HRESULT} 
     */
    SetVisualLocal(visual) {
        result := ComCall(20, this, "ptr", visual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lookup 
     * @returns {HRESULT} 
     */
    GetVisualLookup(lookup) {
        result := ComCall(21, this, "ptr", lookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     */
    SetVisualLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(22, this, "ptr", lookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMVisualBrush>} visualBrush 
     * @returns {HRESULT} 
     */
    Clone(visualBrush) {
        result := ComCall(23, this, "ptr", visualBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
