#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguiconfiguration
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SyncProviderConfigUIConfiguration extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidInstanceId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    clsidConfigUI {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidContentType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwCapabilities {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwSupportedArchitecture {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {BOOL}
     */
    fIsGlobal {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
