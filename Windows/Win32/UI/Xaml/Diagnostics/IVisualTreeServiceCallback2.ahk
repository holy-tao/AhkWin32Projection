#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IVisualTreeServiceCallback.ahk

/**
 * Represents additional capabilities of an IVisualTreeServiceCallback object.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nn-xamlom-ivisualtreeservicecallback2
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
     * @remarks
     * When any XAML diagnostics API results in a resource reference becoming invalid, this callback will be notified of the invalid reference. An instance handle will be given that corresponds to an element in the tree, and a string representation of the path to the invalid reference. The grammar for the syntax is: PropertyName:Full.Dotted.TypeName[Indexer] and paths can be separated with a forward slash ("/") to be chained together.
     * @param {Integer} element The XAML element in the visual tree.
     * @param {Integer} elementState The state of the element.
     * @param {PWSTR} _context 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservicecallback2-onelementstatechanged
     */
    OnElementStateChanged(element, elementState, _context) {
        _context := _context is String ? StrPtr(_context) : _context

        result := ComCall(4, this, "uint", element, "int", elementState, "ptr", _context, "HRESULT")
        return result
    }
}
