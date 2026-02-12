#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IKeySpline extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeySpline
     * @type {Guid}
     */
    static IID => Guid("{77a163bb-d5ca-4a32-ba0b-7dff988e58a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ControlPoint1", "put_ControlPoint1", "get_ControlPoint2", "put_ControlPoint2"]

    /**
     * @type {POINT} 
     */
    ControlPoint1 {
        get => this.get_ControlPoint1()
        set => this.put_ControlPoint1(value)
    }

    /**
     * @type {POINT} 
     */
    ControlPoint2 {
        get => this.get_ControlPoint2()
        set => this.put_ControlPoint2(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_ControlPoint1() {
        value := POINT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_ControlPoint1(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_ControlPoint2() {
        value := POINT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_ControlPoint2(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
