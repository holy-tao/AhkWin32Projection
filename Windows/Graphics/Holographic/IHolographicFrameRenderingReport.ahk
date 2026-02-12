#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicFrameId.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicFrameRenderingReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicFrameRenderingReport
     * @type {Guid}
     */
    static IID => Guid("{05f32de4-e384-51b3-b934-f0d3a0f78606}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameId", "get_MissedLatchCount", "get_SystemRelativeFrameReadyTime", "get_SystemRelativeActualGpuFinishTime", "get_SystemRelativeTargetLatchTime"]

    /**
     * @type {HolographicFrameId} 
     */
    FrameId {
        get => this.get_FrameId()
    }

    /**
     * @type {Integer} 
     */
    MissedLatchCount {
        get => this.get_MissedLatchCount()
    }

    /**
     * @type {TimeSpan} 
     */
    SystemRelativeFrameReadyTime {
        get => this.get_SystemRelativeFrameReadyTime()
    }

    /**
     * @type {TimeSpan} 
     */
    SystemRelativeActualGpuFinishTime {
        get => this.get_SystemRelativeActualGpuFinishTime()
    }

    /**
     * @type {TimeSpan} 
     */
    SystemRelativeTargetLatchTime {
        get => this.get_SystemRelativeTargetLatchTime()
    }

    /**
     * 
     * @returns {HolographicFrameId} 
     */
    get_FrameId() {
        value := HolographicFrameId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MissedLatchCount() {
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
    get_SystemRelativeFrameReadyTime() {
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
    get_SystemRelativeActualGpuFinishTime() {
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
    get_SystemRelativeTargetLatchTime() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
