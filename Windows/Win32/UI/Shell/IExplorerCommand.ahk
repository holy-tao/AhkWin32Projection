#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumExplorerCommand.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get the command appearance, enumerate subcommands, or invoke the command.
 * @remarks
 * 
 * None of the methods of this interface should communicate with network resources. These methods are called on the UI thread, so communication with network resources could cause the UI to stop responding.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexplorercommand
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExplorerCommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExplorerCommand
     * @type {Guid}
     */
    static IID => Guid("{a08ce4d0-fa25-44ab-b57c-c7b1c323e0b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTitle", "GetIcon", "GetToolTip", "GetCanonicalName", "GetState", "Invoke", "GetFlags", "EnumSubCommands"]

    /**
     * Gets the title text of the button or menu item that launches a specified Windows Explorer command item.
     * @param {IShellItemArray} psiItemArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the title string.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorercommand-gettitle
     */
    GetTitle(psiItemArray) {
        result := ComCall(3, this, "ptr", psiItemArray, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets an icon resource string of the icon associated with the specified Windows Explorer command item.
     * @param {IShellItemArray} psiItemArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the resource string that identifies the icon source.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorercommand-geticon
     */
    GetIcon(psiItemArray) {
        result := ComCall(4, this, "ptr", psiItemArray, "ptr*", &ppszIcon := 0, "HRESULT")
        return ppszIcon
    }

    /**
     * Gets the tooltip string associated with a specified Windows Explorer command item.
     * @param {IShellItemArray} psiItemArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the tooltip string.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorercommand-gettooltip
     */
    GetToolTip(psiItemArray) {
        result := ComCall(5, this, "ptr", psiItemArray, "ptr*", &ppszInfotip := 0, "HRESULT")
        return ppszInfotip
    }

    /**
     * Gets the GUID of an Windows Explorer command.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the command's GUID, under which it is declared in the registry.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorercommand-getcanonicalname
     */
    GetCanonicalName() {
        pguidCommandName := Guid()
        result := ComCall(6, this, "ptr", pguidCommandName, "HRESULT")
        return pguidCommandName
    }

    /**
     * Gets state information associated with a specified Windows Explorer command item.
     * @param {IShellItemArray} psiItemArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @param {BOOL} fOkToBeSlow Type: <b>BOOL</b>
     * 
     * <b>FALSE</b> if a verb object should not perform any memory intensive computations that could cause the UI thread to stop responding. The verb object should return E_PENDING in that case. If <b>TRUE</b>, those computations can be completed.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_expcmdstate">EXPCMDSTATE</a>*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives one or more Windows Explorer command states indicated by the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_expcmdstate">EXPCMDSTATE</a> constants.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorercommand-getstate
     */
    GetState(psiItemArray, fOkToBeSlow) {
        result := ComCall(7, this, "ptr", psiItemArray, "int", fOkToBeSlow, "uint*", &pCmdState := 0, "HRESULT")
        return pCmdState
    }

    /**
     * Invokes a Windows Explorer command.
     * @param {IShellItemArray} psiItemArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface, which provides access to a bind context. This value can be <b>NULL</b> if no bind context is needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorercommand-invoke
     */
    Invoke(psiItemArray, pbc) {
        result := ComCall(8, this, "ptr", psiItemArray, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * Gets the flags associated with a Windows Explorer command.
     * @returns {Integer} Type: <b>EXPCMDFLAGS*</b>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorercommand-getflags
     */
    GetFlags() {
        result := ComCall(9, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Retrieves an enemerator for a command's subcommands.
     * @returns {IEnumExplorerCommand} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand">IEnumExplorerCommand</a>**</b>
     * 
     * When this method returns successfully, contains an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand">IEnumExplorerCommand</a> interface pointer that can be used to walk the set of subcommands.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iexplorercommand-enumsubcommands
     */
    EnumSubCommands() {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumExplorerCommand(ppEnum)
    }
}
