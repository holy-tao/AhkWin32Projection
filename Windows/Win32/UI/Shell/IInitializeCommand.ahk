#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a single method used to initialize objects that implement IExplorerCommandState, IExecuteCommand or IDropTarget with the application-specified command name and its registered properties.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IInitializeCommand</b> in the following situations.
 * 			    
 *                 
 * 
 * <ul>
 * <li>Implement this interface to differentiate between related commands that share implementations of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorercommandstate">IExplorerCommandState</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexecutecommand">IExecuteCommand</a>. Differentiation is made through the command name passed in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializecommand-initialize">IInitializeCommand::Initialize</a>. Commands can also use <b>Initialize</b> to pass a specific property bag for the command, using properties the command has placed in the registry.</li>
 * </ul>
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Do not call the method of <b>IInitializeCommand</b> directly. Windows Explorer calls this method when a verb object that implements this interface is invoked.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iinitializecommand
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInitializeCommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeCommand
     * @type {Guid}
     */
    static IID => Guid("{85075acf-231f-40ea-9610-d26b7b58f638}")

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
     * Initialize objects that share an implementation of IExplorerCommandState, IExecuteCommand or IDropTarget with the application-specified command name and its registered properties.
     * @param {PWSTR} pszCommandName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a string that contains the command name (the name of the command key as found in the registry). For instance, if the command is registered under <b>...</b>&#92;<b>shell</b>&#92;<b>MyCommand</b>, <i>pszCommandName</i> points to "MyCommand".
     * @param {IPropertyBag} ppb Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * Pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> instance that can be used to read the properties related to the command in the registry. For example, a command may registry a string property under its <b>...</b>&#92;<b>shell</b>&#92;<b>MyCommand</b> subkey.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iinitializecommand-initialize
     */
    Initialize(pszCommandName, ppb) {
        pszCommandName := pszCommandName is String ? StrPtr(pszCommandName) : pszCommandName

        result := ComCall(3, this, "ptr", pszCommandName, "ptr", ppb, "HRESULT")
        return result
    }
}
