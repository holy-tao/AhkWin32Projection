#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates which WDS features are installed on the WDS server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/ne-wdstptmgmt-wdstransport_feature_flags
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_FEATURE_FLAGS extends Win32Enum{

    /**
     * The server has the WDS administrator pack installed. This feature is used for managing WDS local or remote WDS servers.
     * @type {Integer (Int32)}
     */
    static WdsTptFeatureAdminPack => 1

    /**
     * The server has the WDS Transport Server role installed. This feature provides a generic, extensible transport platform that can be used by any application. Generally, this role has to be installed on the server for most of the WdsTptMgmt functionality to be available. Without this role, only limited functionality about the server's install state would be available through WdsTptMgmt.
     * @type {Integer (Int32)}
     */
    static WdsTptFeatureTransportServer => 2

    /**
     * The server has the WDS Deployment Server role installed. This feature allows administrators to add operating system images to the server and configure it to allow PXE-booting clients to enumerate and install these images.
     * @type {Integer (Int32)}
     */
    static WdsTptFeatureDeploymentServer => 4
}
