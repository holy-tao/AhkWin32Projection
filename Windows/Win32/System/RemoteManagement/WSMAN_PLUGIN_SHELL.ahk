#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the shell callback for a plug-in.
 * @remarks
 * The WinRM (WinRM) plug-in calls <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginreportcontext">WSManPluginReportContext</a> to register a shell context for the shell. All operations on this shell pass into this context. If the shell has shut down or the plug-in checks the  <i>requestDetails</i> parameter and reports that the operation was  canceled, the plug-in should call <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a>.  All parameters passed in are valid until the WinRM plug-in calls <b>WSManPluginOperationComplete</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_shell
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_SHELL extends IUnknown {

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
     * @param {Pointer<Void>} pluginContext 
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails 
     * @param {Integer} flags 
     * @param {Pointer<WSMAN_SHELL_STARTUP_INFO_V11>} startupInfo 
     * @param {Pointer<WSMAN_DATA>} inboundShellInformation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pluginContext, requestDetails, flags, startupInfo, inboundShellInformation) {
        pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, pluginContextMarshal, pluginContext, "ptr", requestDetails, "uint", flags, "ptr", startupInfo, "ptr", inboundShellInformation)
    }
}
