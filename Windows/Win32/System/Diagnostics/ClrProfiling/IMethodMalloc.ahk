#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class IMethodMalloc extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMethodMalloc
     * @type {Guid}
     */
    static IID => Guid("{a0efb28b-6ee2-4d7b-b983-a75ef7beedb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Alloc"]

    /**
     * Allocates a block of memory of the specified size.
     * @remarks
     * The memory block returned by <b>AllocADsMem</b> is initialized to zero.
     * 
     * For more information and a code example that shows how to use the <b>AllocADsMem</b> function, see <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a>.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * Contains the size, in bytes, to be allocated.
     * @returns {Pointer<Void>} Type: <b>LPVOID</b>
     * 
     * When successful, the function returns a non-<b>NULL</b> pointer to the allocated memory. The caller must free this memory when it is no longer required by passing the returned pointer to <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a>.
     * 
     * Returns <b>NULL</b> if not successful. Call  <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">ADsGetLastError</a> to obtain extended error status. For more information about error code values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/adshlp/nf-adshlp-allocadsmem
     */
    Alloc(cb) {
        result := ComCall(3, this, "uint", cb, "ptr")
        return result
    }
}
