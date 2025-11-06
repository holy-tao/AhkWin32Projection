#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by a client to specify how to filter the enumeration of a Shell item by a server application.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellitemfilter
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellItemFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellItemFilter
     * @type {Guid}
     */
    static IID => Guid("{2659b475-eeb8-48b7-8f07-b378810f48cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IncludeItem", "GetEnumFlagsForItem"]

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemfilter-includeitem
     */
    IncludeItem(psi) {
        result := ComCall(3, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemfilter-getenumflagsforitem
     */
    GetEnumFlagsForItem(psi) {
        result := ComCall(4, this, "ptr", psi, "uint*", &pgrfFlags := 0, "HRESULT")
        return pgrfFlags
    }
}
