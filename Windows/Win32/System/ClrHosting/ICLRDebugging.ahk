#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRDebugging extends IUnknown{
    /**
     * The interface identifier for ICLRDebugging
     * @type {Guid}
     */
    static IID => Guid("{d28f3c5a-9634-4206-a509-477552eefb10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} moduleBaseAddress 
     * @param {Pointer<IUnknown>} pDataTarget 
     * @param {Pointer<ICLRDebuggingLibraryProvider>} pLibraryProvider 
     * @param {Pointer<CLR_DEBUGGING_VERSION>} pMaxDebuggerSupportedVersion 
     * @param {Pointer<Guid>} riidProcess 
     * @param {Pointer<IUnknown>} ppProcess 
     * @param {Pointer<CLR_DEBUGGING_VERSION>} pVersion 
     * @param {Pointer<Int32>} pdwFlags 
     * @returns {HRESULT} 
     */
    OpenVirtualProcess(moduleBaseAddress, pDataTarget, pLibraryProvider, pMaxDebuggerSupportedVersion, riidProcess, ppProcess, pVersion, pdwFlags) {
        result := ComCall(3, this, "uint", moduleBaseAddress, "ptr", pDataTarget, "ptr", pLibraryProvider, "ptr", pMaxDebuggerSupportedVersion, "ptr", riidProcess, "ptr", ppProcess, "ptr", pVersion, "int*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMODULE} hModule 
     * @returns {HRESULT} 
     */
    CanUnloadNow(hModule) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        result := ComCall(4, this, "ptr", hModule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
