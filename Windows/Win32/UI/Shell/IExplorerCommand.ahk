#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import ".\IEnumExplorerCommand.ahk" { IEnumExplorerCommand }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IShellItemArray.ahk" { IShellItemArray }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that get the command appearance, enumerate subcommands, or invoke the command.
 * @remarks
 * None of the methods of this interface should communicate with network resources. These methods are called on the UI thread, so communication with network resources could cause the UI to stop responding.
 * 
 * Note: Windows 11 refines the behavior of the contextual file operations in the right-click context menu of File Explorer and the Share dialog. Please see  <a href="https://docs.microsoft.com/windows/apps/get-started/make-apps-great-for-windows">Top 11 things you can do to make your app great on Windows 11 </a>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorercommand
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExplorerCommand extends IUnknown {
    /**
     * The interface identifier for IExplorerCommand
     * @type {Guid}
     */
    static IID := Guid("{a08ce4d0-fa25-44ab-b57c-c7b1c323e0b9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExplorerCommand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTitle         : IntPtr
        GetIcon          : IntPtr
        GetToolTip       : IntPtr
        GetCanonicalName : IntPtr
        GetState         : IntPtr
        Invoke           : IntPtr
        GetFlags         : IntPtr
        EnumSubCommands  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExplorerCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the title text of the button or menu item that launches a specified Windows Explorer command item.
     * @param {IShellItemArray} psiItemArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the title string.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-gettitle
     */
    GetTitle(psiItemArray) {
        result := ComCall(3, this, "ptr", psiItemArray, PWSTR.Ptr, &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Gets an icon resource string of the icon associated with the specified Windows Explorer command item.
     * @remarks
     * The retrieved icon resource string is in the standard format, for instance "shell32.dll,-249".
     * @param {IShellItemArray} psiItemArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the resource string that identifies the icon source.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-geticon
     */
    GetIcon(psiItemArray) {
        result := ComCall(4, this, "ptr", psiItemArray, PWSTR.Ptr, &ppszIcon := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-gettooltip
     */
    GetToolTip(psiItemArray) {
        result := ComCall(5, this, "ptr", psiItemArray, PWSTR.Ptr, &ppszInfotip := 0, "HRESULT")
        return ppszInfotip
    }

    /**
     * Gets the GUID of a Windows Explorer command.
     * @remarks
     * This method is somewhat misnamed, given that it retrieves a GUID. To retrieve the command's canonical name, you must take the additional step to pull it from the command's subkey. The GUID is the name of the subkey. where that information is stored.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the command's GUID, under which it is declared in the registry.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getcanonicalname
     */
    GetCanonicalName() {
        pguidCommandName := Guid()
        result := ComCall(6, this, Guid.Ptr, pguidCommandName, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getstate
     */
    GetState(psiItemArray, fOkToBeSlow) {
        result := ComCall(7, this, "ptr", psiItemArray, BOOL, fOkToBeSlow, "uint*", &pCmdState := 0, "HRESULT")
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-invoke
     */
    Invoke(psiItemArray, pbc) {
        result := ComCall(8, this, "ptr", psiItemArray, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * Gets the flags associated with a Windows Explorer command.
     * @returns {Integer} Type: <b>EXPCMDFLAGS*</b>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getflags
     */
    GetFlags() {
        result := ComCall(9, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Retrieves an enumerator for a command's subcommands.
     * @remarks
     * Subcommands are displayed as menu drop-down items through the use of a Split button when commands are exposed at the top of a Windows Explorer window. In that position, only the default command button is given an icon. In a normal menu, the icons for all commands are shown.
     * 
     * Subcommands which themselves have subcommands are not supported by Windows Explorer. When a command has its own subcommands, it must designate this status by specifying ECF_HASSUBCOMMANDS in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getflags">IExplorerCommand::GetFlags</a> call.
     * @returns {IEnumExplorerCommand} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand">IEnumExplorerCommand</a>**</b>
     * 
     * When this method returns successfully, contains an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand">IEnumExplorerCommand</a> interface pointer that can be used to walk the set of subcommands.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-enumsubcommands
     */
    EnumSubCommands() {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumExplorerCommand(ppEnum)
    }

    Query(iid) {
        if (IExplorerCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTitle := CallbackCreate(GetMethod(implObj, "GetTitle"), flags, 3)
        this.vtbl.GetIcon := CallbackCreate(GetMethod(implObj, "GetIcon"), flags, 3)
        this.vtbl.GetToolTip := CallbackCreate(GetMethod(implObj, "GetToolTip"), flags, 3)
        this.vtbl.GetCanonicalName := CallbackCreate(GetMethod(implObj, "GetCanonicalName"), flags, 2)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 4)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 3)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.EnumSubCommands := CallbackCreate(GetMethod(implObj, "EnumSubCommands"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTitle)
        CallbackFree(this.vtbl.GetIcon)
        CallbackFree(this.vtbl.GetToolTip)
        CallbackFree(this.vtbl.GetCanonicalName)
        CallbackFree(this.vtbl.GetState)
        CallbackFree(this.vtbl.Invoke)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.EnumSubCommands)
    }
}
