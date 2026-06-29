#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IExplorerCommand.ahk" { IExplorerCommand }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provided by an IExplorerCommandProvider. This interface contains the enumeration of commands to be put into the command bar.
 * @remarks
 * None of the methods of this interface should talk to network resources. They are called on the UI thread; communicating with network resources would cause the UI to stop responding.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumExplorerCommand extends IUnknown {
    /**
     * The interface identifier for IEnumExplorerCommand
     * @type {Guid}
     */
    static IID := Guid("{a88826f8-186f-4987-aade-ea0cef8fbfe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumExplorerCommand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumExplorerCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a specified number of elements that directly follow the current element.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of elements to fetch.
     * @param {Pointer<IExplorerCommand>} pUICommand Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorercommand">IExplorerCommand</a>**</b>
     * 
     * Address of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorercommand">IExplorerCommand</a> interface pointer array of <i>celt</i> elements that, when this method returns, is an array of pointers to the retrieved elements.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * When this method returns, contains a pointer to the number of elements actually retrieved. This pointer can be <b>NULL</b> if this information is not needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumexplorercommand-next
     */
    Next(celt, pUICommand, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IExplorerCommand.Ptr, pUICommand, pceltFetchedMarshal, pceltFetched, Int32)
        return result
    }

    /**
     * Not currently implemented. (IEnumExplorerCommand.Skip)
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Currently unused.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumexplorercommand-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration to 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumexplorercommand-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Not currently implemented. (IEnumExplorerCommand.Clone)
     * @returns {IEnumExplorerCommand} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand">IEnumExplorerCommand</a>**</b>
     * 
     * Currently unused.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumexplorercommand-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumExplorerCommand(ppenum)
    }

    Query(iid) {
        if (IEnumExplorerCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
