#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Communicates the state of the visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/nn-xamlom-ivisualtreeservicecallback
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class IVisualTreeServiceCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualTreeServiceCallback
     * @type {Guid}
     */
    static IID => Guid("{aa7a8931-80e4-4fec-8f3b-553f87b4966e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnVisualTreeChange"]

    /**
     * 
     * @param {ParentChildRelation} relation 
     * @param {VisualElement} element 
     * @param {Integer} mutationType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservicecallback-onvisualtreechange
     */
    OnVisualTreeChange(relation, element, mutationType) {
        result := ComCall(3, this, "ptr", relation, "ptr", element, "int", mutationType, "HRESULT")
        return result
    }
}
