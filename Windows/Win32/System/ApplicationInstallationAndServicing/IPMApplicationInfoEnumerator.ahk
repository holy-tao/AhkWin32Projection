#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMApplicationInfoEnumerator extends IUnknown{
    /**
     * The interface identifier for IPMApplicationInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{0ec42a96-4d46-4dc6-a3d9-a7acaac0f5fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPMApplicationInfo>} ppAppInfo 
     * @returns {HRESULT} 
     */
    get_Next(ppAppInfo) {
        result := ComCall(3, this, "ptr", ppAppInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
