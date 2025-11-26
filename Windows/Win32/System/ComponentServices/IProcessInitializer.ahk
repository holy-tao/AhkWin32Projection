#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods that can be called whenever Dllhost.exe starts up or shuts down.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iprocessinitializer
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IProcessInitializer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessInitializer
     * @type {Guid}
     */
    static IID => Guid("{1113f52d-dc7f-4943-aed6-88d04027e32a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Startup", "Shutdown"]

    /**
     * Called when Dllhost.exe starts.
     * @param {IUnknown} punkProcessControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the COM component starting up.
     * 
     * <b>Windows XP/2000:  </b>This parameter is always <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iprocessinitializer-startup
     */
    Startup(punkProcessControl) {
        result := ComCall(3, this, "ptr", punkProcessControl, "HRESULT")
        return result
    }

    /**
     * Called when Dllhost.exe shuts down.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iprocessinitializer-shutdown
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
