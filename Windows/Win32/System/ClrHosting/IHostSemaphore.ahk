#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostSemaphore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostSemaphore
     * @type {Guid}
     */
    static IID => Guid("{855efd47-cc09-463a-a97d-16acab882661}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Wait", "ReleaseSemaphore"]

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Wait(dwMilliseconds, option) {
        result := ComCall(3, this, "uint", dwMilliseconds, "uint", option, "HRESULT")
        return result
    }

    /**
     * Increases the count of the specified semaphore object by a specified amount.
     * @param {Integer} lReleaseCount The amount by which the semaphore object's current count is to be increased. The value must be greater than zero. If the specified amount would cause the semaphore's count to exceed the maximum count that was specified when the semaphore was created, the count is not changed and the function returns <b>FALSE</b>.
     * @returns {Integer} A pointer to a variable to receive the previous count for the semaphore. This parameter can be <b>NULL</b> if the previous count is not required.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-releasesemaphore
     */
    ReleaseSemaphore(lReleaseCount) {
        result := ComCall(4, this, "int", lReleaseCount, "int*", &lpPreviousCount := 0, "HRESULT")
        return lpPreviousCount
    }
}
