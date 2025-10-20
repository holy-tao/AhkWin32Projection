#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISynchronize.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeMutex extends ISynchronize{
    /**
     * The interface identifier for ISynchronizeMutex
     * @type {Guid}
     */
    static IID => Guid("{00000025-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * Releases ownership of the specified mutex object.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-releasemutex
     */
    ReleaseMutex() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
