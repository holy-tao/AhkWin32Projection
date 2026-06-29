#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VSS_PROTECTION_LEVEL.ahk" { VSS_PROTECTION_LEVEL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\VSS_PROTECTION_FAULT.ahk" { VSS_PROTECTION_FAULT }

/**
 * Contains information about a volume's shadow copy protection level.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ns-vsmgmt-vss_volume_protection_info
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_VOLUME_PROTECTION_INFO {
    #StructPack 4

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_protection_level">VSS_PROTECTION_LEVEL</a> enumeration that specifies the target protection level for the volume.
     */
    m_protectionLevel : VSS_PROTECTION_LEVEL

    /**
     * TRUE if the volume is offline due to a protection fault, or <b>FALSE</b> otherwise.
     */
    m_volumeIsOfflineForProtection : BOOL

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_protection_fault">VSS_PROTECTION_FAULT</a> enumeration that describes the shadow copy protection fault that caused the volume to go offline.
     */
    m_protectionFault : VSS_PROTECTION_FAULT

    /**
     * The internal failure status code.
     */
    m_failureStatus : Int32

    /**
     * TRUE if the volume has unused shadow copy storage area files, or <b>FALSE</b> otherwise.
     */
    m_volumeHasUnusedDiffArea : BOOL

    /**
     * Reserved for system use.
     */
    m_reserved : UInt32

}
