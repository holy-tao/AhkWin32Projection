#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRelatedItem.ahk

/**
 * Exposes methods that find a version of the current item to be used to get display properties, such as the item name, that will be displayed in the UI.
 * @remarks
 * 
  * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idisplayitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDisplayItem extends IRelatedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayItem
     * @type {Guid}
     */
    static IID => Guid("{c6fd5997-9f6b-4888-8703-94e80e8cde3f}")

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
