#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ICalendarIdentifiersStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarIdentifiersStatics3
     * @type {Guid}
     */
    static IID => Guid("{2c225423-1fad-40c0-9334-a8eb90db04f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChineseLunar", "get_JapaneseLunar", "get_KoreanLunar", "get_TaiwanLunar", "get_VietnameseLunar"]

    /**
     * @type {HSTRING} 
     */
    ChineseLunar {
        get => this.get_ChineseLunar()
    }

    /**
     * @type {HSTRING} 
     */
    JapaneseLunar {
        get => this.get_JapaneseLunar()
    }

    /**
     * @type {HSTRING} 
     */
    KoreanLunar {
        get => this.get_KoreanLunar()
    }

    /**
     * @type {HSTRING} 
     */
    TaiwanLunar {
        get => this.get_TaiwanLunar()
    }

    /**
     * @type {HSTRING} 
     */
    VietnameseLunar {
        get => this.get_VietnameseLunar()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ChineseLunar() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JapaneseLunar() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KoreanLunar() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaiwanLunar() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VietnameseLunar() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
