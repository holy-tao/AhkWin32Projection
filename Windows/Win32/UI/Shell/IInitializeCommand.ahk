#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\StructuredStorage\IPropertyBag.ahk" { IPropertyBag }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a single method used to initialize objects that implement IExplorerCommandState, IExecuteCommand or IDropTarget with the application-specified command name and its registered properties.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializecommand
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInitializeCommand extends IUnknown {
    /**
     * The interface identifier for IInitializeCommand
     * @type {Guid}
     */
    static IID := Guid("{85075acf-231f-40ea-9610-d26b7b58f638}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInitializeCommand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInitializeCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinitializecommand-initialize
     */
    Initialize(pszCommandName, ppb) {
        pszCommandName := pszCommandName is String ? StrPtr(pszCommandName) : pszCommandName

        result := ComCall(3, this, "ptr", pszCommandName, "ptr", ppb, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInitializeCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
