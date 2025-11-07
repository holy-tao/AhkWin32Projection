#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRelatedItem.ahk

/**
 * Used to obtain the immediately underlying representation of an item's path.
 * @remarks
 * 
 * This interface provides only the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irelateditem">IRelatedItem</a> interface, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface for system-provided data objects is provided with Windows. Custom data sources that want to expose this information must implement the interface as part of their data object.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use this interface to uncovers a single level of aliasing. For instance, if you have the path of an item in the Documents library, this interface reveals the path of the item in the location that was added to the library. Whether this is the file system path depends on the nature of that original location. For a full recursion to the source item, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iidentityname">IIdentityName</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idelegateitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDelegateItem extends IRelatedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDelegateItem
     * @type {Guid}
     */
    static IID => Guid("{3c5a1c94-c951-4cb7-bb6d-3b93f30cce93}")

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
