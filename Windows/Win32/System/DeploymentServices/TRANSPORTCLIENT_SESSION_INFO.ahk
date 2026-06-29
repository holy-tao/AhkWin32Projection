#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure is used by the PFN_WdsTransportClientSessionStartEx callback function.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/ns-wdstci-transportclient_session_info
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct TRANSPORTCLIENT_SESSION_INFO {
    #StructPack 8

    /**
     * The length of this structure in bytes.
     */
    ulStructureLength : UInt32

    /**
     * The size of the file, in bytes.
     */
    ullFileSize : Int64

    /**
     * The size of a receive block, in bytes.
     */
    ulBlockSize : UInt32

}
