#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Enables debugging applications to manage activations.
 * @see https://docs.microsoft.com/windows/win32/api//webapplication/nn-webapplication-iwebapplicationactivation
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 * @version v4.0.30319
 */
class IWebApplicationActivation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebApplicationActivation
     * @type {Guid}
     */
    static IID => Guid("{bcdcd0de-330e-481b-b843-4898a6a8ebac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CancelPendingActivation"]

    /**
     * Cancels a pending activation.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationactivation-cancelpendingactivation
     */
    CancelPendingActivation() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
