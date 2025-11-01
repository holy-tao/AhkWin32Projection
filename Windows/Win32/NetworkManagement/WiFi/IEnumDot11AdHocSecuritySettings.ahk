#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the collection of security settings associated with each visible wireless ad hoc network.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-ienumdot11adhocsecuritysettings
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IEnumDot11AdHocSecuritySettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDot11AdHocSecuritySettings
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2d-cf0d-42a0-acbe-e2de7007384d}")

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
     * @param {Pointer<IDot11AdHocSecuritySettings>} rgElt 
     * @param {Pointer<Integer>} pcEltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-ienumdot11adhocsecuritysettings-next
     */
    Next(cElt, rgElt, pcEltFetched) {
        result := ComCall(3, this, "uint", cElt, "ptr*", rgElt, "uint*", pcEltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-ienumdot11adhocsecuritysettings-skip
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-ienumdot11adhocsecuritysettings-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDot11AdHocSecuritySettings>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-ienumdot11adhocsecuritysettings-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
