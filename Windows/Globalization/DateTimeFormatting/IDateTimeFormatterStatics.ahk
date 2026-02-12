#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DateTimeFormatter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class IDateTimeFormatterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDateTimeFormatterStatics
     * @type {Guid}
     */
    static IID => Guid("{bfcde7c0-df4c-4a2e-9012-f47daf3f1212}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LongDate", "get_LongTime", "get_ShortDate", "get_ShortTime"]

    /**
     * @type {DateTimeFormatter} 
     */
    LongDate {
        get => this.get_LongDate()
    }

    /**
     * @type {DateTimeFormatter} 
     */
    LongTime {
        get => this.get_LongTime()
    }

    /**
     * @type {DateTimeFormatter} 
     */
    ShortDate {
        get => this.get_ShortDate()
    }

    /**
     * @type {DateTimeFormatter} 
     */
    ShortTime {
        get => this.get_ShortTime()
    }

    /**
     * 
     * @returns {DateTimeFormatter} 
     */
    get_LongDate() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(value)
    }

    /**
     * 
     * @returns {DateTimeFormatter} 
     */
    get_LongTime() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(value)
    }

    /**
     * 
     * @returns {DateTimeFormatter} 
     */
    get_ShortDate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(value)
    }

    /**
     * 
     * @returns {DateTimeFormatter} 
     */
    get_ShortTime() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(value)
    }
}
