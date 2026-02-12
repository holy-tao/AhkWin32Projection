#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Storage\Streams\IInputStream.ahk
#Include ..\Storage\Streams\IOutputStream.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IProcessLauncherOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessLauncherOptions
     * @type {Guid}
     */
    static IID => Guid("{3080b9cf-f444-4a83-beaf-a549a0f3229c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StandardInput", "put_StandardInput", "get_StandardOutput", "put_StandardOutput", "get_StandardError", "put_StandardError", "get_WorkingDirectory", "put_WorkingDirectory"]

    /**
     * @type {IInputStream} 
     */
    StandardInput {
        get => this.get_StandardInput()
        set => this.put_StandardInput(value)
    }

    /**
     * @type {IOutputStream} 
     */
    StandardOutput {
        get => this.get_StandardOutput()
        set => this.put_StandardOutput(value)
    }

    /**
     * @type {IOutputStream} 
     */
    StandardError {
        get => this.get_StandardError()
        set => this.put_StandardError(value)
    }

    /**
     * @type {HSTRING} 
     */
    WorkingDirectory {
        get => this.get_WorkingDirectory()
        set => this.put_WorkingDirectory(value)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_StandardInput() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(value)
    }

    /**
     * 
     * @param {IInputStream} value 
     * @returns {HRESULT} 
     */
    put_StandardInput(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_StandardOutput() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
    }

    /**
     * 
     * @param {IOutputStream} value 
     * @returns {HRESULT} 
     */
    put_StandardOutput(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_StandardError() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
    }

    /**
     * 
     * @param {IOutputStream} value 
     * @returns {HRESULT} 
     */
    put_StandardError(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WorkingDirectory() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_WorkingDirectory(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
