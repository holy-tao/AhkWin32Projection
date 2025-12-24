#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by the ICreatingProcess interface to alter some parameters of the process that is being created.
 * @remarks
 * 
 * Applications do not implement this interface.
 * 
 * A pointer to this interface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icreatingprocess-oncreating">ICreatingProcess::OnCreating</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icreateprocessinputs
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICreateProcessInputs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateProcessInputs
     * @type {Guid}
     */
    static IID => Guid("{f6ef6140-e26f-4d82-bac4-e9ba5fd239a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCreateFlags", "SetCreateFlags", "AddCreateFlags", "SetHotKey", "AddStartupFlags", "SetTitle", "SetEnvironmentVariable"]

    /**
     * Gets the additional flags that will be passed to CreateProcess.
     * @returns {Integer} A pointer to a <b>DWORD</b> which receives the flags that will be passed as the <i>dwCreationFlags</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icreateprocessinputs-getcreateflags
     */
    GetCreateFlags() {
        result := ComCall(3, this, "uint*", &pdwCreationFlags := 0, "HRESULT")
        return pdwCreationFlags
    }

    /**
     * Set the flags that will be included in the call to CreateProcess.
     * @param {Integer} dwCreationFlags The flags that will be passed to the <i>dwCreationFlags</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icreateprocessinputs-setcreateflags
     */
    SetCreateFlags(dwCreationFlags) {
        result := ComCall(4, this, "uint", dwCreationFlags, "HRESULT")
        return result
    }

    /**
     * Set additional flags that will be included in the call to CreateProcess.
     * @param {Integer} dwCreationFlags The flags that will be included in the <i>dwCreationFlags</i> parameter passed to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icreateprocessinputs-addcreateflags
     */
    AddCreateFlags(dwCreationFlags) {
        result := ComCall(5, this, "uint", dwCreationFlags, "HRESULT")
        return result
    }

    /**
     * Sets the hot key for the application.
     * @param {Integer} wHotKey The hotkey to assign to the application. See the documentation of the <b>hStdIn</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure for more information.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icreateprocessinputs-sethotkey
     */
    SetHotKey(wHotKey) {
        result := ComCall(6, this, "ushort", wHotKey, "HRESULT")
        return result
    }

    /**
     * Additional flags that will be included in the STARTUPINFO structure passed to CreateProcess.
     * @param {Integer} dwStartupInfoFlags The flags that will be included in the <i>dwFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icreateprocessinputs-addstartupflags
     */
    AddStartupFlags(dwStartupInfoFlags) {
        result := ComCall(7, this, "uint", dwStartupInfoFlags, "HRESULT")
        return result
    }

    /**
     * Sets the title that will be passed CreateProcess.
     * @param {PWSTR} pszTitle A null-terminated string specifying the title that will be passed in the <b>lpTitle</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>. This parameter may not be <b>NULL</b>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icreateprocessinputs-settitle
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(8, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * Sets a variable in the environment of the created process.
     * @param {PWSTR} pszName A null-terminated string specifying the name of a variable to be set in the environment of the process to be created. This parameter may not be <b>NULL</b>.
     * @param {PWSTR} pszValue A null-terminated string specifying the value of the variable to be set in the environment of the process to be created. his parameter may not be <b>NULL</b>.
     * @returns {HRESULT} <b> S_OK</b> if the method succeeds. Otherwise, an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icreateprocessinputs-setenvironmentvariable
     */
    SetEnvironmentVariable(pszName, pszValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(9, this, "ptr", pszName, "ptr", pszValue, "HRESULT")
        return result
    }
}
