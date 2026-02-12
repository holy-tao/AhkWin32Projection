#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialInteractionControllerProperties.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionSourceState2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionSourceState2
     * @type {Guid}
     */
    static IID => Guid("{45f6d0bd-1773-492e-9ba3-8ac1cbe77c08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSelectPressed", "get_IsMenuPressed", "get_IsGrasped", "get_SelectPressedValue", "get_ControllerProperties"]

    /**
     * @type {Boolean} 
     */
    IsSelectPressed {
        get => this.get_IsSelectPressed()
    }

    /**
     * @type {Boolean} 
     */
    IsMenuPressed {
        get => this.get_IsMenuPressed()
    }

    /**
     * @type {Boolean} 
     */
    IsGrasped {
        get => this.get_IsGrasped()
    }

    /**
     * @type {Float} 
     */
    SelectPressedValue {
        get => this.get_SelectPressedValue()
    }

    /**
     * @type {SpatialInteractionControllerProperties} 
     */
    ControllerProperties {
        get => this.get_ControllerProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelectPressed() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMenuPressed() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGrasped() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SelectPressedValue() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SpatialInteractionControllerProperties} 
     */
    get_ControllerProperties() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteractionControllerProperties(value)
    }
}
