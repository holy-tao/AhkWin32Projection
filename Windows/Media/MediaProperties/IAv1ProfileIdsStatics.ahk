#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IAv1ProfileIdsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAv1ProfileIdsStatics
     * @type {Guid}
     */
    static IID => Guid("{9105812b-7c09-5882-88a4-678008a5174d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MainChromaSubsampling420BitDepth8", "get_MainChromaSubsampling420BitDepth10", "get_MainChromaSubsampling400BitDepth8", "get_MainChromaSubsampling400BitDepth10", "get_HighChromaSubsampling444BitDepth8", "get_HighChromaSubsampling444BitDepth10", "get_ProfessionalChromaSubsampling420BitDepth12", "get_ProfessionalChromaSubsampling400BitDepth12", "get_ProfessionalChromaSubsampling444BitDepth12", "get_ProfessionalChromaSubsampling422BitDepth8", "get_ProfessionalChromaSubsampling422BitDepth10", "get_ProfessionalChromaSubsampling422BitDepth12"]

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling420BitDepth8 {
        get => this.get_MainChromaSubsampling420BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling420BitDepth10 {
        get => this.get_MainChromaSubsampling420BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling400BitDepth8 {
        get => this.get_MainChromaSubsampling400BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling400BitDepth10 {
        get => this.get_MainChromaSubsampling400BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    HighChromaSubsampling444BitDepth8 {
        get => this.get_HighChromaSubsampling444BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    HighChromaSubsampling444BitDepth10 {
        get => this.get_HighChromaSubsampling444BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    ProfessionalChromaSubsampling420BitDepth12 {
        get => this.get_ProfessionalChromaSubsampling420BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    ProfessionalChromaSubsampling400BitDepth12 {
        get => this.get_ProfessionalChromaSubsampling400BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    ProfessionalChromaSubsampling444BitDepth12 {
        get => this.get_ProfessionalChromaSubsampling444BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    ProfessionalChromaSubsampling422BitDepth8 {
        get => this.get_ProfessionalChromaSubsampling422BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    ProfessionalChromaSubsampling422BitDepth10 {
        get => this.get_ProfessionalChromaSubsampling422BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    ProfessionalChromaSubsampling422BitDepth12 {
        get => this.get_ProfessionalChromaSubsampling422BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainChromaSubsampling420BitDepth8() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainChromaSubsampling420BitDepth10() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainChromaSubsampling400BitDepth8() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainChromaSubsampling400BitDepth10() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighChromaSubsampling444BitDepth8() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighChromaSubsampling444BitDepth10() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfessionalChromaSubsampling420BitDepth12() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfessionalChromaSubsampling400BitDepth12() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfessionalChromaSubsampling444BitDepth12() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfessionalChromaSubsampling422BitDepth8() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfessionalChromaSubsampling422BitDepth10() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfessionalChromaSubsampling422BitDepth12() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
