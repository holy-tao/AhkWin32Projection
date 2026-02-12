#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicFramePresentationReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicFramePresentationReport
     * @type {Guid}
     */
    static IID => Guid("{80baf614-f2f4-4c8a-8de3-065c78f6d5de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CompositorGpuDuration", "get_AppGpuDuration", "get_AppGpuOverrun", "get_MissedPresentationOpportunityCount", "get_PresentationCount"]

    /**
     * @type {TimeSpan} 
     */
    CompositorGpuDuration {
        get => this.get_CompositorGpuDuration()
    }

    /**
     * @type {TimeSpan} 
     */
    AppGpuDuration {
        get => this.get_AppGpuDuration()
    }

    /**
     * @type {TimeSpan} 
     */
    AppGpuOverrun {
        get => this.get_AppGpuOverrun()
    }

    /**
     * @type {Integer} 
     */
    MissedPresentationOpportunityCount {
        get => this.get_MissedPresentationOpportunityCount()
    }

    /**
     * @type {Integer} 
     */
    PresentationCount {
        get => this.get_PresentationCount()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CompositorGpuDuration() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AppGpuDuration() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AppGpuOverrun() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MissedPresentationOpportunityCount() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresentationCount() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
