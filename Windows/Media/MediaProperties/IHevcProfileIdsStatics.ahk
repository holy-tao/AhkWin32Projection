#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IHevcProfileIdsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHevcProfileIdsStatics
     * @type {Guid}
     */
    static IID => Guid("{1e50d280-2aa7-53c1-973f-2189fa656f53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MainChromaSubsampling420BitDepth8", "get_MainChromaSubsampling420BitDepth10", "get_MainChromaSubsampling420BitDepth12", "get_MainChromaSubsampling422BitDepth10", "get_MainChromaSubsampling422BitDepth12", "get_MainChromaSubsampling444BitDepth8", "get_MainChromaSubsampling444BitDepth10", "get_MainChromaSubsampling444BitDepth12", "get_MonochromeBitDepth12", "get_MonochromeBitDepth16", "get_MainIntraChromaSubsampling420BitDepth8", "get_MainIntraChromaSubsampling420BitDepth10", "get_MainIntraChromaSubsampling420BitDepth12", "get_MainIntraChromaSubsampling422BitDepth10", "get_MainIntraChromaSubsampling422BitDepth12", "get_MainIntraChromaSubsampling444BitDepth8", "get_MainIntraChromaSubsampling444BitDepth10", "get_MainIntraChromaSubsampling444BitDepth12", "get_MainIntraChromaSubsampling444BitDepth16", "get_MainStillChromaSubsampling420BitDepth8", "get_MainStillChromaSubsampling444BitDepth8", "get_MainStillChromaSubsampling444BitDepth16"]

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
    MainChromaSubsampling420BitDepth12 {
        get => this.get_MainChromaSubsampling420BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling422BitDepth10 {
        get => this.get_MainChromaSubsampling422BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling422BitDepth12 {
        get => this.get_MainChromaSubsampling422BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling444BitDepth8 {
        get => this.get_MainChromaSubsampling444BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling444BitDepth10 {
        get => this.get_MainChromaSubsampling444BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    MainChromaSubsampling444BitDepth12 {
        get => this.get_MainChromaSubsampling444BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    MonochromeBitDepth12 {
        get => this.get_MonochromeBitDepth12()
    }

    /**
     * @type {Integer} 
     */
    MonochromeBitDepth16 {
        get => this.get_MonochromeBitDepth16()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling420BitDepth8 {
        get => this.get_MainIntraChromaSubsampling420BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling420BitDepth10 {
        get => this.get_MainIntraChromaSubsampling420BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling420BitDepth12 {
        get => this.get_MainIntraChromaSubsampling420BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling422BitDepth10 {
        get => this.get_MainIntraChromaSubsampling422BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling422BitDepth12 {
        get => this.get_MainIntraChromaSubsampling422BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling444BitDepth8 {
        get => this.get_MainIntraChromaSubsampling444BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling444BitDepth10 {
        get => this.get_MainIntraChromaSubsampling444BitDepth10()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling444BitDepth12 {
        get => this.get_MainIntraChromaSubsampling444BitDepth12()
    }

    /**
     * @type {Integer} 
     */
    MainIntraChromaSubsampling444BitDepth16 {
        get => this.get_MainIntraChromaSubsampling444BitDepth16()
    }

    /**
     * @type {Integer} 
     */
    MainStillChromaSubsampling420BitDepth8 {
        get => this.get_MainStillChromaSubsampling420BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    MainStillChromaSubsampling444BitDepth8 {
        get => this.get_MainStillChromaSubsampling444BitDepth8()
    }

    /**
     * @type {Integer} 
     */
    MainStillChromaSubsampling444BitDepth16 {
        get => this.get_MainStillChromaSubsampling444BitDepth16()
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
    get_MainChromaSubsampling420BitDepth12() {
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
    get_MainChromaSubsampling422BitDepth10() {
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
    get_MainChromaSubsampling422BitDepth12() {
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
    get_MainChromaSubsampling444BitDepth8() {
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
    get_MainChromaSubsampling444BitDepth10() {
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
    get_MainChromaSubsampling444BitDepth12() {
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
    get_MonochromeBitDepth12() {
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
    get_MonochromeBitDepth16() {
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
    get_MainIntraChromaSubsampling420BitDepth8() {
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
    get_MainIntraChromaSubsampling420BitDepth10() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainIntraChromaSubsampling420BitDepth12() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainIntraChromaSubsampling422BitDepth10() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainIntraChromaSubsampling422BitDepth12() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainIntraChromaSubsampling444BitDepth8() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainIntraChromaSubsampling444BitDepth10() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainIntraChromaSubsampling444BitDepth12() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainIntraChromaSubsampling444BitDepth16() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainStillChromaSubsampling420BitDepth8() {
        result := ComCall(25, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainStillChromaSubsampling444BitDepth8() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MainStillChromaSubsampling444BitDepth16() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
