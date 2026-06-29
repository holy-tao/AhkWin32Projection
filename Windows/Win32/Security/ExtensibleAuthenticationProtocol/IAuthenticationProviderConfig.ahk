#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct IAuthenticationProviderConfig extends IUnknown {
    /**
     * The interface identifier for IAuthenticationProviderConfig
     * @type {Guid}
     */
    static IID := Guid("{66a2db17-d706-11d0-a37b-00c04fc9da04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAuthenticationProviderConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize   : IntPtr
        Uninitialize : IntPtr
        Configure    : IntPtr
        Activate     : IntPtr
        Deactivate   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAuthenticationProviderConfig.Vtbl()
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
     * @param {PWSTR} pszMachineName 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(pszMachineName) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        result := ComCall(3, this, "ptr", pszMachineName, "ptr*", &puConnectionParam := 0, "HRESULT")
        return puConnectionParam
    }

    /**
     * 
     * @param {Pointer} uConnectionParam 
     * @returns {HRESULT} 
     */
    Uninitialize(uConnectionParam) {
        result := ComCall(4, this, "ptr", uConnectionParam, "HRESULT")
        return result
    }

    /**
     * Configures the expert within the expert DLL.
     * @remarks
     * Network Monitor calls the **Configure** function with the current configuration of the expert, if one exists. The expert displays a dialog box, with which you can change any configurable item.
     * 
     * When *ppConfig* is passed in and Network Monitor does not have a configuration stored for the specified expert, the parameter value can be **NULL**. In this case, the **Configure** function assumes hard-coded default values (or, uses the startup information) to open the dialog box.
     * 
     * The configuration data can also be **NULL** when the **Configure** function returns, and a **NULL** was passed-in. This situation occurs when Network Monitor does not have a stored default, and the user presses **Cancel**.
     * 
     * The beginning of the [**EXPERTCONFIG**](expertconfig.md) data structure includes a Private section that stores the structure size information. The size of the **EXPERTCONFIG** structure should include the reserved **DWORD** length that appears at the beginning of the structure. For example, if your configuration data requires 20 bytes of storage space, allocate 24 bytes to store the data. If a *ppConfig* is **NULL**, the **Configure** function calls the [**ExpertAllocMemory**](expertallocmemory.md) function to allocate a new configuration that is the correct size. If the buffer is not enough to hold the expert data, the expert should call the [**ExpertReallocMemory**](expertreallocmemory.md) function.
     * @param {Pointer} uConnectionParam 
     * @param {HWND} _hWnd A handle to the parent window. Use the handle to open a dialog box.
     * @param {Integer} dwFlags 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} If the function is successful (that is, if a current configuration exists), the return value is **TRUE**.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/configure
     */
    Configure(uConnectionParam, _hWnd, dwFlags, uReserved1, uReserved2) {
        result := ComCall(5, this, "ptr", uConnectionParam, HWND, _hWnd, "uint", dwFlags, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} uConnectionParam 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} 
     */
    Activate(uConnectionParam, uReserved1, uReserved2) {
        result := ComCall(6, this, "ptr", uConnectionParam, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} uConnectionParam 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} 
     */
    Deactivate(uConnectionParam, uReserved1, uReserved2) {
        result := ComCall(7, this, "ptr", uConnectionParam, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAuthenticationProviderConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.Uninitialize := CallbackCreate(GetMethod(implObj, "Uninitialize"), flags, 2)
        this.vtbl.Configure := CallbackCreate(GetMethod(implObj, "Configure"), flags, 6)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 4)
        this.vtbl.Deactivate := CallbackCreate(GetMethod(implObj, "Deactivate"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Uninitialize)
        CallbackFree(this.vtbl.Configure)
        CallbackFree(this.vtbl.Activate)
        CallbackFree(this.vtbl.Deactivate)
    }
}
