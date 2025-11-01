#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.SubsystemForLinux
 * @version v4.0.30319
 */
class SubsystemForLinux {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Determines if a distribution is registered with the Windows Subsystem for Linux (WSL).
     * @param {PWSTR} distributionName Unique name representing a distribution (for example, "Fabrikam.Distro.10.01").
     * @returns {BOOL} Returns TRUE if the supplied distribution is currently registered, or FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wslapi/nf-wslapi-wslisdistributionregistered
     */
    static WslIsDistributionRegistered(distributionName) {
        distributionName := distributionName is String ? StrPtr(distributionName) : distributionName

        result := DllCall("Api-ms-win-wsl-api-l1-1-0.dll\WslIsDistributionRegistered", "ptr", distributionName, "int")
        return result
    }

    /**
     * Registers a new distribution with the Windows Subsystem for Linux (WSL).
     * @param {PWSTR} distributionName Unique name representing a distribution (for example, "Fabrikam.Distro.10.01").
     * @param {PWSTR} tarGzFilename Full path to a .tar.gz file containing the file system of the distribution to register.
     * @returns {HRESULT} This function can return one of the following values. Use the SUCCEEDED and FAILED macros to test the return value of this function.
     * 
     * <table>
     * <tr>
     * <td><b>Return Code</b></td>
     * <td><b>Description</b></td>
     * </tr>
     * <tr>
     * <td>S_OK                                     </td>
     * <td>Distribution successfully registered with the Windows Subsystem for Linux.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS) </td>
     * <td>Failed because a distribution with this name has already been registered.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wslapi/nf-wslapi-wslregisterdistribution
     */
    static WslRegisterDistribution(distributionName, tarGzFilename) {
        distributionName := distributionName is String ? StrPtr(distributionName) : distributionName
        tarGzFilename := tarGzFilename is String ? StrPtr(tarGzFilename) : tarGzFilename

        result := DllCall("Api-ms-win-wsl-api-l1-1-0.dll\WslRegisterDistribution", "ptr", distributionName, "ptr", tarGzFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters a distribution from the Windows Subsystem for Linux (WSL).
     * @param {PWSTR} distributionName Unique name representing a distribution (for example, "Fabrikam.Distro.10.01").
     * @returns {HRESULT} Returns S_OK on success, or a failing HRESULT otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wslapi/nf-wslapi-wslunregisterdistribution
     */
    static WslUnregisterDistribution(distributionName) {
        distributionName := distributionName is String ? StrPtr(distributionName) : distributionName

        result := DllCall("Api-ms-win-wsl-api-l1-1-0.dll\WslUnregisterDistribution", "ptr", distributionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Modifies the behavior of a distribution registered with the Windows Subsystem for Linux (WSL).
     * @param {PWSTR} distributionName Unique name representing a distribution (for example, "Fabrikam.Distro.10.01").
     * @param {Integer} defaultUID The Linux user ID to use when launching new WSL sessions for this distribution.
     * @param {Integer} wslDistributionFlags Flags specifying what behavior to use for this distribution.
     * @returns {HRESULT} Returns S_OK on success, or a failing HRESULT otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wslapi/nf-wslapi-wslconfiguredistribution
     */
    static WslConfigureDistribution(distributionName, defaultUID, wslDistributionFlags) {
        distributionName := distributionName is String ? StrPtr(distributionName) : distributionName

        result := DllCall("Api-ms-win-wsl-api-l1-1-0.dll\WslConfigureDistribution", "ptr", distributionName, "uint", defaultUID, "int", wslDistributionFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the current configuration of a distribution registered with the Windows Subsystem for Linux (WSL).
     * @param {PWSTR} distributionName Unique name representing a distribution (for example, "Fabrikam.Distro.10.01").
     * @param {Pointer<Integer>} distributionVersion The version of WSL for which this distribution is configured.
     * @param {Pointer<Integer>} defaultUID The default user ID used when launching new WSL sessions for this distribution.
     * @param {Pointer<Integer>} wslDistributionFlags The flags governing the behavior of this distribution.
     * @param {Pointer<Pointer<PSTR>>} defaultEnvironmentVariables The address of a pointer to an array of default environment variable strings used when launching new WSL sessions for this distribution.
     * @param {Pointer<Integer>} defaultEnvironmentVariableCount The number of elements in <i>pDefaultEnvironmentVariablesArray</i>.
     * @returns {HRESULT} Returns S_OK on success, or a failing HRESULT otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wslapi/nf-wslapi-wslgetdistributionconfiguration
     */
    static WslGetDistributionConfiguration(distributionName, distributionVersion, defaultUID, wslDistributionFlags, defaultEnvironmentVariables, defaultEnvironmentVariableCount) {
        distributionName := distributionName is String ? StrPtr(distributionName) : distributionName

        result := DllCall("Api-ms-win-wsl-api-l1-1-0.dll\WslGetDistributionConfiguration", "ptr", distributionName, "uint*", distributionVersion, "uint*", defaultUID, "int*", wslDistributionFlags, "ptr*", defaultEnvironmentVariables, "uint*", defaultEnvironmentVariableCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Launches an interactive Windows Subsystem for Linux (WSL) process in the context of a particular distribution.
     * @param {PWSTR} distributionName Unique name representing a distribution (for example, "Fabrikam.Distro.10.01").
     * @param {PWSTR} command Command to execute. If no command is supplied, launches the default shell.
     * @param {BOOL} useCurrentWorkingDirectory Governs whether or not the launched process should inherit the calling process's working directory. If FALSE, the process is started in the WSL default user's home directory ("~").
     * @param {Pointer<Integer>} exitCode Receives the exit code of the process after it exits.
     * @returns {HRESULT} Returns S_OK on success, or a failing HRESULT otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wslapi/nf-wslapi-wsllaunchinteractive
     */
    static WslLaunchInteractive(distributionName, command, useCurrentWorkingDirectory, exitCode) {
        distributionName := distributionName is String ? StrPtr(distributionName) : distributionName
        command := command is String ? StrPtr(command) : command

        result := DllCall("Api-ms-win-wsl-api-l1-1-0.dll\WslLaunchInteractive", "ptr", distributionName, "ptr", command, "int", useCurrentWorkingDirectory, "uint*", exitCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Launches a Windows Subsystem for Linux (WSL) process in the context of a particular distribution.
     * @param {PWSTR} distributionName Unique name representing a distribution (for example, "Fabrikam.Distro.10.01").
     * @param {PWSTR} command Command to execute. If no command is supplied, launches the default shell.
     * @param {BOOL} useCurrentWorkingDirectory Governs whether or not the launched process should inherit the calling process's working directory. If FALSE, the process is started in the WSL default user's home directory ("~").
     * @param {HANDLE} stdIn Handle to use for <b>STDIN</b>.
     * @param {HANDLE} stdOut Handle to use for <b>STDOUT</b>.
     * @param {HANDLE} stdErr Handle to use for <b>STDERR</b>.
     * @param {Pointer<HANDLE>} process Pointer to address to receive the process HANDLE associated with the newly-launched WSL process.
     * @returns {HRESULT} Returns S_OK on success, or a failing HRESULT otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wslapi/nf-wslapi-wsllaunch
     */
    static WslLaunch(distributionName, command, useCurrentWorkingDirectory, stdIn, stdOut, stdErr, process) {
        distributionName := distributionName is String ? StrPtr(distributionName) : distributionName
        command := command is String ? StrPtr(command) : command
        stdIn := stdIn is Win32Handle ? NumGet(stdIn, "ptr") : stdIn
        stdOut := stdOut is Win32Handle ? NumGet(stdOut, "ptr") : stdOut
        stdErr := stdErr is Win32Handle ? NumGet(stdErr, "ptr") : stdErr

        result := DllCall("Api-ms-win-wsl-api-l1-1-0.dll\WslLaunch", "ptr", distributionName, "ptr", command, "int", useCurrentWorkingDirectory, "ptr", stdIn, "ptr", stdOut, "ptr", stdErr, "ptr", process, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
