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
     * 
     * @param {Pointer<IShellItemArray>} psiItemArray 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    GetTitle(psiItemArray, ppszName) {
        result := ComCall(3, this, "ptr", psiItemArray, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} psiItemArray 
     * @param {Pointer<PWSTR>} ppszIcon 
     * @returns {HRESULT} 
     */
    GetIcon(psiItemArray, ppszIcon) {
        result := ComCall(4, this, "ptr", psiItemArray, "ptr", ppszIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} psiItemArray 
     * @param {Pointer<PWSTR>} ppszInfotip 
     * @returns {HRESULT} 
     */
    GetToolTip(psiItemArray, ppszInfotip) {
        result := ComCall(5, this, "ptr", psiItemArray, "ptr", ppszInfotip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidCommandName 
     * @returns {HRESULT} 
     */
    GetCanonicalName(pguidCommandName) {
        result := ComCall(6, this, "ptr", pguidCommandName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} psiItemArray 
     * @param {BOOL} fOkToBeSlow 
     * @param {Pointer<UInt32>} pCmdState 
     * @returns {HRESULT} 
     */
    GetState(psiItemArray, fOkToBeSlow, pCmdState) {
        result := ComCall(7, this, "ptr", psiItemArray, "int", fOkToBeSlow, "uint*", pCmdState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} psiItemArray 
     * @param {Pointer<IBindCtx>} pbc 
     * @returns {HRESULT} 
     */
    Invoke(psiItemArray, pbc) {
        result := ComCall(8, this, "ptr", psiItemArray, "ptr", pbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pFlags) {
        result := ComCall(9, this, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumExplorerCommand>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumSubCommands(ppEnum) {
        result := ComCall(10, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
