#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used by the ICreatingProcess interface to alter some parameters of the process that is being created.
 * @remarks
 * Applications do not implement this interface.
 * 
 * A pointer to this interface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icreatingprocess-oncreating">ICreatingProcess::OnCreating</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icreateprocessinputs
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICreateProcessInputs extends IUnknown {
    /**
     * The interface identifier for ICreateProcessInputs
     * @type {Guid}
     */
    static IID := Guid("{f6ef6140-e26f-4d82-bac4-e9ba5fd239a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateProcessInputs interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCreateFlags         : IntPtr
        SetCreateFlags         : IntPtr
        AddCreateFlags         : IntPtr
        SetHotKey              : IntPtr
        AddStartupFlags        : IntPtr
        SetTitle               : IntPtr
        SetEnvironmentVariable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateProcessInputs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the additional flags that will be passed to CreateProcess.
     * @returns {Integer} A pointer to a <b>DWORD</b> which receives the flags that will be passed as the <i>dwCreationFlags</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreateprocessinputs-getcreateflags
     */
    GetCreateFlags() {
        result := ComCall(3, this, "uint*", &pdwCreationFlags := 0, "HRESULT")
        return pdwCreationFlags
    }

    /**
     * Set the flags that will be included in the call to CreateProcess.
     * @remarks
     * Any flags set by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icreateprocessinputs-addcreateflags">AddCreateFlags</a> or <b>SetCreateFlags </b> will be replaced by the values specified by <i>dwCreationFlags</i>. Use <b>AddCreateFlags</b> to set flags without clearing  flags that are already set.
     * @param {Integer} dwCreationFlags The flags that will be passed to the <i>dwCreationFlags</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreateprocessinputs-setcreateflags
     */
    SetCreateFlags(dwCreationFlags) {
        result := ComCall(4, this, "uint", dwCreationFlags, "HRESULT")
        return result
    }

    /**
     * Set additional flags that will be included in the call to CreateProcess.
     * @remarks
     * Any creation flags that were previously set will remain set. This method does not clear any creation flags.
     * @param {Integer} dwCreationFlags The flags that will be included in the <i>dwCreationFlags</i> parameter passed to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreateprocessinputs-addcreateflags
     */
    AddCreateFlags(dwCreationFlags) {
        result := ComCall(5, this, "uint", dwCreationFlags, "HRESULT")
        return result
    }

    /**
     * Sets the hot key for the application.
     * @remarks
     * This method also sets the <b>STARTF_USEHOTKEY</b> flag in the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @param {Integer} wHotKey The hotkey to assign to the application. See the documentation of the <b>hStdIn</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure for more information.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreateprocessinputs-sethotkey
     */
    SetHotKey(wHotKey) {
        result := ComCall(6, this, "ushort", wHotKey, "HRESULT")
        return result
    }

    /**
     * Additional flags that will be included in the STARTUPINFO structure passed to CreateProcess.
     * @remarks
     * Any creation flags that were previously set will remain set. This method does not clear any creation flags.
     * @param {Integer} dwStartupInfoFlags The flags that will be included in the <i>dwFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreateprocessinputs-addstartupflags
     */
    AddStartupFlags(dwStartupInfoFlags) {
        result := ComCall(7, this, "uint", dwStartupInfoFlags, "HRESULT")
        return result
    }

    /**
     * Sets the title that will be passed CreateProcess.
     * @param {PWSTR} pszTitle A null-terminated string specifying the title that will be passed in the <b>lpTitle</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>. This parameter may not be <b>NULL</b>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreateprocessinputs-settitle
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(8, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * Sets a variable in the environment of the created process.
     * @remarks
     * If a variable with the same name already exists in the environment of the created process, it is replaced.
     * @param {PWSTR} pszName A null-terminated string specifying the name of a variable to be set in the environment of the process to be created. This parameter may not be <b>NULL</b>.
     * @param {PWSTR} pszValue A null-terminated string specifying the value of the variable to be set in the environment of the process to be created. his parameter may not be <b>NULL</b>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreateprocessinputs-setenvironmentvariable
     */
    SetEnvironmentVariable(pszName, pszValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(9, this, "ptr", pszName, "ptr", pszValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICreateProcessInputs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCreateFlags := CallbackCreate(GetMethod(implObj, "GetCreateFlags"), flags, 2)
        this.vtbl.SetCreateFlags := CallbackCreate(GetMethod(implObj, "SetCreateFlags"), flags, 2)
        this.vtbl.AddCreateFlags := CallbackCreate(GetMethod(implObj, "AddCreateFlags"), flags, 2)
        this.vtbl.SetHotKey := CallbackCreate(GetMethod(implObj, "SetHotKey"), flags, 2)
        this.vtbl.AddStartupFlags := CallbackCreate(GetMethod(implObj, "AddStartupFlags"), flags, 2)
        this.vtbl.SetTitle := CallbackCreate(GetMethod(implObj, "SetTitle"), flags, 2)
        this.vtbl.SetEnvironmentVariable := CallbackCreate(GetMethod(implObj, "SetEnvironmentVariable"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCreateFlags)
        CallbackFree(this.vtbl.SetCreateFlags)
        CallbackFree(this.vtbl.AddCreateFlags)
        CallbackFree(this.vtbl.SetHotKey)
        CallbackFree(this.vtbl.AddStartupFlags)
        CallbackFree(this.vtbl.SetTitle)
        CallbackFree(this.vtbl.SetEnvironmentVariable)
    }
}
