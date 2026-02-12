#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarViewDayItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarViewDayItem
     * @type {Guid}
     */
    static IID => Guid("{0fdb2dc5-32c1-4b8f-befc-017b555b32d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBlackout", "put_IsBlackout", "get_Date", "SetDensityColors"]

    /**
     * @type {Boolean} 
     */
    IsBlackout {
        get => this.get_IsBlackout()
        set => this.put_IsBlackout(value)
    }

    /**
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBlackout() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsBlackout(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<Color>} colors_ 
     * @returns {HRESULT} 
     */
    SetDensityColors(colors_) {
        result := ComCall(9, this, "ptr", colors_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
