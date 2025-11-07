#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRelatedItem.ahk

/**
 * Provides a canonical persistence item, an item for which view customizations will be remembered.
 * @remarks
 * 
 * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iviewstateidentityitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IViewStateIdentityItem extends IRelatedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewStateIdentityItem
     * @type {Guid}
     */
    static IID => Guid("{9d264146-a94f-4195-9f9f-3bb12ce0c955}")

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
