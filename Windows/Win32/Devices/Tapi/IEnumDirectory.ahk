#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumDirectory interface provides COM-standard enumeration methods for the ITDirectory interface. The ITRendezvous::EnumerateDefaultDirectories method returns a pointer to IEnumDirectory.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-ienumdirectory
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumDirectory extends IUnknown{
    /**
     * The interface identifier for IEnumDirectory
     * @type {Guid}
     */
    static IID => Guid("{34621d6d-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ITDirectory>} ppElements 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ppElements, pcFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", ppElements, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(4, this, "int")
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
        result := ComCall(5, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDirectory>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
