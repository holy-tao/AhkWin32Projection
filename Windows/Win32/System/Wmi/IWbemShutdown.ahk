#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemShutdown interface indicates to the provider that an instance of an object is ready to be discarded. The provider can use this call to release resources that it is referencing currently.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemshutdown
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemShutdown extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemShutdown
     * @type {Guid}
     */
    static IID => Guid("{b7b31df9-d515-11d3-a11c-00105a1f515a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Shutdown"]

    /**
     * 
     * @param {Integer} uReason 
     * @param {Integer} uMaxMilliseconds 
     * @param {IWbemContext} pCtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemshutdown-shutdown
     */
    Shutdown(uReason, uMaxMilliseconds, pCtx) {
        result := ComCall(3, this, "int", uReason, "uint", uMaxMilliseconds, "ptr", pCtx, "HRESULT")
        return result
    }
}
