#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumDot11AdHocInterfaces.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the collection of currently visible 802.11 ad hoc network interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-ienumdot11adhocinterfaces
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IEnumDot11AdHocInterfaces extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDot11AdHocInterfaces
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2c-cf0d-42a0-acbe-e2de7007384d}")

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
     * @param {Integer} cElt 
     * @param {Pointer<IDot11AdHocInterface>} rgElt 
     * @param {Pointer<Integer>} pcEltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-ienumdot11adhocinterfaces-next
     */
    Next(cElt, rgElt, pcEltFetched) {
        pcEltFetchedMarshal := pcEltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cElt, "ptr*", rgElt, pcEltFetchedMarshal, pcEltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-ienumdot11adhocinterfaces-skip
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-ienumdot11adhocinterfaces-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumDot11AdHocInterfaces} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-ienumdot11adhocinterfaces-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDot11AdHocInterfaces(ppEnum)
    }
}
