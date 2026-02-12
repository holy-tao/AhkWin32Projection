#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to rendering features that help with application debugging and performance tuning. This interface can be queried from the DirectComposition device interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositiondevicedebug
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDeviceDebug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDeviceDebug
     * @type {Guid}
     */
    static IID => Guid("{a1a3c64a-224f-4a81-9773-4f03a89d3c6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableDebugCounters", "DisableDebugCounters"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevicedebug-enabledebugcounters
     */
    EnableDebugCounters() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disables display of performance debugging counters.
     * @remarks
     * Microsoft DirectComposition keeps a count of how many DirectComposition devices have performance counters enabled, for the entire desktop session. If the count is non-zero, the performance counters are displayed. Therefore, disabling the counters may not make them go away if another device is also requesting display of the counters.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositiondevicedebug-disabledebugcounters
     */
    DisableDebugCounters() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
