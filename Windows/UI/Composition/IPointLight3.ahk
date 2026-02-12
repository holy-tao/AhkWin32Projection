#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IPointLight3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointLight3
     * @type {Guid}
     */
    static IID => Guid("{4c0a8367-d4e9-468a-87ae-7ba43ab29485}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinAttenuationCutoff", "put_MinAttenuationCutoff", "get_MaxAttenuationCutoff", "put_MaxAttenuationCutoff"]

    /**
     * @type {Float} 
     */
    MinAttenuationCutoff {
        get => this.get_MinAttenuationCutoff()
        set => this.put_MinAttenuationCutoff(value)
    }

    /**
     * @type {Float} 
     */
    MaxAttenuationCutoff {
        get => this.get_MaxAttenuationCutoff()
        set => this.put_MaxAttenuationCutoff(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinAttenuationCutoff() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_MinAttenuationCutoff(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAttenuationCutoff() {
        result := ComCall(8, this, "float*", &value := 0, "int")
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
    put_MaxAttenuationCutoff(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
