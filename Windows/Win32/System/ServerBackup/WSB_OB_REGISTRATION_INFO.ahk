#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information to register a cloud backup provider with Windows Server Backup.
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_registration_info
 * @namespace Windows.Win32.System.ServerBackup
 */
export default struct WSB_OB_REGISTRATION_INFO {
    #StructPack 8

    /**
     * The complete path to the resource DLL where the provider name and icon resources can be loaded from.
     */
    m_wszResourceDLL : PWSTR

    /**
     * The snap-in identifier of the cloud backup provider to be registered with Windows Server Backup.
     */
    m_guidSnapinId : Guid

    /**
     * The resource identifier of the cloud backup provider name. This name will be shown in the Windows Server Backup MMC  snap-in.
     */
    m_dwProviderName : UInt32

    /**
     * The resource identifier of the cloud backup provider icon. This icon will be shown in the Windows Server Backup MMC snap-in.
     */
    m_dwProviderIcon : UInt32

    /**
     * A flag to indicate whether the cloud backup provider can communicate with a remote cloud backup provider engine.
     */
    m_bSupportsRemoting : BOOLEAN

}
