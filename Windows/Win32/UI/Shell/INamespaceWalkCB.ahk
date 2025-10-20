#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback interface exposing methods used with INamespaceWalk.
 * @remarks
 * 
  * The IID for this interface is IID_INamespaceWalkCB.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inamespacewalkcb
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INamespaceWalkCB extends IUnknown{
    /**
     * The interface identifier for INamespaceWalkCB
     * @type {Guid}
     */
    static IID => Guid("{d92995f8-cf5e-4a76-bf59-ead39ea2b97e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IShellFolder>} psf 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    FoundItem(psf, pidl) {
        result := ComCall(3, this, "ptr", psf, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellFolder>} psf 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    EnterFolder(psf, pidl) {
        result := ComCall(4, this, "ptr", psf, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellFolder>} psf 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    LeaveFolder(psf, pidl) {
        result := ComCall(5, this, "ptr", psf, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTitle 
     * @param {Pointer<PWSTR>} ppszCancel 
     * @returns {HRESULT} 
     */
    InitializeProgressDialog(ppszTitle, ppszCancel) {
        result := ComCall(6, this, "ptr", ppszTitle, "ptr", ppszCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
