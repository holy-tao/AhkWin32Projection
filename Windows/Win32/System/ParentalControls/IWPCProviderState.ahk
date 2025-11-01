#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes provider state methods that are implemented by third parties.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwpcproviderstate
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWPCProviderState extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWPCProviderState
     * @type {Guid}
     */
    static IID => Guid("{50b6a267-c4bd-450b-adb5-759073837c9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enable", "Disable"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderstate-enable
     */
    Enable() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderstate-disable
     */
    Disable() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
