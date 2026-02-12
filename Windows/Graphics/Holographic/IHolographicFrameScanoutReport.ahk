#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicFrameRenderingReport.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicFrameScanoutReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicFrameScanoutReport
     * @type {Guid}
     */
    static IID => Guid("{0ebbe606-03a0-5ca0-b46e-bba068d7233f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RenderingReport", "get_MissedScanoutCount", "get_SystemRelativeLatchTime", "get_SystemRelativeScanoutStartTime", "get_SystemRelativePhotonTime"]

    /**
     * @type {HolographicFrameRenderingReport} 
     */
    RenderingReport {
        get => this.get_RenderingReport()
    }

    /**
     * @type {Integer} 
     */
    MissedScanoutCount {
        get => this.get_MissedScanoutCount()
    }

    /**
     * @type {TimeSpan} 
     */
    SystemRelativeLatchTime {
        get => this.get_SystemRelativeLatchTime()
    }

    /**
     * @type {TimeSpan} 
     */
    SystemRelativeScanoutStartTime {
        get => this.get_SystemRelativeScanoutStartTime()
    }

    /**
     * @type {TimeSpan} 
     */
    SystemRelativePhotonTime {
        get => this.get_SystemRelativePhotonTime()
    }

    /**
     * 
     * @returns {HolographicFrameRenderingReport} 
     */
    get_RenderingReport() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicFrameRenderingReport(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MissedScanoutCount() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeLatchTime() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeScanoutStartTime() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativePhotonTime() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
