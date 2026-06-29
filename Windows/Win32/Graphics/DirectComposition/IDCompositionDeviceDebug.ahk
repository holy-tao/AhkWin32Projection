#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to rendering features that help with application debugging and performance tuning. This interface can be queried from the DirectComposition device interface.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiondevicedebug
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionDeviceDebug extends IUnknown {
    /**
     * The interface identifier for IDCompositionDeviceDebug
     * @type {Guid}
     */
    static IID := Guid("{a1a3c64a-224f-4a81-9773-4f03a89d3c6c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionDeviceDebug interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableDebugCounters  : IntPtr
        DisableDebugCounters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionDeviceDebug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables display of performance debugging counters.
     * @remarks
     * Performance counters are displayed on the top-right corner of the screen. From left to right, Microsoft DirectComposition displays the following information:
     * 
     * 
     * 
     * <ul>
     * <li>The composition engine frame rate, in frames per second, averaged over the last 60 composition frames</li>
     * <li>The overall CPU usage of the composition thread, in milliseconds
     * </li>
     * </ul>
     * The DirectComposition composition engine operates on the entire desktop all at once, so the performance counters measure the total cost of desktop composition, not just the cost of any one particular application. If the application occupies the entire screen, however, it is reasonable to assume that all of the composition cost is due to that one application.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevicedebug-enabledebugcounters
     */
    EnableDebugCounters() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Disables display of performance debugging counters.
     * @remarks
     * Microsoft DirectComposition keeps a count of how many DirectComposition devices have performance counters enabled, for the entire desktop session. If the count is non-zero, the performance counters are displayed. Therefore, disabling the counters may not make them go away if another device is also requesting display of the counters.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevicedebug-disabledebugcounters
     */
    DisableDebugCounters() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionDeviceDebug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableDebugCounters := CallbackCreate(GetMethod(implObj, "EnableDebugCounters"), flags, 1)
        this.vtbl.DisableDebugCounters := CallbackCreate(GetMethod(implObj, "DisableDebugCounters"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableDebugCounters)
        CallbackFree(this.vtbl.DisableDebugCounters)
    }
}
