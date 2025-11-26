#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDebug.ahk

/**
 * Controls debug settings for Microsoft DirectX Graphics Infrastructure (DXGI). You can use the IDXGIDebug1 interface in Windows Store apps.
 * @remarks
 * 
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-dxgigetdebuginterface1">DXGIGetDebugInterface1</a> function to obtain the <b>IDXGIDebug1</b> interface.
 * 
 * The <b>IDXGIDebug1</b> interface can be used only if the debug layer is turned on. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">Debug Layer</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nn-dxgidebug-idxgidebug1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDebug1 extends IDXGIDebug{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDebug1
     * @type {Guid}
     */
    static IID => Guid("{c5a05f0c-16f2-4adf-9f4d-a8c4d58ac550}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableLeakTrackingForThread", "DisableLeakTrackingForThread", "IsLeakTrackingEnabledForThread"]

    /**
     * Starts tracking leaks for the current thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgidebug1-enableleaktrackingforthread
     */
    EnableLeakTrackingForThread() {
        ComCall(4, this)
    }

    /**
     * Stops tracking leaks for the current thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgidebug1-disableleaktrackingforthread
     */
    DisableLeakTrackingForThread() {
        ComCall(5, this)
    }

    /**
     * Gets a value indicating whether leak tracking is turned on for the current thread.
     * @returns {BOOL} <b>TRUE</b> if leak tracking is turned on for the current thread; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgidebug1-isleaktrackingenabledforthread
     */
    IsLeakTrackingEnabledForThread() {
        result := ComCall(6, this, "int")
        return result
    }
}
