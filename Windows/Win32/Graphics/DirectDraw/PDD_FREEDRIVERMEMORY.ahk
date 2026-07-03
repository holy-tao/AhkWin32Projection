#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_FREEDRIVERMEMORYDATA.ahk" { DD_FREEDRIVERMEMORYDATA }

/**
 * The DdFreeDriverMemory callback function frees offscreen or nonlocal display memory to satisfy a new allocation request.
 * @remarks
 * The driver should implement <b>DdFreeDriverMemory</b> when it has DirectDraw manage all offscreen display memory management, including allocations for <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvcreatedevicebitmap">DrvCreateDeviceBitmap</a>. DirectDraw requests for allocations in offscreen memory should always take precedence over GDI device bitmap allocations.
 * 
 * DirectDraw calls <b>DdFreeDriverMemory</b> when it does not have enough offscreen or nonlocal display memory to allocate a surface requested by an application. The driver should move a GDI device bitmap from offscreen memory into system memory and then immediately return. Bitmap moves can be accomplished by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engmodifysurface">EngModifySurface</a>.
 * 
 * DirectDraw will continually call <b>DdFreeDriverMemory</b> until there is enough offscreen memory from which to allocate the requested surface or until the driver returns DDERR_OUTOFMEMORY.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_freedrivermemory
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_FREEDRIVERMEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PDD_FREEDRIVERMEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_FREEDRIVERMEMORYDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_freedrivermemorydata">DD_FREEDRIVERMEMORYDATA</a> structure that contains the details of the free request.
     * @returns {Integer} <b>DdFreeDriverMemory</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_FREEDRIVERMEMORYDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_FREEDRIVERMEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_FREEDRIVERMEMORY {
        /**
         * Creates a PDD_FREEDRIVERMEMORY pointer that invokes the given AHK function when called.
         * @param {Func(DD_FREEDRIVERMEMORYDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_FREEDRIVERMEMORYDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
