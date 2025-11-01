#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo10.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo11 extends ICorProfilerInfo10{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo11
     * @type {Guid}
     */
    static IID => Guid("{06398876-8987-4154-b621-40a00d6e4d04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 99

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnvironmentVariableA", "SetEnvironmentVariable"]

    /**
     * Retrieves the contents of the specified variable from the environment block of the calling process.
     * @param {PWSTR} szName 
     * @param {Integer} cchValue 
     * @param {Pointer<Integer>} pcchValue 
     * @param {PWSTR} szValue 
     * @returns {HRESULT} If the function succeeds, the return value is the number of characters stored in the buffer pointed to by *lpBuffer*, not including the terminating null character.
     * 
     * If *lpBuffer* is not large enough to hold the data, the return value is the buffer size, in characters, required to hold the string and its terminating null character and the contents of *lpBuffer* are undefined.
     * 
     * If the function fails, the return value is zero. If the specified environment variable was not found in the environment block, 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_ENVVAR_NOT_FOUND.
     * @see https://docs.microsoft.com/windows/win32/api//processenv/nf-processenv-getenvironmentvariablea
     */
    GetEnvironmentVariableA(szName, cchValue, pcchValue, szValue) {
        szName := szName is String ? StrPtr(szName) : szName
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(99, this, "ptr", szName, "uint", cchValue, "uint*", pcchValue, "ptr", szValue, "HRESULT")
        return result
    }

    /**
     * Sets the contents of the specified environment variable for the current process.
     * @param {PWSTR} szName 
     * @param {PWSTR} szValue 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setenvironmentvariable
     */
    SetEnvironmentVariable(szName, szValue) {
        szName := szName is String ? StrPtr(szName) : szName
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(100, this, "ptr", szName, "ptr", szValue, "HRESULT")
        return result
    }
}
