#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellItemArray.ahk" { IShellItemArray }

/**
 * Exposes a single method that allows retrieval of the command state.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement this interface when you need to determine the command state dynamically (for instance, based on an item's properties). This interface provides the same functionality as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getstate">IExplorerCommand::GetState</a>, without the overhead of that interface's additional methods. Implement <b>IExplorerCommandState</b> when you only need to compute the command state.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Do not call the method of <b>IExplorerCommandState</b> directly. Windows Explorer calls your <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorercommandstate-getstate">IExplorerCommandState::GetState</a> implementation when the user wants to perform an action on the item.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorercommandstate
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExplorerCommandState extends IUnknown {
    /**
     * The interface identifier for IExplorerCommandState
     * @type {Guid}
     */
    static IID := Guid("{bddacb60-7657-47ae-8445-d23e1acf82ae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExplorerCommandState interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExplorerCommandState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the command state associated with a specified Shell item.
     * @remarks
     * This method provides the same functionality as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorercommand-getstate">GetState</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorercommandstate">IExplorerCommandState</a> when you only need to know the command state.
     * @param {IShellItemArray} psiItemArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a> with a single element that represents the Shell item.
     * @param {BOOL} fOkToBeSlow Type: <b>BOOL</b>
     * 
     * <b>FALSE</b> if a verb object should not perform any memory intensive computations that could cause the UI thread to stop responding. The verb object should return E_PENDING in that case. If <b>TRUE</b>, those computations can be completed.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_expcmdstate">EXPCMDSTATE</a>*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives one or more Windows Explorer command states indicated by the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_expcmdstate">EXPCMDSTATE</a> constants.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iexplorercommandstate-getstate
     */
    GetState(psiItemArray, fOkToBeSlow) {
        result := ComCall(3, this, "ptr", psiItemArray, BOOL, fOkToBeSlow, "uint*", &pCmdState := 0, "HRESULT")
        return pCmdState
    }

    Query(iid) {
        if (IExplorerCommandState.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetState)
    }
}
