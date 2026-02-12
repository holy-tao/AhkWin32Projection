#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICommandLineActivationOperation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides info about the activation of the app such as what arguments were provided and the current directory path.
 * @remarks
 * The app supplies the exit code which is passed back to the caller.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivationoperation
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class CommandLineActivationOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommandLineActivationOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommandLineActivationOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the command-line arguments passed to the app when it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivationoperation.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * Gets the directory path from which the app was activated from the command line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivationoperation.currentdirectorypath
     * @type {HSTRING} 
     */
    CurrentDirectoryPath {
        get => this.get_CurrentDirectoryPath()
    }

    /**
     * Sets the exit code for the app that was launched from the command line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivationoperation.exitcode
     * @type {Integer} 
     */
    ExitCode {
        get => this.get_ExitCode()
        set => this.put_ExitCode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arguments() {
        if (!this.HasProp("__ICommandLineActivationOperation")) {
            if ((queryResult := this.QueryInterface(ICommandLineActivationOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandLineActivationOperation := ICommandLineActivationOperation(outPtr)
        }

        return this.__ICommandLineActivationOperation.get_Arguments()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrentDirectoryPath() {
        if (!this.HasProp("__ICommandLineActivationOperation")) {
            if ((queryResult := this.QueryInterface(ICommandLineActivationOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandLineActivationOperation := ICommandLineActivationOperation(outPtr)
        }

        return this.__ICommandLineActivationOperation.get_CurrentDirectoryPath()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ExitCode(value) {
        if (!this.HasProp("__ICommandLineActivationOperation")) {
            if ((queryResult := this.QueryInterface(ICommandLineActivationOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandLineActivationOperation := ICommandLineActivationOperation(outPtr)
        }

        return this.__ICommandLineActivationOperation.put_ExitCode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExitCode() {
        if (!this.HasProp("__ICommandLineActivationOperation")) {
            if ((queryResult := this.QueryInterface(ICommandLineActivationOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandLineActivationOperation := ICommandLineActivationOperation(outPtr)
        }

        return this.__ICommandLineActivationOperation.get_ExitCode()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivationoperation.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICommandLineActivationOperation")) {
            if ((queryResult := this.QueryInterface(ICommandLineActivationOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandLineActivationOperation := ICommandLineActivationOperation(outPtr)
        }

        return this.__ICommandLineActivationOperation.GetDeferral()
    }

;@endregion Instance Methods
}
