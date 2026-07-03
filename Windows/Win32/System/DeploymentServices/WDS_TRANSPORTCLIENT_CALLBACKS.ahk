#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_TRANSPORTCLIENT_CALLBACKS {
    #StructPack 8

    SessionStart : IntPtr

    SessionStartEx : IntPtr

    ReceiveContents : IntPtr

    ReceiveMetadata : IntPtr

    SessionComplete : IntPtr

    SessionNegotiate : IntPtr

}
