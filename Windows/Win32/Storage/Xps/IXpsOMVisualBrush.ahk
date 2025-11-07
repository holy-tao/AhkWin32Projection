#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMVisual.ahk
#Include .\IXpsOMVisualBrush.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVisual", "GetVisualLocal", "SetVisualLocal", "GetVisualLookup", "SetVisualLookup", "Clone"]

    /**
     * 
     * @returns {IXpsOMVisual} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualbrush-getvisual
     */
    GetVisual() {
        result := ComCall(18, this, "ptr*", &visual := 0, "HRESULT")
        return IXpsOMVisual(visual)
    }

    /**
     * 
     * @returns {IXpsOMVisual} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualbrush-getvisuallocal
     */
    GetVisualLocal() {
        result := ComCall(19, this, "ptr*", &visual := 0, "HRESULT")
        return IXpsOMVisual(visual)
    }

    /**
     * 
     * @param {IXpsOMVisual} visual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualbrush-setvisuallocal
     */
    SetVisualLocal(visual) {
        result := ComCall(20, this, "ptr", visual, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualbrush-getvisuallookup
     */
    GetVisualLookup() {
        result := ComCall(21, this, "ptr*", &lookup := 0, "HRESULT")
        return lookup
    }

    /**
     * 
     * @param {PWSTR} lookup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualbrush-setvisuallookup
     */
    SetVisualLookup(lookup) {
        lookup := lookup is String ? StrPtr(lookup) : lookup

        result := ComCall(22, this, "ptr", lookup, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMVisualBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualbrush-clone
     */
    Clone() {
        result := ComCall(23, this, "ptr*", &visualBrush := 0, "HRESULT")
        return IXpsOMVisualBrush(visualBrush)
    }
}
