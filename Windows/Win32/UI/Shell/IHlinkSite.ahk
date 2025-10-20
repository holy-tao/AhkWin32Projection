#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHlinkSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHlinkSite
     * @type {Guid}
     */
    static IID => Guid("{79eac9c2-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryService", "GetMoniker", "ReadyToNavigate", "OnNavigationComplete"]

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppiunk 
     * @returns {HRESULT} 
     */
    QueryService(dwSiteData, guidService, riid, ppiunk) {
        result := ComCall(3, this, "uint", dwSiteData, "ptr", guidService, "ptr", riid, "ptr*", ppiunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwAssign 
     * @param {Integer} dwWhich 
     * @param {Pointer<IMoniker>} ppimk 
     * @returns {HRESULT} 
     */
    GetMoniker(dwSiteData, dwAssign, dwWhich, ppimk) {
        result := ComCall(4, this, "uint", dwSiteData, "uint", dwAssign, "uint", dwWhich, "ptr*", ppimk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    ReadyToNavigate(dwSiteData, dwReserved) {
        result := ComCall(5, this, "uint", dwSiteData, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwreserved 
     * @param {HRESULT} hrError 
     * @param {PWSTR} pwzError 
     * @returns {HRESULT} 
     */
    OnNavigationComplete(dwSiteData, dwreserved, hrError, pwzError) {
        pwzError := pwzError is String ? StrPtr(pwzError) : pwzError

        result := ComCall(6, this, "uint", dwSiteData, "uint", dwreserved, "int", hrError, "ptr", pwzError, "HRESULT")
        return result
    }
}
