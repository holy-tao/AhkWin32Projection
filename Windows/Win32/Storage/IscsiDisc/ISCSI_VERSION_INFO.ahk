#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ISCSI_VERSION_INFO structure contains the version and build numbers of the iSCSI software initiator and the initiator service.
 * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/ns-iscsidsc-iscsi_version_info
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class ISCSI_VERSION_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The major version number of the iSCSI software initiator and initiator service. This may be different from the version number of the Operating System.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The minor version number of the iSCSI software initiator and initiator service. This may be different from the version number of the Operating System.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The build number of the iSCSI software initiator and initiator service. This may be different from the build number of the Operating System.
     * @type {Integer}
     */
    BuildNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
