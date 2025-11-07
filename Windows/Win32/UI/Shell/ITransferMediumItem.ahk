#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRelatedItem.ahk

/**
 * Used by a copy engine to get the item on which to call QueryInterface to return a pointer to interface ITransferDestination or interface ITransferSource. These interfaces can be queried and enumerated for copy, move, or delete operations.
 * @remarks
 * 
 * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itransfermediumitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITransferMediumItem extends IRelatedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransferMediumItem
     * @type {Guid}
     */
    static IID => Guid("{77f295d5-2d6f-4e19-b8ae-322f3e721ab5}")

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
