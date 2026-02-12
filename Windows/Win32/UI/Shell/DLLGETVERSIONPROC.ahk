#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by many of the Windows Shell DLLs to allow applications to obtain DLL-specific version information.
 * @remarks
 * This function is exported by name from each DLL that implements it. Currently, most of the Windows Shell and controls DLLs implement <b>DllGetVersion</b>. These include, but are not limited to, Shell32.dll, Comctl32.dll, Shdocvw.dll, and Shlwapi.dll.
 * 
 * To call this function, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to obtain the function pointer. The DLLGETVERSIONPROC type is used as the data type to define a pointer to a <b>DllGetVersion</b> function. Use the pointer when calling the function dynamically by loading the library and getting the function's address. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Shell and Shlwapi DLL Versions</a> for a detailed discussion of the different file versions, and how to use <b>DllGetVersion</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/shlwapi/nc-shlwapi-dllgetversionproc
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DLLGETVERSIONPROC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<DLLVERSIONINFO>} param0 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        result := ComCall(3, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
