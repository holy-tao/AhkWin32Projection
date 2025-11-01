#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRelatedItem.ahk

/**
 * Identifies an item that will be shown in the preview pane.
 * @remarks
 * 
  * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface for system-provided data objects is provided with Windows. Custom data sources that want to expose this information must implement the interface as part of their data object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipreviewitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPreviewItem extends IRelatedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPreviewItem
     * @type {Guid}
     */
    static IID => Guid("{36149969-0a8f-49c8-8b00-4aecb20222fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
