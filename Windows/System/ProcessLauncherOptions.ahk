#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessLauncherOptions.ahk
#Include ..\..\Guid.ahk

/**
 * Specifies the options used to launch the specified process.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncheroptions
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ProcessLauncherOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessLauncherOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessLauncherOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies where a standard input is coming from.
     * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncheroptions.standardinput
     * @type {IInputStream} 
     */
    StandardInput {
        get => this.get_StandardInput()
        set => this.put_StandardInput(value)
    }

    /**
     * Specifies where a standard output is directed to.
     * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncheroptions.standardoutput
     * @type {IOutputStream} 
     */
    StandardOutput {
        get => this.get_StandardOutput()
        set => this.put_StandardOutput(value)
    }

    /**
     * Specifies where a standard error is directed to.
     * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncheroptions.standarderror
     * @type {IOutputStream} 
     */
    StandardError {
        get => this.get_StandardError()
        set => this.put_StandardError(value)
    }

    /**
     * Gets or sets the directory the process launcher will work in.
     * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncheroptions.workingdirectory
     * @type {HSTRING} 
     */
    WorkingDirectory {
        get => this.get_WorkingDirectory()
        set => this.put_WorkingDirectory(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the process launcher options object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.ProcessLauncherOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_StandardInput() {
        if (!this.HasProp("__IProcessLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherOptions := IProcessLauncherOptions(outPtr)
        }

        return this.__IProcessLauncherOptions.get_StandardInput()
    }

    /**
     * 
     * @param {IInputStream} value 
     * @returns {HRESULT} 
     */
    put_StandardInput(value) {
        if (!this.HasProp("__IProcessLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherOptions := IProcessLauncherOptions(outPtr)
        }

        return this.__IProcessLauncherOptions.put_StandardInput(value)
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_StandardOutput() {
        if (!this.HasProp("__IProcessLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherOptions := IProcessLauncherOptions(outPtr)
        }

        return this.__IProcessLauncherOptions.get_StandardOutput()
    }

    /**
     * 
     * @param {IOutputStream} value 
     * @returns {HRESULT} 
     */
    put_StandardOutput(value) {
        if (!this.HasProp("__IProcessLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherOptions := IProcessLauncherOptions(outPtr)
        }

        return this.__IProcessLauncherOptions.put_StandardOutput(value)
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_StandardError() {
        if (!this.HasProp("__IProcessLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherOptions := IProcessLauncherOptions(outPtr)
        }

        return this.__IProcessLauncherOptions.get_StandardError()
    }

    /**
     * 
     * @param {IOutputStream} value 
     * @returns {HRESULT} 
     */
    put_StandardError(value) {
        if (!this.HasProp("__IProcessLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherOptions := IProcessLauncherOptions(outPtr)
        }

        return this.__IProcessLauncherOptions.put_StandardError(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WorkingDirectory() {
        if (!this.HasProp("__IProcessLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherOptions := IProcessLauncherOptions(outPtr)
        }

        return this.__IProcessLauncherOptions.get_WorkingDirectory()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_WorkingDirectory(value) {
        if (!this.HasProp("__IProcessLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IProcessLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessLauncherOptions := IProcessLauncherOptions(outPtr)
        }

        return this.__IProcessLauncherOptions.put_WorkingDirectory(value)
    }

;@endregion Instance Methods
}
