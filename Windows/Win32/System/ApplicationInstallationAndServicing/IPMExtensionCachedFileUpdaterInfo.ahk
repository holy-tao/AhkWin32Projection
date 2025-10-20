#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionCachedFileUpdaterInfo extends IUnknown{
    /**
     * The interface identifier for IPMExtensionCachedFileUpdaterInfo
     * @type {Guid}
     */
    static IID => Guid("{e2d77509-4e58-4ba9-af7e-b642e370e1b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pSupportsUpdates 
     * @returns {HRESULT} 
     */
    get_SupportsUpdates(pSupportsUpdates) {
        result := ComCall(3, this, "ptr", pSupportsUpdates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
