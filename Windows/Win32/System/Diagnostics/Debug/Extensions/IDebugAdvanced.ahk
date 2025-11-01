#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugAdvanced extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugAdvanced
     * @type {Guid}
     */
    static IID => Guid("{f2df5f53-071f-47bd-9de6-5734c3fed689}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThreadContext", "SetThreadContext"]

    /**
     * Retrieves the context of the specified thread.
     * @param {Pointer} Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThreadContext(Context, ContextSize) {
        result := ComCall(3, this, "ptr", Context, "uint", ContextSize, "HRESULT")
        return result
    }

    /**
     * Sets the context for the specified thread.
     * @param {Pointer} Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the context was set, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadcontext
     */
    SetThreadContext(Context, ContextSize) {
        result := ComCall(4, this, "ptr", Context, "uint", ContextSize, "HRESULT")
        return result
    }
}
