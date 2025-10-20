#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMBackgroundWorkerInfoEnumerator extends IUnknown{
    /**
     * The interface identifier for IPMBackgroundWorkerInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{87f479f8-90d8-4ec7-92b9-72787e2f636b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPMBackgroundWorkerInfo>} ppBWInfo 
     * @returns {HRESULT} 
     */
    get_Next(ppBWInfo) {
        result := ComCall(3, this, "ptr", ppBWInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
