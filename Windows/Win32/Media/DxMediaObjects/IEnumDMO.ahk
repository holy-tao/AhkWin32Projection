#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumDMO interface provides methods for enumerating Microsoft DirectX Media Objects (DMOs). It is based on the OLE enumeration interfaces. For more information, see the IEnumXXXX topic in the Platform SDK.
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-ienumdmo
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IEnumDMO extends IUnknown{
    /**
     * The interface identifier for IEnumDMO
     * @type {Guid}
     */
    static IID => Guid("{2c3cd98a-2bfa-4a53-9c27-5249ba64ba0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cItemsToFetch 
     * @param {Pointer<Guid>} pCLSID 
     * @param {Pointer<PWSTR>} Names 
     * @param {Pointer<UInt32>} pcItemsFetched 
     * @returns {HRESULT} 
     */
    Next(cItemsToFetch, pCLSID, Names, pcItemsFetched) {
        result := ComCall(3, this, "uint", cItemsToFetch, "ptr", pCLSID, "ptr", Names, "uint*", pcItemsFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cItemsToSkip 
     * @returns {HRESULT} 
     */
    Skip(cItemsToSkip) {
        result := ComCall(4, this, "uint", cItemsToSkip, "int")
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
     * @param {Pointer<IEnumDMO>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
