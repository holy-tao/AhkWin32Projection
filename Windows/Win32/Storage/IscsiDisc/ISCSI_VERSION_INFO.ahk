#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ISCSI_VERSION_INFO structure contains the version and build numbers of the iSCSI software initiator and the initiator service.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_version_info
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct ISCSI_VERSION_INFO {
    #StructPack 4

    /**
     * The major version number of the iSCSI software initiator and initiator service. This may be different from the version number of the Operating System.
     */
    MajorVersion : UInt32

    /**
     * The minor version number of the iSCSI software initiator and initiator service. This may be different from the version number of the Operating System.
     */
    MinorVersion : UInt32

    /**
     * The build number of the iSCSI software initiator and initiator service. This may be different from the build number of the Operating System.
     */
    BuildNumber : UInt32

}
