#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayCapabilities
     * @type {Guid}
     */
    static IID => Guid("{5a15b5d1-8dc5-4b9c-9172-303e47b70c55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsStatisticsReportingSupported", "get_IsStatisticsUpdatingSupported", "get_PowerReportingType", "get_CanChangeScreenSize", "get_CanDisplayBitmaps", "get_CanReadCharacterAtCursor", "get_CanMapCharacterSets", "get_CanDisplayCustomGlyphs", "get_CanReverse", "get_CanBlink", "get_CanChangeBlinkRate", "get_IsBrightnessSupported", "get_IsCursorSupported", "get_IsHorizontalMarqueeSupported", "get_IsVerticalMarqueeSupported", "get_IsInterCharacterWaitSupported", "get_SupportedDescriptors", "get_SupportedWindows"]

    /**
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * @type {Boolean} 
     */
    CanChangeScreenSize {
        get => this.get_CanChangeScreenSize()
    }

    /**
     * @type {Boolean} 
     */
    CanDisplayBitmaps {
        get => this.get_CanDisplayBitmaps()
    }

    /**
     * @type {Boolean} 
     */
    CanReadCharacterAtCursor {
        get => this.get_CanReadCharacterAtCursor()
    }

    /**
     * @type {Boolean} 
     */
    CanMapCharacterSets {
        get => this.get_CanMapCharacterSets()
    }

    /**
     * @type {Boolean} 
     */
    CanDisplayCustomGlyphs {
        get => this.get_CanDisplayCustomGlyphs()
    }

    /**
     * @type {Integer} 
     */
    CanReverse {
        get => this.get_CanReverse()
    }

    /**
     * @type {Integer} 
     */
    CanBlink {
        get => this.get_CanBlink()
    }

    /**
     * @type {Boolean} 
     */
    CanChangeBlinkRate {
        get => this.get_CanChangeBlinkRate()
    }

    /**
     * @type {Boolean} 
     */
    IsBrightnessSupported {
        get => this.get_IsBrightnessSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsCursorSupported {
        get => this.get_IsCursorSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsHorizontalMarqueeSupported {
        get => this.get_IsHorizontalMarqueeSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsVerticalMarqueeSupported {
        get => this.get_IsVerticalMarqueeSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsInterCharacterWaitSupported {
        get => this.get_IsInterCharacterWaitSupported()
    }

    /**
     * @type {Integer} 
     */
    SupportedDescriptors {
        get => this.get_SupportedDescriptors()
    }

    /**
     * @type {Integer} 
     */
    SupportedWindows {
        get => this.get_SupportedWindows()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsReportingSupported() {
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
    get_IsStatisticsUpdatingSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PowerReportingType() {
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
    get_CanChangeScreenSize() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDisplayBitmaps() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReadCharacterAtCursor() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMapCharacterSets() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDisplayCustomGlyphs() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CanReverse() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CanBlink() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanChangeBlinkRate() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBrightnessSupported() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCursorSupported() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalMarqueeSupported() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVerticalMarqueeSupported() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterCharacterWaitSupported() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedDescriptors() {
        result := ComCall(22, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedWindows() {
        result := ComCall(23, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
