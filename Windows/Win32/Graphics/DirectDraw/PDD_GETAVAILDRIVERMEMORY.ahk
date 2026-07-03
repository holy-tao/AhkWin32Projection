#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETAVAILDRIVERMEMORYDATA.ahk" { DD_GETAVAILDRIVERMEMORYDATA }

/**
 * The DdGetAvailDriverMemory callback function queries the amount of free memory in the driver-managed memory heap.
 * @remarks
 * This function does not need to be implemented if the memory will be managed by DirectDraw.
 * 
 * <b>DdGetAvailDriverMemory</b> determines how much free memory is in the driver's private heaps for the specified surface type. The driver should check the surface capabilities specified in the <b>DDSCaps</b> member of the following structure against the heaps it is maintaining internally, to determine what heap size to query. For example, if DDSCAPS_NONLOCALVIDMEM is set, the driver should return only contributions from the AGP heaps.
 * 
 * The driver indicates its support of <b>DdGetAvailDriverMemory</b> by implementing a response to GUID_MiscellaneousCallbacks in <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_getavaildrivermemory
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_GETAVAILDRIVERMEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PDD_GETAVAILDRIVERMEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETAVAILDRIVERMEMORYDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getavaildrivermemorydata">DD_GETAVAILDRIVERMEMORYDATA</a> structure that contains the information required to perform the query.
     * @returns {Integer} <b>DdGetAvailDriverMemory</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETAVAILDRIVERMEMORYDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_GETAVAILDRIVERMEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_GETAVAILDRIVERMEMORY {
        /**
         * Creates a PDD_GETAVAILDRIVERMEMORY pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETAVAILDRIVERMEMORYDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETAVAILDRIVERMEMORYDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
