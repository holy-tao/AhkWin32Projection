#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class INumeralSystemIdentifiersStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumeralSystemIdentifiersStatics2
     * @type {Guid}
     */
    static IID => Guid("{7f003228-9ddb-4a34-9104-0260c091a7c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Brah", "get_Osma", "get_MathBold", "get_MathDbl", "get_MathSans", "get_MathSanb", "get_MathMono", "get_ZmthBold", "get_ZmthDbl", "get_ZmthSans", "get_ZmthSanb", "get_ZmthMono"]

    /**
     * @type {HSTRING} 
     */
    Brah {
        get => this.get_Brah()
    }

    /**
     * @type {HSTRING} 
     */
    Osma {
        get => this.get_Osma()
    }

    /**
     * @type {HSTRING} 
     */
    MathBold {
        get => this.get_MathBold()
    }

    /**
     * @type {HSTRING} 
     */
    MathDbl {
        get => this.get_MathDbl()
    }

    /**
     * @type {HSTRING} 
     */
    MathSans {
        get => this.get_MathSans()
    }

    /**
     * @type {HSTRING} 
     */
    MathSanb {
        get => this.get_MathSanb()
    }

    /**
     * @type {HSTRING} 
     */
    MathMono {
        get => this.get_MathMono()
    }

    /**
     * @type {HSTRING} 
     */
    ZmthBold {
        get => this.get_ZmthBold()
    }

    /**
     * @type {HSTRING} 
     */
    ZmthDbl {
        get => this.get_ZmthDbl()
    }

    /**
     * @type {HSTRING} 
     */
    ZmthSans {
        get => this.get_ZmthSans()
    }

    /**
     * @type {HSTRING} 
     */
    ZmthSanb {
        get => this.get_ZmthSanb()
    }

    /**
     * @type {HSTRING} 
     */
    ZmthMono {
        get => this.get_ZmthMono()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Brah() {
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
    get_Osma() {
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
    get_MathBold() {
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
    get_MathDbl() {
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
    get_MathSans() {
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
    get_MathSanb() {
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
    get_MathMono() {
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
    get_ZmthBold() {
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
    get_ZmthDbl() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ZmthSans() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ZmthSanb() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ZmthMono() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
