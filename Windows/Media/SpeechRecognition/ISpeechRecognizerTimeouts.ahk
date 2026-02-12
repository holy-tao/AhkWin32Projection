#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognizerTimeouts extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognizerTimeouts
     * @type {Guid}
     */
    static IID => Guid("{2ef76fca-6a3c-4dca-a153-df1bc88a79af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InitialSilenceTimeout", "put_InitialSilenceTimeout", "get_EndSilenceTimeout", "put_EndSilenceTimeout", "get_BabbleTimeout", "put_BabbleTimeout"]

    /**
     * @type {TimeSpan} 
     */
    InitialSilenceTimeout {
        get => this.get_InitialSilenceTimeout()
        set => this.put_InitialSilenceTimeout(value)
    }

    /**
     * @type {TimeSpan} 
     */
    EndSilenceTimeout {
        get => this.get_EndSilenceTimeout()
        set => this.put_EndSilenceTimeout(value)
    }

    /**
     * @type {TimeSpan} 
     */
    BabbleTimeout {
        get => this.get_BabbleTimeout()
        set => this.put_BabbleTimeout(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_InitialSilenceTimeout() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_InitialSilenceTimeout(value) {
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
    get_EndSilenceTimeout() {
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
    put_EndSilenceTimeout(value) {
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
    get_BabbleTimeout() {
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
    put_BabbleTimeout(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
