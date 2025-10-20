#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes resource enumeration methods.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumresources
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumResources extends IUnknown{
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
     * 
     * @param {Integer} celt 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} psir 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, psir, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", psir, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumResources>} ppenumr 
     * @returns {HRESULT} 
     */
    Clone(ppenumr) {
        result := ComCall(6, this, "ptr", ppenumr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
