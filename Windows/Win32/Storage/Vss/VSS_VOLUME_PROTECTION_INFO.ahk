#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains information about a volume's shadow copy protection level.
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/ns-vsmgmt-vss_volume_protection_info
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_VOLUME_PROTECTION_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_protection_level">VSS_PROTECTION_LEVEL</a> enumeration that specifies the target protection level for the volume.
     * @type {Integer}
     */
    m_protectionLevel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * TRUE if the volume is offline due to a protection fault, or <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    m_volumeIsOfflineForProtection{
        get {
            if(!this.HasProp("__m_volumeIsOfflineForProtection"))
                this.__m_volumeIsOfflineForProtection := BOOL(this.ptr + 4)
            return this.__m_volumeIsOfflineForProtection
        }
    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_protection_fault">VSS_PROTECTION_FAULT</a> enumeration that describes the shadow copy protection fault that caused the volume to go offline.
     * @type {Integer}
     */
    m_protectionFault {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The internal failure status code.
     * @type {Integer}
     */
    m_failureStatus {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * TRUE if the volume has unused shadow copy storage area files, or <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    m_volumeHasUnusedDiffArea{
        get {
            if(!this.HasProp("__m_volumeHasUnusedDiffArea"))
                this.__m_volumeHasUnusedDiffArea := BOOL(this.ptr + 16)
            return this.__m_volumeHasUnusedDiffArea
        }
    }

    /**
     * Reserved for system use.
     * @type {Integer}
     */
    m_reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
