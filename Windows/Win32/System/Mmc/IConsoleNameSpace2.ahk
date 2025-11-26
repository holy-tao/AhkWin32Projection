#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConsoleNameSpace.ahk

/**
 * The IConsoleNameSpace2 interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsolenamespace2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsoleNameSpace2 extends IConsoleNameSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsoleNameSpace2
     * @type {Guid}
     */
    static IID => Guid("{255f18cc-65db-11d1-a7dc-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Expand", "AddExtension"]

    /**
     * The IConsoleNameSpace2::Expand method enables the snap-in to expand an item in the namespace without visibly expanding the item in the scope pane.
     * @param {Pointer} hItem A handle to the item to expand.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace2-expand
     */
    Expand(hItem) {
        result := ComCall(10, this, "ptr", hItem, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::AddExtension method enables the snap-in to add an extension snap-in that dynamically extends the namespace of a selected item.
     * @param {Pointer} hItem A handle to the item to extend with the snap-in specified by <i>lpClsid</i>.
     * @param {Pointer<Guid>} lpClsid A pointer to the <b>CLSID</b> of the snap-in that will extend the namespace of the item specified by <i>hItem</i>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace2-addextension
     */
    AddExtension(hItem, lpClsid) {
        result := ComCall(11, this, "ptr", hItem, "ptr", lpClsid, "HRESULT")
        return result
    }
}
