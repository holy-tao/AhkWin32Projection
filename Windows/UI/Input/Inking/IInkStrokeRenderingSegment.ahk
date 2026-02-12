#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStrokeRenderingSegment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokeRenderingSegment
     * @type {Guid}
     */
    static IID => Guid("{68510f1f-88e3-477a-a2fa-569f5f1f9bd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "get_BezierControlPoint1", "get_BezierControlPoint2", "get_Pressure", "get_TiltX", "get_TiltY", "get_Twist"]

    /**
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {POINT} 
     */
    BezierControlPoint1 {
        get => this.get_BezierControlPoint1()
    }

    /**
     * @type {POINT} 
     */
    BezierControlPoint2 {
        get => this.get_BezierControlPoint2()
    }

    /**
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
    }

    /**
     * @type {Float} 
     */
    TiltX {
        get => this.get_TiltX()
    }

    /**
     * @type {Float} 
     */
    TiltY {
        get => this.get_TiltY()
    }

    /**
     * @type {Float} 
     */
    Twist {
        get => this.get_Twist()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        value := POINT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_BezierControlPoint1() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_BezierControlPoint2() {
        value := POINT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pressure() {
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
    get_TiltX() {
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
    get_TiltY() {
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
}
