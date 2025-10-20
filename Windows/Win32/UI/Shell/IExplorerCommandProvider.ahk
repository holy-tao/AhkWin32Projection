#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to create Explorer commands and command enumerators.
 * @remarks
 * 
  * None of the methods of this interface should communicate with network resources; they are called on the UI thread and doing so would cause the UI to stop responding.
  * 
  * Each command should have its own unique GUID; the command provider is expected to create a command instance on a per-GUID basis.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexplorercommandprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExplorerCommandProvider extends IUnknown{
    /**
     * The interface identifier for IExplorerCommandProvider
     * @type {Guid}
     */
    static IID => Guid("{64961751-0835-43c0-8ffe-d57686530e64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punkSite 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetCommands(punkSite, riid, ppv) {
        result := ComCall(3, this, "ptr", punkSite, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidCommandId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetCommand(rguidCommandId, riid, ppv) {
        result := ComCall(4, this, "ptr", rguidCommandId, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
