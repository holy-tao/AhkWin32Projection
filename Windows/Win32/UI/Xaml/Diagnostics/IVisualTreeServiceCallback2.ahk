#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IVisualTreeServiceCallback.ahk

/**
 * Represents additional capabilities of an IVisualTreeServiceCallback object.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/nn-xamlom-ivisualtreeservicecallback2
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class IVisualTreeServiceCallback2 extends IVisualTreeServiceCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualTreeServiceCallback2
     * @type {Guid}
     */
    static IID => Guid("{bad9eb88-ae77-4397-b948-5fa2db0a19ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnElementStateChanged"]

    /**
     * Communicates the state of an element in the visual tree when it changes.
     * @param {Integer} element The XAML element in the visual tree.
     * @param {Integer} elementState The state of the element.
     * @param {PWSTR} context The path to the element.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xamlom/nf-xamlom-ivisualtreeservicecallback2-onelementstatechanged
     */
    OnElementStateChanged(element, elementState, context) {
        context := context is String ? StrPtr(context) : context

        result := ComCall(4, this, "uint", element, "int", elementState, "ptr", context, "HRESULT")
        return result
    }
}
