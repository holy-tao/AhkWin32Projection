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
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    IncludeItem(psi) {
        result := ComCall(3, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<UInt32>} pgrfFlags 
     * @returns {HRESULT} 
     */
    GetEnumFlagsForItem(psi, pgrfFlags) {
        result := ComCall(4, this, "ptr", psi, "uint*", pgrfFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
