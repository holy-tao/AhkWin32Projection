#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CommandLineActivationOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the interface for providing info, such as the command-line arguments, when an app is activated from the command line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icommandlineactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ICommandLineActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandLineActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4506472c-006a-48eb-8afb-d07ab25e3366}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Operation"]

    /**
     * Provides info about the activation of the app such as what arguments were provided and the current directory path.
     * @remarks
     * The app supplies the exit code which is passed back to the caller.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icommandlineactivatedeventargs.operation
     * @type {CommandLineActivationOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * 
     * @returns {CommandLineActivationOperation} 
     */
    get_Operation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CommandLineActivationOperation(value)
    }
}
