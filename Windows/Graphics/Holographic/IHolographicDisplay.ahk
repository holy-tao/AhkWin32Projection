#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include .\HolographicAdapterId.ahk
#Include ..\..\Perception\Spatial\SpatialLocator.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicDisplay extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicDisplay
     * @type {Guid}
     */
    static IID => Guid("{9acea414-1d9f-4090-a388-90c06f6eae9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "get_MaxViewportSize", "get_IsStereo", "get_IsOpaque", "get_AdapterId", "get_SpatialLocator"]

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {SIZE} 
     */
    MaxViewportSize {
        get => this.get_MaxViewportSize()
    }

    /**
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * @type {Boolean} 
     */
    IsOpaque {
        get => this.get_IsOpaque()
    }

    /**
     * @type {HolographicAdapterId} 
     */
    AdapterId {
        get => this.get_AdapterId()
    }

    /**
     * @type {SpatialLocator} 
     */
    SpatialLocator {
        get => this.get_SpatialLocator()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MaxViewportSize() {
        value := SIZE()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpaque() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HolographicAdapterId} 
     */
    get_AdapterId() {
        value := HolographicAdapterId()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SpatialLocator} 
     */
    get_SpatialLocator() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialLocator(value)
    }
}
