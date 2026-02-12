#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IH264ProfileIdsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IH264ProfileIdsStatics
     * @type {Guid}
     */
    static IID => Guid("{38654ca7-846a-4f97-a2e5-c3a15bbf70fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConstrainedBaseline", "get_Baseline", "get_Extended", "get_Main", "get_High", "get_High10", "get_High422", "get_High444", "get_StereoHigh", "get_MultiviewHigh"]

    /**
     * @type {Integer} 
     */
    ConstrainedBaseline {
        get => this.get_ConstrainedBaseline()
    }

    /**
     * @type {Integer} 
     */
    Baseline {
        get => this.get_Baseline()
    }

    /**
     * @type {Integer} 
     */
    Extended {
        get => this.get_Extended()
    }

    /**
     * @type {Integer} 
     */
    Main {
        get => this.get_Main()
    }

    /**
     * @type {Integer} 
     */
    High {
        get => this.get_High()
    }

    /**
     * @type {Integer} 
     */
    High10 {
        get => this.get_High10()
    }

    /**
     * @type {Integer} 
     */
    High422 {
        get => this.get_High422()
    }

    /**
     * @type {Integer} 
     */
    High444 {
        get => this.get_High444()
    }

    /**
     * @type {Integer} 
     */
    StereoHigh {
        get => this.get_StereoHigh()
    }

    /**
     * @type {Integer} 
     */
    MultiviewHigh {
        get => this.get_MultiviewHigh()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConstrainedBaseline() {
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
    get_Baseline() {
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
    get_Extended() {
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
    get_Main() {
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
    get_High() {
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
    get_High10() {
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
    get_High422() {
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
    get_High444() {
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
    get_StereoHigh() {
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
    get_MultiviewHigh() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
