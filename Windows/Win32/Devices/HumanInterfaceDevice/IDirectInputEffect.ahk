#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIEFFECT.ahk" { DIEFFECT }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DIEFFESCAPE.ahk" { DIEFFESCAPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct IDirectInputEffect extends IUnknown {
    /**
     * The interface identifier for IDirectInputEffect
     * @type {Guid}
     */
    static IID := Guid("{e7e1f7c0-88d2-11d0-9ad0-00a0c9a06e35}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInputEffect interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize      : IntPtr
        GetEffectGuid   : IntPtr
        GetParameters   : IntPtr
        SetParameters   : IntPtr
        Start           : IntPtr
        Stop            : IntPtr
        GetEffectStatus : IntPtr
        Download        : IntPtr
        Unload          : IntPtr
        Escape          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInputEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {HINSTANCE} param0 
     * @param {Integer} param1 
     * @param {Pointer<Guid>} param2 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(param0, param1, param2) {
        result := ComCall(3, this, HINSTANCE, param0, "uint", param1, Guid.Ptr, param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @returns {HRESULT} 
     */
    GetEffectGuid(param0) {
        result := ComCall(4, this, Guid.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIEFFECT>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    GetParameters(param0, param1) {
        result := ComCall(5, this, DIEFFECT.Ptr, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DIEFFECT>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetParameters(param0, param1) {
        result := ComCall(6, this, DIEFFECT.Ptr, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    Start(param0, param1) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetEffectStatus(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Download() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unload() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The effect of passing 0 for <i>cbInput</i> will depend on the value of <i>nEscape</i> and on the driver that is handling the escape.
     * 
     * Of the original printer escapes, only the following can be used.
     * 
     * <table>
     * <tr>
     * <th>Escape</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * QUERYESCSUPPORT
     * 
     * </td>
     * <td>
     * Determines whether a particular escape is implemented by the device driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PASSTHROUGH
     * 
     * </td>
     * <td>
     * Allows the application to send data directly to a printer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For information about printer escapes, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extescape">ExtEscape</a>.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startpage">StartPage</a> function to prepare the printer driver to receive data.
     * @param {Pointer<DIEFFESCAPE>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero, except with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-escape
     */
    Escape(param0) {
        result := ComCall(12, this, DIEFFESCAPE.Ptr, param0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInputEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.GetEffectGuid := CallbackCreate(GetMethod(implObj, "GetEffectGuid"), flags, 2)
        this.vtbl.GetParameters := CallbackCreate(GetMethod(implObj, "GetParameters"), flags, 3)
        this.vtbl.SetParameters := CallbackCreate(GetMethod(implObj, "SetParameters"), flags, 3)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 3)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.GetEffectStatus := CallbackCreate(GetMethod(implObj, "GetEffectStatus"), flags, 2)
        this.vtbl.Download := CallbackCreate(GetMethod(implObj, "Download"), flags, 1)
        this.vtbl.Unload := CallbackCreate(GetMethod(implObj, "Unload"), flags, 1)
        this.vtbl.Escape := CallbackCreate(GetMethod(implObj, "Escape"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetEffectGuid)
        CallbackFree(this.vtbl.GetParameters)
        CallbackFree(this.vtbl.SetParameters)
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.GetEffectStatus)
        CallbackFree(this.vtbl.Download)
        CallbackFree(this.vtbl.Unload)
        CallbackFree(this.vtbl.Escape)
    }
}
