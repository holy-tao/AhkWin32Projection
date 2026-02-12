#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class ILocalLocationHoursOfOperationItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocalLocationHoursOfOperationItem
     * @type {Guid}
     */
    static IID => Guid("{23548c72-a1c7-43f1-a4f0-1091c39ec640}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Day", "get_Start", "get_Span"]

    /**
     * @type {Integer} 
     */
    Day {
        get => this.get_Day()
    }

    /**
     * @type {TimeSpan} 
     */
    Start {
        get => this.get_Start()
    }

    /**
     * @type {TimeSpan} 
     */
    Span {
        get => this.get_Span()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Day() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Start() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Span() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
