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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cItemsToFetch 
     * @param {Pointer<Guid>} pCLSID 
     * @param {Pointer<PWSTR>} Names 
     * @param {Pointer<Integer>} pcItemsFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-ienumdmo-next
     */
    Next(cItemsToFetch, pCLSID, Names, pcItemsFetched) {
        pcItemsFetchedMarshal := pcItemsFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cItemsToFetch, "ptr", pCLSID, "ptr", Names, pcItemsFetchedMarshal, pcItemsFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cItemsToSkip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-ienumdmo-skip
     */
    Skip(cItemsToSkip) {
        result := ComCall(4, this, "uint", cItemsToSkip, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-ienumdmo-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDMO>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-ienumdmo-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
