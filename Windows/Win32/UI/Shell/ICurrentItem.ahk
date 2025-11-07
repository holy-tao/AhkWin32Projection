#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRelatedItem.ahk

/**
 * Obtained by calling IShellFolder::BindToObject for an item. If the item represents a snapshot of an item at a previous time, this interface will obtain the current version of the item.
 * @remarks
 * 
 * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icurrentitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICurrentItem extends IRelatedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentItem
     * @type {Guid}
     */
    static IID => Guid("{240a7174-d653-4a1d-a6d3-d4943cfbfe3d}")

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
