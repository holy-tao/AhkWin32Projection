#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An application-defined function previously registered with the AddSecureMemoryCacheCallback function that is called when a secured memory range is freed or its protections are changed.
 * @remarks
 * After the callback function is registered, it is called after any attempt to free the specified memory range 
 *     or change its protections. If the application has secured any part of the specified memory range, the callback 
 *     function must invalidate all of the application's cached memory mappings for the secured memory range, unsecure 
 *     the secured parts of the memory range, and return <b>TRUE</b>. Otherwise it must  return 
 *     <b>FALSE</b>.
 * 
 * The application secures and unsecures a memory range by sending requests to a device driver, which uses the 
 *     MmSecureVirtualMemory and 
 *     MmUnsecureVirtualMemory 
 *     functions to actually secure and unsecure the range. Operations on other types of secured or locked memory do not 
 *     trigger this callback.
 * 
 * Examples of function calls that trigger the callback function include calls to the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfree">VirtualFree</a>, 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualfreeex">VirtualFreeEx</a>, 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualprotect">VirtualProtect</a>, 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualprotectex">VirtualProtectEx</a>, and 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-unmapviewoffile">UnmapViewOfFile</a> functions.
 * 
 * The callback function can also be triggered by a heap operation. In this case, the function must not perform 
 *     any further operations on the heap that triggered the callback. This includes calling 
 *     <a href="https://docs.microsoft.com/windows/desktop/Memory/heap-functions">heap functions</a> on a private heap or the process's default 
 *     heap, or calling standard library functions such as <b>malloc</b> and 
 *     <b>free</b>, which implicitly use the process's default heap.
 * 
 * To unregister the callback function, use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-removesecurememorycachecallback">RemoveSecureMemoryCacheCallback</a> 
 *     function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winnt/nc-winnt-psecure_memory_cache_callback
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class PSECURE_MEMORY_CACHE_CALLBACK extends IUnknown {

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
     * @param {Pointer} Addr 
     * @param {Pointer} Range 
     * @returns {BOOLEAN} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Addr, Range) {
        result := ComCall(3, this, "ptr", Addr, "ptr", Range, "char")
        return result
    }
}
