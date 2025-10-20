#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumDirectoryObject interface provides COM-standard enumeration methods for the ITDirectoryObject interface. The ITDirectory::EnumerateDirectoryObjects method returns a pointer to IEnumDirectoryObject.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-ienumdirectoryobject
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumDirectoryObject extends IUnknown{
    /**
     * The interface identifier for IEnumDirectoryObject
     * @type {Guid}
     */
    static IID => Guid("{06c9b64a-306d-11d1-9774-00c04fd91ac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ITDirectoryObject>} pVal 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(celt, pVal, pcFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", pVal, "uint*", pcFetched, "int")
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
     * @param {Pointer<IEnumDirectoryObject>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
