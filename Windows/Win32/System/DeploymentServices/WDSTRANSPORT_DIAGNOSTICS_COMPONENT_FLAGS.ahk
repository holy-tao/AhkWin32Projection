#Requires AutoHotkey v2.0.0 64-bit

/**
 * Configures which WDS components have diagnostics enabled. WDS diagnostics log events to the system event log.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/ne-wdstptmgmt-wdstransport_diagnostics_component_flags
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_DIAGNOSTICS_COMPONENT_FLAGS{

    /**
     * Diagnostics are enabled for the PXE component of WDS, which answers requests from clients performing a PXE network boot. This component is typically used by the WDS Deployment Server role but is also available for various third-party applications that use the WDS Transport Server role.
     * @type {Integer (Int32)}
     */
    static WdsTptDiagnosticsComponentPxe => 1

    /**
     * Diagnostics are enabled for the TFTP component of WDS, which handles simple file transfers from clients that are typically in a pre-boot environment. This component is typically used by the WDS Deployment Server role but is also available for various third-party applications that use the WDS Transport Server role.
     * @type {Integer (Int32)}
     */
    static WdsTptDiagnosticsComponentTftp => 2

    /**
     * Diagnostics are enabled for the Image Server component of WDS, which handles client requests for enumerating operating system images on the server. This component is typically used by the WDS Deployment Server role.
     * @type {Integer (Int32)}
     */
    static WdsTptDiagnosticsComponentImageServer => 4

    /**
     * Diagnostics are enabled for the Multicast component of WDS, which handles multicast file transfers from clients.
     * @type {Integer (Int32)}
     */
    static WdsTptDiagnosticsComponentMulticast => 8
}
