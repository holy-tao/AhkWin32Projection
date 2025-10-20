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
     * 
     * @param {Pointer<UInt32>} pdwCreationFlags 
     * @returns {HRESULT} 
     */
    GetCreateFlags(pdwCreationFlags) {
        result := ComCall(3, this, "uint*", pdwCreationFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCreationFlags 
     * @returns {HRESULT} 
     */
    SetCreateFlags(dwCreationFlags) {
        result := ComCall(4, this, "uint", dwCreationFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCreationFlags 
     * @returns {HRESULT} 
     */
    AddCreateFlags(dwCreationFlags) {
        result := ComCall(5, this, "uint", dwCreationFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wHotKey 
     * @returns {HRESULT} 
     */
    SetHotKey(wHotKey) {
        result := ComCall(6, this, "ushort", wHotKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStartupInfoFlags 
     * @returns {HRESULT} 
     */
    AddStartupFlags(dwStartupInfoFlags) {
        result := ComCall(7, this, "uint", dwStartupInfoFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszTitle 
     * @returns {HRESULT} 
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(8, this, "ptr", pszTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the contents of the specified environment variable for the current process.
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszValue 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setenvironmentvariable
     */
    SetEnvironmentVariable(pszName, pszValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(9, this, "ptr", pszName, "ptr", pszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
