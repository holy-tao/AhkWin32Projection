#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IRectangleGeometry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRectangleGeometry
     * @type {Guid}
     */
    static IID => Guid("{a25a1f58-c575-4196-91cf-9fdfb10445c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Rect", "put_Rect"]

    /**
     * @type {RECT} 
     */
    Rect {
        get => this.get_Rect()
        set => this.put_Rect(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Rect() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_Rect(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
