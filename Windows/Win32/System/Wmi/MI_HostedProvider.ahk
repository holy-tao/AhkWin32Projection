#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MI_HostedProviderFT.ahk

/**
 * Represents the hosting of a provider in a client application.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_hostedprovider
 * @namespace Windows.Win32.System.Wmi
 */
class MI_HostedProvider extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * Reserved for internal use.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for internal use.
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_hostedproviderft">MI_HostedProviderFT</a> function 
     *       table.
     * @type {Pointer<MI_HostedProviderFT>}
     */
    ft {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
