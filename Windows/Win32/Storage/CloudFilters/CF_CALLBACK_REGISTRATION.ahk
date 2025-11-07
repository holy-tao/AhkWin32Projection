#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The callbacks to be registered by the sync provider.
 * @remarks
 * 
 * This callback registration is how a sync provider communicates to the library which functions to call to execute various requests from the platform.
 * 
 * Note that the sync provider only needs to register implemented callbacks, and <b>CF_CALLBACK_REGISTRATION</b> should always end with <b>CF_CALLBACK_REGISTRATION_END</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_callback_registration
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_REGISTRATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of callback to be registered.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A pointer to the callback function.
     * @type {Pointer<CF_CALLBACK>}
     */
    Callback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
