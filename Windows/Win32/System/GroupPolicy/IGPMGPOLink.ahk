#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IGPMSOM.ahk" { IGPMSOM }

/**
 * The IGPMGPOLink interface supports methods that allow you to remove a GPO link from the scope of management (SOM), and to set and retrieve various properties of GPO links, including enabling and enforcing links.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmgpolink
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMGPOLink extends IDispatch {
    /**
     * The interface identifier for IGPMGPOLink
     * @type {Guid}
     */
    static IID := Guid("{434b99bd-5de7-478a-809c-c251721df70c}")

    /**
     * The class identifier for GPMGPOLink
     * @type {Guid}
     */
    static CLSID := Guid("{c1df9880-5303-42c6-8a3c-0488e1bf7364}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMGPOLink interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_GPOID        : IntPtr
        get_GPODomain    : IntPtr
        get_Enabled      : IntPtr
        put_Enabled      : IntPtr
        get_Enforced     : IntPtr
        put_Enforced     : IntPtr
        get_SOMLinkOrder : IntPtr
        get_SOM          : IntPtr
        Delete           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMGPOLink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    GPOID {
        get => this.get_GPOID()
    }

    /**
     * @type {BSTR} 
     */
    GPODomain {
        get => this.get_GPODomain()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enforced {
        get => this.get_Enforced()
        set => this.put_Enforced(value)
    }

    /**
     * @type {Integer} 
     */
    SOMLinkOrder {
        get => this.get_SOMLinkOrder()
    }

    /**
     * @type {IGPMSOM} 
     */
    SOM {
        get => this.get_SOM()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GPOID() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GPODomain() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Enabled() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a value that specifies whether the InkCollector object collects pen input (in-air packets, cursor in range events, and so on). (Put)
     * @remarks
     * If an enabled object's window input rectangle (set in the constructor or with the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setwindowinputrectangle">SetWindowInputRectangle</a> method) of an enabled object overlaps the window input rectangle of another enabled object, the E_INK_OVERLAPPING_INPUT_RECT error is returned. Overlap can occur without an error as long as only one of the input rectangles is enabled at any known time.
     * 
     * While an object is not enabled, you receive no events.
     * 
     * When a container control has its <b>Enabled</b> property set to <b>FALSE</b>, all of its contained controls are disabled as well.
     * 
     * You cannot set the <b>Enabled</b> property to <b>FALSE</b> while the object is collecting ink (<a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_collectingink">CollectingInk</a> property is <b>TRUE</b>).
     * 
     * We recommend that you set <b>Enabled</b> set to <b>FALSE</b> when the application shuts down.
     * 
     * <div class="alert"><b>Note</b>  Setting this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * This property must be set to <b>FALSE</b> before setting or calling specific properties and methods of the object. If you try to change the specified properties or methods, an error occurs. The following properties and methods cannot be set or called unless the <b>Enabled</b> property is first set to <b>FALSE</b>:
     * 
     * Properties
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkoverlay-get_attachmode">AttachMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_hwnd">hWnd</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_ink">Ink</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginx">MarginX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_marginy">MarginY</a>
     * </li>
     * </ul>
     * Methods
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setalltabletsmode">SetAllTabletsMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-setsingletabletintegratedmode">SetSingleTabletIntegratedMode</a>
     * </li>
     * </ul>
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-put_enabled
     */
    put_Enabled(newVal) {
        result := ComCall(10, this, VARIANT_BOOL, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Enforced() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_Enforced(newVal) {
        result := ComCall(12, this, VARIANT_BOOL, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SOMLinkOrder() {
        result := ComCall(13, this, "int*", &lVal := 0, "HRESULT")
        return lVal
    }

    /**
     * 
     * @returns {IGPMSOM} 
     */
    get_SOM() {
        result := ComCall(14, this, "ptr*", &ppIGPMSOM := 0, "HRESULT")
        return IGPMSOM(ppIGPMSOM)
    }

    /**
     * Removes the GPO link from the scope of management (SOM). The method does not delete the GPO.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpolink-delete
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMGPOLink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_GPOID := CallbackCreate(GetMethod(implObj, "get_GPOID"), flags, 2)
        this.vtbl.get_GPODomain := CallbackCreate(GetMethod(implObj, "get_GPODomain"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_Enforced := CallbackCreate(GetMethod(implObj, "get_Enforced"), flags, 2)
        this.vtbl.put_Enforced := CallbackCreate(GetMethod(implObj, "put_Enforced"), flags, 2)
        this.vtbl.get_SOMLinkOrder := CallbackCreate(GetMethod(implObj, "get_SOMLinkOrder"), flags, 2)
        this.vtbl.get_SOM := CallbackCreate(GetMethod(implObj, "get_SOM"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_GPOID)
        CallbackFree(this.vtbl.get_GPODomain)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_Enforced)
        CallbackFree(this.vtbl.put_Enforced)
        CallbackFree(this.vtbl.get_SOMLinkOrder)
        CallbackFree(this.vtbl.get_SOM)
        CallbackFree(this.vtbl.Delete)
    }
}
