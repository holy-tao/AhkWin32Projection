#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicFrameScanoutMonitor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicSpace3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicSpace3
     * @type {Guid}
     */
    static IID => Guid("{df1733d1-f224-587e-8d71-1e8fc8f07b1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFrameScanoutMonitor"]

    /**
     * 
     * @param {Integer} maxQueuedReports 
     * @returns {HolographicFrameScanoutMonitor} 
     */
    CreateFrameScanoutMonitor(maxQueuedReports) {
        result := ComCall(6, this, "uint", maxQueuedReports, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicFrameScanoutMonitor(result_)
    }
}
