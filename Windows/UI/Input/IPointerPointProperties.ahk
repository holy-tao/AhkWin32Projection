#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IPointerPointProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointerPointProperties
     * @type {Guid}
     */
    static IID => Guid("{c79d8a4b-c163-4ee7-803f-67ce79f9972d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Pressure", "get_IsInverted", "get_IsEraser", "get_Orientation", "get_XTilt", "get_YTilt", "get_Twist", "get_ContactRect", "get_ContactRectRaw", "get_TouchConfidence", "get_IsLeftButtonPressed", "get_IsRightButtonPressed", "get_IsMiddleButtonPressed", "get_MouseWheelDelta", "get_IsHorizontalMouseWheel", "get_IsPrimary", "get_IsInRange", "get_IsCanceled", "get_IsBarrelButtonPressed", "get_IsXButton1Pressed", "get_IsXButton2Pressed", "get_PointerUpdateKind", "HasUsage", "GetUsageValue"]

    /**
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
    }

    /**
     * @type {Boolean} 
     */
    IsInverted {
        get => this.get_IsInverted()
    }

    /**
     * @type {Boolean} 
     */
    IsEraser {
        get => this.get_IsEraser()
    }

    /**
     * @type {Float} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * @type {Float} 
     */
    XTilt {
        get => this.get_XTilt()
    }

    /**
     * @type {Float} 
     */
    YTilt {
        get => this.get_YTilt()
    }

    /**
     * @type {Float} 
     */
    Twist {
        get => this.get_Twist()
    }

    /**
     * @type {RECT} 
     */
    ContactRect {
        get => this.get_ContactRect()
    }

    /**
     * @type {RECT} 
     */
    ContactRectRaw {
        get => this.get_ContactRectRaw()
    }

    /**
     * @type {Boolean} 
     */
    TouchConfidence {
        get => this.get_TouchConfidence()
    }

    /**
     * @type {Boolean} 
     */
    IsLeftButtonPressed {
        get => this.get_IsLeftButtonPressed()
    }

    /**
     * @type {Boolean} 
     */
    IsRightButtonPressed {
        get => this.get_IsRightButtonPressed()
    }

    /**
     * @type {Boolean} 
     */
    IsMiddleButtonPressed {
        get => this.get_IsMiddleButtonPressed()
    }

    /**
     * @type {Integer} 
     */
    MouseWheelDelta {
        get => this.get_MouseWheelDelta()
    }

    /**
     * @type {Boolean} 
     */
    IsHorizontalMouseWheel {
        get => this.get_IsHorizontalMouseWheel()
    }

    /**
     * @type {Boolean} 
     */
    IsPrimary {
        get => this.get_IsPrimary()
    }

    /**
     * @type {Boolean} 
     */
    IsInRange {
        get => this.get_IsInRange()
    }

    /**
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

    /**
     * @type {Boolean} 
     */
    IsBarrelButtonPressed {
        get => this.get_IsBarrelButtonPressed()
    }

    /**
     * @type {Boolean} 
     */
    IsXButton1Pressed {
        get => this.get_IsXButton1Pressed()
    }

    /**
     * @type {Boolean} 
     */
    IsXButton2Pressed {
        get => this.get_IsXButton2Pressed()
    }

    /**
     * @type {Integer} 
     */
    PointerUpdateKind {
        get => this.get_PointerUpdateKind()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pressure() {
        result := ComCall(6, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInverted() {
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
    get_IsEraser() {
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
    get_Orientation() {
        result := ComCall(9, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_XTilt() {
        result := ComCall(10, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YTilt() {
        result := ComCall(11, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Twist() {
        result := ComCall(12, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ContactRect() {
        value := RECT()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ContactRectRaw() {
        value := RECT()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TouchConfidence() {
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
    get_IsLeftButtonPressed() {
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
    get_IsRightButtonPressed() {
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
    get_IsMiddleButtonPressed() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MouseWheelDelta() {
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
    get_IsHorizontalMouseWheel() {
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
    get_IsPrimary() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInRange() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBarrelButtonPressed() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsXButton1Pressed() {
        result := ComCall(25, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsXButton2Pressed() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerUpdateKind() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {Boolean} 
     */
    HasUsage(usagePage, usageId) {
        result := ComCall(28, this, "uint", usagePage, "uint", usageId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} usagePage 
     * @param {Integer} usageId 
     * @returns {Integer} 
     */
    GetUsageValue(usagePage, usageId) {
        result := ComCall(29, this, "uint", usagePage, "uint", usageId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
