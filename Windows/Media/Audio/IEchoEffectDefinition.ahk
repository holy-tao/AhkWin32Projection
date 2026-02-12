#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IEchoEffectDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEchoEffectDefinition
     * @type {Guid}
     */
    static IID => Guid("{0e4d3faa-36b8-4c91-b9da-11f44a8a6610}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_WetDryMix", "get_WetDryMix", "put_Feedback", "get_Feedback", "put_Delay", "get_Delay"]

    /**
     * @type {Float} 
     */
    WetDryMix {
        get => this.get_WetDryMix()
        set => this.put_WetDryMix(value)
    }

    /**
     * @type {Float} 
     */
    Feedback {
        get => this.get_Feedback()
        set => this.put_Feedback(value)
    }

    /**
     * @type {Float} 
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_WetDryMix(value) {
        result := ComCall(6, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WetDryMix() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Feedback(value) {
        result := ComCall(8, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Feedback() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Delay(value) {
        result := ComCall(10, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Delay() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
