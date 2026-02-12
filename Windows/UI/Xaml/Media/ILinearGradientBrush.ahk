#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ILinearGradientBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILinearGradientBrush
     * @type {Guid}
     */
    static IID => Guid("{8e96d16b-bb84-4c6f-9dbf-9d6c5c6d9c39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartPoint", "put_StartPoint", "get_EndPoint", "put_EndPoint"]

    /**
     * @type {POINT} 
     */
    StartPoint {
        get => this.get_StartPoint()
        set => this.put_StartPoint(value)
    }

    /**
     * @type {POINT} 
     */
    EndPoint {
        get => this.get_EndPoint()
        set => this.put_EndPoint(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_StartPoint() {
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
    put_StartPoint(value) {
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
    get_EndPoint() {
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
    put_EndPoint(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
