#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMBrush.ahk

/**
 * A single-color brush.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMSolidColorBrush             *newInterface;
  * // The following values are defined outside of 
  * // this example.
  * //  XPS_COLOR                     color;
  * //  IXpsOMColorProfileResource    *colorProfile;
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
  *     hr = xpsFactory->CreateSolidColorBrush (
  *         &color,
  *         colorProfile,
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
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomsolidcolorbrush
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMSolidColorBrush extends IXpsOMBrush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMSolidColorBrush
     * @type {Guid}
     */
    static IID => Guid("{a06f9f05-3be9-4763-98a8-094fc672e488}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColor", "SetColor", "Clone"]

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {Pointer<IXpsOMColorProfileResource>} colorProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsolidcolorbrush-getcolor
     */
    GetColor(color, colorProfile) {
        result := ComCall(7, this, "ptr", color, "ptr*", colorProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_COLOR>} color 
     * @param {IXpsOMColorProfileResource} colorProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsolidcolorbrush-setcolor
     */
    SetColor(color, colorProfile) {
        result := ComCall(8, this, "ptr", color, "ptr", colorProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMSolidColorBrush>} solidColorBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsolidcolorbrush-clone
     */
    Clone(solidColorBrush) {
        result := ComCall(9, this, "ptr*", solidColorBrush, "HRESULT")
        return result
    }
}
