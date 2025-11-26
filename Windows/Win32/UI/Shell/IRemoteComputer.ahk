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
     * Used by Windows Explorer or Windows Internet Explorer when it is initializing or enumerating a namespace extension invoked on a remote computer.
     * @param {PWSTR} pszMachine Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the machine name of the remote computer.
     * @param {BOOL} bEnumerating Type: <b>BOOL</b>
     * 
     * A value that is set to <b>TRUE</b> if Windows Explorer is enumerating the namespace extension, or <b>FALSE</b> if it is initializing it.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or standard OLE error values otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iremotecomputer-initialize
     */
    Initialize(pszMachine, bEnumerating) {
        pszMachine := pszMachine is String ? StrPtr(pszMachine) : pszMachine

        result := ComCall(3, this, "ptr", pszMachine, "int", bEnumerating, "HRESULT")
        return result
    }
}
