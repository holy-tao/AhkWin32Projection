#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDTFilterLicenseRenewal extends IUnknown{
    /**
     * The interface identifier for IDTFilterLicenseRenewal
     * @type {Guid}
     */
    static IID => Guid("{8a78b317-e405-4a43-994a-620d8f5ce25e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszFileName 
     * @param {Pointer<PWSTR>} ppwszExpiredKid 
     * @param {Pointer<PWSTR>} ppwszTunerId 
     * @returns {HRESULT} 
     */
    GetLicenseRenewalData(ppwszFileName, ppwszExpiredKid, ppwszTunerId) {
        result := ComCall(3, this, "ptr", ppwszFileName, "ptr", ppwszExpiredKid, "ptr", ppwszTunerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
