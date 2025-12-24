#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumResources.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes resource enumeration methods.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumresources
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumResources extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumResources
     * @type {Guid}
     */
    static IID => Guid("{2dd81fe3-a83c-4da9-a330-47249d345ba1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Gets the next SHELL_ITEM_RESOURCE structure.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of resources requested. Currently, must be 1.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} psir Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> structure.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to the number of resources retrieved. Currently, not used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumresources-next
     */
    Next(celt, psir, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", psir, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of resources.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of resources to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumresources-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration index to 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumresources-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones a resource enumerator.
     * @returns {IEnumResources} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumresources">IEnumResources</a>**</b>
     * 
     * Contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumresources">IEnumResources</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumresources-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenumr := 0, "HRESULT")
        return IEnumResources(ppenumr)
    }
}
