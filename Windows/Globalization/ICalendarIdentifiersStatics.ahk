#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ICalendarIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{80653f68-2cb2-4c1f-b590-f0f52bf4fd1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Gregorian", "get_Hebrew", "get_Hijri", "get_Japanese", "get_Julian", "get_Korean", "get_Taiwan", "get_Thai", "get_UmAlQura"]

    /**
     * @type {HSTRING} 
     */
    Gregorian {
        get => this.get_Gregorian()
    }

    /**
     * @type {HSTRING} 
     */
    Hebrew {
        get => this.get_Hebrew()
    }

    /**
     * @type {HSTRING} 
     */
    Hijri {
        get => this.get_Hijri()
    }

    /**
     * @type {HSTRING} 
     */
    Japanese {
        get => this.get_Japanese()
    }

    /**
     * @type {HSTRING} 
     */
    Julian {
        get => this.get_Julian()
    }

    /**
     * @type {HSTRING} 
     */
    Korean {
        get => this.get_Korean()
    }

    /**
     * @type {HSTRING} 
     */
    Taiwan {
        get => this.get_Taiwan()
    }

    /**
     * @type {HSTRING} 
     */
    Thai {
        get => this.get_Thai()
    }

    /**
     * @type {HSTRING} 
     */
    UmAlQura {
        get => this.get_UmAlQura()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Gregorian() {
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
    get_Hebrew() {
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
    get_Hijri() {
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
    get_Japanese() {
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
    get_Julian() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Korean() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Taiwan() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Thai() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UmAlQura() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
