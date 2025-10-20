#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IIsolatedProcessLauncher.ahk

/**
 * @namespace Windows.Win32.Security.Isolation
 * @version v4.0.30319
 */
class IIsolatedProcessLauncher2 extends IIsolatedProcessLauncher{
    /**
     * The interface identifier for IIsolatedProcessLauncher2
     * @type {Guid}
     */
    static IID => Guid("{780e4416-5e72-4123-808e-66dc6479feef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {PWSTR} process 
     * @param {PWSTR} arguments 
     * @param {PWSTR} workingDirectory 
     * @param {Pointer<Guid>} correlationGuid 
     * @returns {HRESULT} 
     */
    LaunchProcess2(process, arguments, workingDirectory, correlationGuid) {
        process := process is String ? StrPtr(process) : process
        arguments := arguments is String ? StrPtr(arguments) : arguments
        workingDirectory := workingDirectory is String ? StrPtr(workingDirectory) : workingDirectory

        result := ComCall(8, this, "ptr", process, "ptr", arguments, "ptr", workingDirectory, "ptr", correlationGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
