#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class INumeralSystemIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumeralSystemIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{a5c662c3-68c9-4d3d-b765-972029e21dec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Arab", "get_ArabExt", "get_Bali", "get_Beng", "get_Cham", "get_Deva", "get_FullWide", "get_Gujr", "get_Guru", "get_HaniDec", "get_Java", "get_Kali", "get_Khmr", "get_Knda", "get_Lana", "get_LanaTham", "get_Laoo", "get_Latn", "get_Lepc", "get_Limb", "get_Mlym", "get_Mong", "get_Mtei", "get_Mymr", "get_MymrShan", "get_Nkoo", "get_Olck", "get_Orya", "get_Saur", "get_Sund", "get_Talu", "get_TamlDec", "get_Telu", "get_Thai", "get_Tibt", "get_Vaii"]

    /**
     * @type {HSTRING} 
     */
    Arab {
        get => this.get_Arab()
    }

    /**
     * @type {HSTRING} 
     */
    ArabExt {
        get => this.get_ArabExt()
    }

    /**
     * @type {HSTRING} 
     */
    Bali {
        get => this.get_Bali()
    }

    /**
     * @type {HSTRING} 
     */
    Beng {
        get => this.get_Beng()
    }

    /**
     * @type {HSTRING} 
     */
    Cham {
        get => this.get_Cham()
    }

    /**
     * @type {HSTRING} 
     */
    Deva {
        get => this.get_Deva()
    }

    /**
     * @type {HSTRING} 
     */
    FullWide {
        get => this.get_FullWide()
    }

    /**
     * @type {HSTRING} 
     */
    Gujr {
        get => this.get_Gujr()
    }

    /**
     * @type {HSTRING} 
     */
    Guru {
        get => this.get_Guru()
    }

    /**
     * @type {HSTRING} 
     */
    HaniDec {
        get => this.get_HaniDec()
    }

    /**
     * @type {HSTRING} 
     */
    Java {
        get => this.get_Java()
    }

    /**
     * @type {HSTRING} 
     */
    Kali {
        get => this.get_Kali()
    }

    /**
     * @type {HSTRING} 
     */
    Khmr {
        get => this.get_Khmr()
    }

    /**
     * @type {HSTRING} 
     */
    Knda {
        get => this.get_Knda()
    }

    /**
     * @type {HSTRING} 
     */
    Lana {
        get => this.get_Lana()
    }

    /**
     * @type {HSTRING} 
     */
    LanaTham {
        get => this.get_LanaTham()
    }

    /**
     * @type {HSTRING} 
     */
    Laoo {
        get => this.get_Laoo()
    }

    /**
     * @type {HSTRING} 
     */
    Latn {
        get => this.get_Latn()
    }

    /**
     * @type {HSTRING} 
     */
    Lepc {
        get => this.get_Lepc()
    }

    /**
     * @type {HSTRING} 
     */
    Limb {
        get => this.get_Limb()
    }

    /**
     * @type {HSTRING} 
     */
    Mlym {
        get => this.get_Mlym()
    }

    /**
     * @type {HSTRING} 
     */
    Mong {
        get => this.get_Mong()
    }

    /**
     * @type {HSTRING} 
     */
    Mtei {
        get => this.get_Mtei()
    }

    /**
     * @type {HSTRING} 
     */
    Mymr {
        get => this.get_Mymr()
    }

    /**
     * @type {HSTRING} 
     */
    MymrShan {
        get => this.get_MymrShan()
    }

    /**
     * @type {HSTRING} 
     */
    Nkoo {
        get => this.get_Nkoo()
    }

    /**
     * @type {HSTRING} 
     */
    Olck {
        get => this.get_Olck()
    }

    /**
     * @type {HSTRING} 
     */
    Orya {
        get => this.get_Orya()
    }

    /**
     * @type {HSTRING} 
     */
    Saur {
        get => this.get_Saur()
    }

    /**
     * @type {HSTRING} 
     */
    Sund {
        get => this.get_Sund()
    }

    /**
     * @type {HSTRING} 
     */
    Talu {
        get => this.get_Talu()
    }

    /**
     * @type {HSTRING} 
     */
    TamlDec {
        get => this.get_TamlDec()
    }

    /**
     * @type {HSTRING} 
     */
    Telu {
        get => this.get_Telu()
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
    Tibt {
        get => this.get_Tibt()
    }

    /**
     * @type {HSTRING} 
     */
    Vaii {
        get => this.get_Vaii()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arab() {
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
    get_ArabExt() {
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
    get_Bali() {
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
    get_Beng() {
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
    get_Cham() {
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
    get_Deva() {
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
    get_FullWide() {
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
    get_Gujr() {
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
    get_Guru() {
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
    get_HaniDec() {
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
    get_Java() {
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
    get_Kali() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Khmr() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Knda() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Lana() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LanaTham() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Laoo() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Latn() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Lepc() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Limb() {
        value := HSTRING()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mlym() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mong() {
        value := HSTRING()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mtei() {
        value := HSTRING()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mymr() {
        value := HSTRING()
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MymrShan() {
        value := HSTRING()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Nkoo() {
        value := HSTRING()
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Olck() {
        value := HSTRING()
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Orya() {
        value := HSTRING()
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Saur() {
        value := HSTRING()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Sund() {
        value := HSTRING()
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Talu() {
        value := HSTRING()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TamlDec() {
        value := HSTRING()
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Telu() {
        value := HSTRING()
        result := ComCall(38, this, "ptr", value, "int")
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
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tibt() {
        value := HSTRING()
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Vaii() {
        value := HSTRING()
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
