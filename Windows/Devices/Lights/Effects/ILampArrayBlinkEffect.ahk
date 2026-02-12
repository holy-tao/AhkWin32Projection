#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\UI\Color.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class ILampArrayBlinkEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampArrayBlinkEffect
     * @type {Guid}
     */
    static IID => Guid("{ebbf35f6-2fc5-4bb3-b3c3-6221a7680d13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Color", "put_Color", "get_AttackDuration", "put_AttackDuration", "get_SustainDuration", "put_SustainDuration", "get_DecayDuration", "put_DecayDuration", "get_RepetitionDelay", "put_RepetitionDelay", "get_StartDelay", "put_StartDelay", "get_Occurrences", "put_Occurrences", "get_RepetitionMode", "put_RepetitionMode"]

    /**
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * @type {TimeSpan} 
     */
    AttackDuration {
        get => this.get_AttackDuration()
        set => this.put_AttackDuration(value)
    }

    /**
     * @type {TimeSpan} 
     */
    SustainDuration {
        get => this.get_SustainDuration()
        set => this.put_SustainDuration(value)
    }

    /**
     * @type {TimeSpan} 
     */
    DecayDuration {
        get => this.get_DecayDuration()
        set => this.put_DecayDuration(value)
    }

    /**
     * @type {TimeSpan} 
     */
    RepetitionDelay {
        get => this.get_RepetitionDelay()
        set => this.put_RepetitionDelay(value)
    }

    /**
     * @type {TimeSpan} 
     */
    StartDelay {
        get => this.get_StartDelay()
        set => this.put_StartDelay(value)
    }

    /**
     * @type {Integer} 
     */
    Occurrences {
        get => this.get_Occurrences()
        set => this.put_Occurrences(value)
    }

    /**
     * @type {Integer} 
     */
    RepetitionMode {
        get => this.get_RepetitionMode()
        set => this.put_RepetitionMode(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        value := Color()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AttackDuration() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_AttackDuration(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SustainDuration() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_SustainDuration(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DecayDuration() {
        value := TimeSpan()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DecayDuration(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RepetitionDelay() {
        value := TimeSpan()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_RepetitionDelay(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartDelay() {
        value := TimeSpan()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_StartDelay(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Occurrences() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Occurrences(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RepetitionMode() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RepetitionMode(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
