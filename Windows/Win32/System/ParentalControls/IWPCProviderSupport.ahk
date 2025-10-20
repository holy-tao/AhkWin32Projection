#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that allow third-party providers to query the currently enabled provider.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwpcprovidersupport
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWPCProviderSupport extends IUnknown{
    /**
     * The interface identifier for IWPCProviderSupport
     * @type {Guid}
     */
    static IID => Guid("{41eba572-23ed-4779-bec1-8df96206c44c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguidProvider 
     * @returns {HRESULT} 
     */
    GetCurrent(pguidProvider) {
        result := ComCall(3, this, "ptr", pguidProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
