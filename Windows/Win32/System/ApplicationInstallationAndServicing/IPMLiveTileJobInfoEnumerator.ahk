#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMLiveTileJobInfoEnumerator extends IUnknown{
    /**
     * The interface identifier for IPMLiveTileJobInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{bc042582-9415-4f36-9f99-06f104c07c03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPMLiveTileJobInfo>} ppLiveTileJobInfo 
     * @returns {HRESULT} 
     */
    get_Next(ppLiveTileJobInfo) {
        result := ComCall(3, this, "ptr", ppLiveTileJobInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
