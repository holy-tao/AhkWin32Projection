#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ILineSegment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineSegment
     * @type {Guid}
     */
    static IID => Guid("{ef6a2e25-3ff0-4420-a411-7182a4cecb15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Point", "put_Point"]

    /**
     * @type {POINT} 
     */
    Point {
        get => this.get_Point()
        set => this.put_Point(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point() {
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
    put_Point(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
