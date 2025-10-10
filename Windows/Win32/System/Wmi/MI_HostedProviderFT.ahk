#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_HostedProvider structure. Use the functions with the name prefix &quot;MI_HostedProvider_&quot; to manipulate these structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_hostedproviderft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_HostedProviderFT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_hostedprovider_close">MI_HostedProvider_Close</a>.
     * @type {Pointer}
     */
    Close {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * See 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_hostedprovider_getapplication">MI_HostedProvider_GetApplication</a>.
     * @type {Pointer}
     */
    GetApplication {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
