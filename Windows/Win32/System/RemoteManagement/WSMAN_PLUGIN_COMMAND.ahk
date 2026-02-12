#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the command callback for a plug-in.
 * @remarks
 * The WinRM (WinRM) plug-in will call the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginreportcontext">WSManPluginReportContext</a> method to register a command context for the command. All operations on this command are passed into this context. The context must be valid until the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> method is called by the plug-in to indicate that either the command is complete or the shell was shut down. All parameters passed in are valid until the WinRM plug-in calls <b>WSManPluginOperationComplete</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_command
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_COMMAND extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails 
     * @param {Integer} flags 
     * @param {Pointer<Void>} shellContext 
     * @param {PWSTR} commandLine 
     * @param {Pointer<WSMAN_COMMAND_ARG_SET>} arguments 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(requestDetails, flags, shellContext, commandLine, arguments) {
        commandLine := commandLine is String ? StrPtr(commandLine) : commandLine

        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", requestDetails, "uint", flags, shellContextMarshal, shellContext, "ptr", commandLine, "ptr", arguments)
    }
}
