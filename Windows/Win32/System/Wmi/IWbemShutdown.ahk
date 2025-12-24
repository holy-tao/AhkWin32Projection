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
     * The IWbemShutdown::Shutdown method indicates to the provider that the provider services are not required.
     * @param {Integer} uReason Reserved. This value must be zero (0).
     * @param {Integer} uMaxMilliseconds Reserved. This value must be zero (0).
     * @param {IWbemContext} pCtx Reserved. This value must be <b>NULL</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>, which identifies the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemshutdown-shutdown
     */
    Shutdown(uReason, uMaxMilliseconds, pCtx) {
        result := ComCall(3, this, "int", uReason, "uint", uMaxMilliseconds, "ptr", pCtx, "HRESULT")
        return result
    }
}
