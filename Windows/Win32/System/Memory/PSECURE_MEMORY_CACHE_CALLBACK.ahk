#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

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
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nc-winnt-psecure_memory_cache_callback
 * @namespace Windows.Win32.System.Memory
 */
export default struct PSECURE_MEMORY_CACHE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PSECURE_MEMORY_CACHE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Addr The starting address of the memory range.
     * @param {Pointer} Range The size of the memory range, in bytes.
     * @returns {BOOLEAN} The return value indicates the success or failure of this function.
     * 
     * If the caller has secured the specified memory range, this function should unsecure the memory and return 
     *        <b>TRUE</b>.
     * 
     * If the caller has not secured the specified memory range, this function should return 
     *        <b>FALSE</b>.
     */
    Call(Addr, Range) {
        result := DllCall(this.value, IntPtr, Addr, IntPtr, Range, BOOLEAN)
        return result
    }

    /**
     * A PSECURE_MEMORY_CACHE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSECURE_MEMORY_CACHE_CALLBACK {
        /**
         * Creates a PSECURE_MEMORY_CACHE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
