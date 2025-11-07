#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that enumerates or initializes a namespace extension when it is invoked on a remote object. This interface is used, for example, to initialize the remote printers virtual folder.
 * @remarks
 * 
 * Implement <b>IRemoteComputer</b> when your namespace extension may be invoked on a remote computer.
 * 
 * You do not call this interface directly. <b>IRemoteComputer</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iremotecomputer
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IRemoteComputer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteComputer
     * @type {Guid}
     */
    static IID => Guid("{000214fe-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszMachine 
     * @param {BOOL} bEnumerating 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pszMachine, bEnumerating) {
        pszMachine := pszMachine is String ? StrPtr(pszMachine) : pszMachine

        result := ComCall(3, this, "ptr", pszMachine, "int", bEnumerating, "HRESULT")
        return result
    }
}
