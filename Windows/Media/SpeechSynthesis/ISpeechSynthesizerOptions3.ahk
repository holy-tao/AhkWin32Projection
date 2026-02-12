#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class ISpeechSynthesizerOptions3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechSynthesizerOptions3
     * @type {Guid}
     */
    static IID => Guid("{401ed877-902c-4814-a582-a5d0c0769fa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppendedSilence", "put_AppendedSilence", "get_PunctuationSilence", "put_PunctuationSilence"]

    /**
     * @type {Integer} 
     */
    AppendedSilence {
        get => this.get_AppendedSilence()
        set => this.put_AppendedSilence(value)
    }

    /**
     * @type {Integer} 
     */
    PunctuationSilence {
        get => this.get_PunctuationSilence()
        set => this.put_PunctuationSilence(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppendedSilence() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_AppendedSilence(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PunctuationSilence() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_PunctuationSilence(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
