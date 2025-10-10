#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information to register a cloud backup provider with Windows Server Backup.
 * @see https://docs.microsoft.com/windows/win32/api//wsbonline/ns-wsbonline-wsb_ob_registration_info
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class WSB_OB_REGISTRATION_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The complete path to the resource DLL where the provider name and icon resources can be loaded from.
     * @type {Pointer<Char>}
     */
    m_wszResourceDLL {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The snap-in identifier of the cloud backup provider to be registered with Windows Server Backup.
     * @type {Pointer<Guid>}
     */
    m_guidSnapinId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The resource identifier of the cloud backup provider name. This name will be shown in the Windows Server Backup MMC  snap-in.
     * @type {Integer}
     */
    m_dwProviderName {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The resource identifier of the cloud backup provider icon. This icon will be shown in the Windows Server Backup MMC snap-in.
     * @type {Integer}
     */
    m_dwProviderIcon {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A flag to indicate whether the cloud backup provider can communicate with a remote cloud backup provider engine.
     * @type {Integer}
     */
    m_bSupportsRemoting {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }
}
