#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {IShellItemArray} psiItemArray 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-gettitle
     */
    GetTitle(psiItemArray, ppszName) {
        result := ComCall(3, this, "ptr", psiItemArray, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItemArray} psiItemArray 
     * @param {Pointer<PWSTR>} ppszIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-geticon
     */
    GetIcon(psiItemArray, ppszIcon) {
        result := ComCall(4, this, "ptr", psiItemArray, "ptr", ppszIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItemArray} psiItemArray 
     * @param {Pointer<PWSTR>} ppszInfotip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-gettooltip
     */
    GetToolTip(psiItemArray, ppszInfotip) {
        result := ComCall(5, this, "ptr", psiItemArray, "ptr", ppszInfotip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidCommandName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getcanonicalname
     */
    GetCanonicalName(pguidCommandName) {
        result := ComCall(6, this, "ptr", pguidCommandName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItemArray} psiItemArray 
     * @param {BOOL} fOkToBeSlow 
     * @param {Pointer<Integer>} pCmdState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getstate
     */
    GetState(psiItemArray, fOkToBeSlow, pCmdState) {
        result := ComCall(7, this, "ptr", psiItemArray, "int", fOkToBeSlow, "uint*", pCmdState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItemArray} psiItemArray 
     * @param {IBindCtx} pbc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-invoke
     */
    Invoke(psiItemArray, pbc) {
        result := ComCall(8, this, "ptr", psiItemArray, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getflags
     */
    GetFlags(pFlags) {
        result := ComCall(9, this, "uint*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumExplorerCommand>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-enumsubcommands
     */
    EnumSubCommands(ppEnum) {
        result := ComCall(10, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
