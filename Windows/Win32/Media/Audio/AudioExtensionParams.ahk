#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is passed to the Control Panel Endpoint Extension property page through IShellPropSheetExt::AddPages and is used to create endpoint PropertyPages.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/ns-mmdeviceapi-audioextensionparams
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AudioExtensionParams extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The add page param.
     * @type {LPARAM}
     */
    AddPageParam {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the end point.
     * @type {IMMDevice}
     */
    pEndpoint {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the Pnp interface.
     * @type {IMMDevice}
     */
    pPnpInterface {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the Pnp devnode.
     * @type {IMMDevice}
     */
    pPnpDevnode {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
