#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CreateProcessMethod.ahk" { CreateProcessMethod }
#Import "..\..\..\UI\Shell\IShellItem.ahk" { IShellItem }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Shell
 */
export default struct IDDEInitializer extends IUnknown {
    /**
     * The interface identifier for IDDEInitializer
     * @type {Guid}
     */
    static IID := Guid("{30dc931f-33fc-4ffd-a168-942258cf3ca4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDDEInitializer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDDEInitializer.Vtbl()
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
     * @param {PWSTR} fileExtensionOrProtocol 
     * @param {CreateProcessMethod} method 
     * @param {PWSTR} currentDirectory 
     * @param {IShellItem} execTarget 
     * @param {IUnknown} site 
     * @param {PWSTR} _application 
     * @param {PWSTR} targetFile 
     * @param {PWSTR} arguments 
     * @param {PWSTR} verb 
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
    Initialize(fileExtensionOrProtocol, method, currentDirectory, execTarget, site, _application, targetFile, arguments, verb) {
        fileExtensionOrProtocol := fileExtensionOrProtocol is String ? StrPtr(fileExtensionOrProtocol) : fileExtensionOrProtocol
        currentDirectory := currentDirectory is String ? StrPtr(currentDirectory) : currentDirectory
        _application := _application is String ? StrPtr(_application) : _application
        targetFile := targetFile is String ? StrPtr(targetFile) : targetFile
        arguments := arguments is String ? StrPtr(arguments) : arguments
        verb := verb is String ? StrPtr(verb) : verb

        result := ComCall(3, this, "ptr", fileExtensionOrProtocol, CreateProcessMethod, method, "ptr", currentDirectory, "ptr", execTarget, "ptr", site, "ptr", _application, "ptr", targetFile, "ptr", arguments, "ptr", verb, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDDEInitializer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
