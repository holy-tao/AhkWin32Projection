#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IDigitalWindowCapability extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDigitalWindowCapability
     * @type {Guid}
     */
    static IID => Guid("{d78bad2c-f721-5244-a196-b56ccbec606c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Width", "get_Height", "get_MinScaleValue", "get_MaxScaleValue", "get_MinScaleValueWithoutUpsampling", "get_NormalizedFieldOfViewLimit"]

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {Float} 
     */
    MinScaleValue {
        get => this.get_MinScaleValue()
    }

    /**
     * @type {Float} 
     */
    MaxScaleValue {
        get => this.get_MaxScaleValue()
    }

    /**
     * @type {Float} 
     */
    MinScaleValueWithoutUpsampling {
        get => this.get_MinScaleValueWithoutUpsampling()
    }

    /**
     * @type {RECT} 
     */
    NormalizedFieldOfViewLimit {
        get => this.get_NormalizedFieldOfViewLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinScaleValue() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxScaleValue() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinScaleValueWithoutUpsampling() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_NormalizedFieldOfViewLimit() {
        value := RECT()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
