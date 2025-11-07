#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a single method that allows retrieval of the command state.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Implement this interface when you need to determine the command state dynamically (for instance, based on an item's properties). This interface provides the same functionality as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getstate">IExplorerCommand::GetState</a>, without the overhead of that interface's additional methods. Implement <b>IExplorerCommandState</b> when you only need to compute the command state.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Do not call the method of <b>IExplorerCommandState</b> directly. Windows Explorer calls your <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorercommandstate-getstate">IExplorerCommandState::GetState</a> implementation when the user wants to perform an action on the item.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexplorercommandstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExplorerCommandState extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExplorerCommandState
     * @type {Guid}
     */
    static IID => Guid("{bddacb60-7657-47ae-8445-d23e1acf82ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetState"]

    /**
     * 
     * @param {IShellItemArray} psiItemArray 
     * @param {BOOL} fOkToBeSlow 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommandstate-getstate
     */
    GetState(psiItemArray, fOkToBeSlow) {
        result := ComCall(3, this, "ptr", psiItemArray, "int", fOkToBeSlow, "uint*", &pCmdState := 0, "HRESULT")
        return pCmdState
    }
}
