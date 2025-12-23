#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a provider.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_provider
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_PROVIDER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Size of the <b>PXE_PROVIDER</b> structure.
     * @type {Integer}
     */
    uSizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address of a null-terminated string that specifies the display name of the provider. This name is displayed 
     *       to the user and must be unique among registered providers.
     * @type {PWSTR}
     */
    pwszName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Address of a null-terminated string that specifies the full path to the provider DLL.
     * @type {PWSTR}
     */
    pwszFilePath {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates whether the provider is critical. If a critical provider fails, the WDS server will also 
     *       fail.
     * @type {BOOL}
     */
    bIsCritical {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Index of a provider in the list of registered providers.
     * @type {Integer}
     */
    uIndex {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
