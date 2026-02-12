#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector2.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICubicBezierEasingFunction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICubicBezierEasingFunction
     * @type {Guid}
     */
    static IID => Guid("{32350666-c1e8-44f9-96b8-c98acf0ae698}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ControlPoint1", "get_ControlPoint2"]

    /**
     * @type {Vector2} 
     */
    ControlPoint1 {
        get => this.get_ControlPoint1()
    }

    /**
     * @type {Vector2} 
     */
    ControlPoint2 {
        get => this.get_ControlPoint2()
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_ControlPoint1() {
        value := Vector2()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_ControlPoint2() {
        value := Vector2()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
