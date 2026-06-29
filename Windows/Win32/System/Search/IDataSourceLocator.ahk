#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDataSourceLocator extends IDispatch {
    /**
     * The interface identifier for IDataSourceLocator
     * @type {Guid}
     */
    static IID := Guid("{2206ccb2-19c1-11d1-89e0-00c04fd7a829}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataSourceLocator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_hWnd   : IntPtr
        put_hWnd   : IntPtr
        PromptNew  : IntPtr
        PromptEdit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataSourceLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {HWND} 
     */
    hWnd {
        get => this.get_hWnd()
        set => this.put_hWnd(value)
    }

    /**
     * 
     * @returns {HWND} 
     */
    get_hWnd() {
        phwndParent := HWND()
        result := ComCall(7, this, HWND.Ptr, phwndParent, "HRESULT")
        return phwndParent
    }

    /**
     * Gets or sets the handle value of the window on which ink is drawn. (IInkCollector.put_hWnd)
     * @remarks
     * If two or more windows exist, this property allows you to specify which window collects ink.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-class">InkCollector</a> object or the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object must be disabled before setting this property. To disable the <b>InkCollector</b> or <b>InkOverlay</b> objects, set the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_enabled">Enabled</a> property to <b>FALSE</b>. You can then set the <b>hWnd</b> property and re-enable the object by setting the <b>Enabled</b> property to <b>TRUE</b>.</div>
     * <div> </div>
     * In Automation, this property is called <b>hWnd Property</b>.
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_hwnd
     */
    put_hWnd(hwndParent) {
        result := ComCall(8, this, HWND, hwndParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    PromptNew() {
        result := ComCall(9, this, "ptr*", &ppADOConnection := 0, "HRESULT")
        return IDispatch(ppADOConnection)
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppADOConnection 
     * @returns {VARIANT_BOOL} 
     */
    PromptEdit(ppADOConnection) {
        result := ComCall(10, this, IDispatch.Ptr, ppADOConnection, VARIANT_BOOL.Ptr, &pbSuccess := 0, "HRESULT")
        return pbSuccess
    }

    Query(iid) {
        if (IDataSourceLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_hWnd := CallbackCreate(GetMethod(implObj, "get_hWnd"), flags, 2)
        this.vtbl.put_hWnd := CallbackCreate(GetMethod(implObj, "put_hWnd"), flags, 2)
        this.vtbl.PromptNew := CallbackCreate(GetMethod(implObj, "PromptNew"), flags, 2)
        this.vtbl.PromptEdit := CallbackCreate(GetMethod(implObj, "PromptEdit"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_hWnd)
        CallbackFree(this.vtbl.put_hWnd)
        CallbackFree(this.vtbl.PromptNew)
        CallbackFree(this.vtbl.PromptEdit)
    }
}
