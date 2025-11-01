#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to manipulate IShellItem, including copy, move, recycle, and others. This interface is offered to provide more control over file operations by providing an ITransferSource::Advise method.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itransfersource
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITransferSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransferSource
     * @type {Guid}
     */
    static IID => Guid("{00adb003-bde9-45c6-8e29-d09f9353e108}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "SetProperties", "OpenItem", "MoveItem", "RecycleItem", "RemoveItem", "RenameItem", "LinkItem", "ApplyPropertiesToItem", "GetDefaultDestinationName", "EnterFolder", "LeaveFolder"]

    /**
     * 
     * @param {ITransferAdviseSink} psink 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-advise
     */
    Advise(psink, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", psink, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyChangeArray} pproparray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-setproperties
     */
    SetProperties(pproparray) {
        result := ComCall(5, this, "ptr", pproparray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-openitem
     */
    OpenItem(psi, flags, riid, ppv) {
        result := ComCall(6, this, "ptr", psi, "uint", flags, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {IShellItem} psiParentDst 
     * @param {PWSTR} pszNameDst 
     * @param {Integer} flags 
     * @param {Pointer<IShellItem>} ppsiNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-moveitem
     */
    MoveItem(psi, psiParentDst, pszNameDst, flags, ppsiNew) {
        pszNameDst := pszNameDst is String ? StrPtr(pszNameDst) : pszNameDst

        result := ComCall(7, this, "ptr", psi, "ptr", psiParentDst, "ptr", pszNameDst, "uint", flags, "ptr*", ppsiNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @param {IShellItem} psiParentDest 
     * @param {Integer} flags 
     * @param {Pointer<IShellItem>} ppsiNewDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-recycleitem
     */
    RecycleItem(psiSource, psiParentDest, flags, ppsiNewDest) {
        result := ComCall(8, this, "ptr", psiSource, "ptr", psiParentDest, "uint", flags, "ptr*", ppsiNewDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-removeitem
     */
    RemoveItem(psiSource, flags) {
        result := ComCall(9, this, "ptr", psiSource, "uint", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @param {PWSTR} pszNewName 
     * @param {Integer} flags 
     * @param {Pointer<IShellItem>} ppsiNewDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-renameitem
     */
    RenameItem(psiSource, pszNewName, flags, ppsiNewDest) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(10, this, "ptr", psiSource, "ptr", pszNewName, "uint", flags, "ptr*", ppsiNewDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @param {IShellItem} psiParentDest 
     * @param {PWSTR} pszNewName 
     * @param {Integer} flags 
     * @param {Pointer<IShellItem>} ppsiNewDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-linkitem
     */
    LinkItem(psiSource, psiParentDest, pszNewName, flags, ppsiNewDest) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(11, this, "ptr", psiSource, "ptr", psiParentDest, "ptr", pszNewName, "uint", flags, "ptr*", ppsiNewDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @param {Pointer<IShellItem>} ppsiNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-applypropertiestoitem
     */
    ApplyPropertiesToItem(psiSource, ppsiNew) {
        result := ComCall(12, this, "ptr", psiSource, "ptr*", ppsiNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @param {IShellItem} psiParentDest 
     * @param {Pointer<PWSTR>} ppszDestinationName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-getdefaultdestinationname
     */
    GetDefaultDestinationName(psiSource, psiParentDest, ppszDestinationName) {
        result := ComCall(13, this, "ptr", psiSource, "ptr", psiParentDest, "ptr", ppszDestinationName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiChildFolderDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-enterfolder
     */
    EnterFolder(psiChildFolderDest) {
        result := ComCall(14, this, "ptr", psiChildFolderDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiChildFolderDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransfersource-leavefolder
     */
    LeaveFolder(psiChildFolderDest) {
        result := ComCall(15, this, "ptr", psiChildFolderDest, "HRESULT")
        return result
    }
}
