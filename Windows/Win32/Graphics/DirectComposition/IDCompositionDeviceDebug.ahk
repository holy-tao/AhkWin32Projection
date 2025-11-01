#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to rendering features that help with application debugging and performance tuning. This interface can be queried from the DirectComposition device interface.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiondevicedebug
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevicedebug-enabledebugcounters
     */
    EnableDebugCounters() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiondevicedebug-disabledebugcounters
     */
    DisableDebugCounters() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
