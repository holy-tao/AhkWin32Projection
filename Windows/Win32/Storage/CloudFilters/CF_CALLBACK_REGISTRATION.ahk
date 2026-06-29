#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_CALLBACK_TYPE.ahk" { CF_CALLBACK_TYPE }

/**
 * The callbacks to be registered by the sync provider.
 * @remarks
 * This callback registration is how a sync provider communicates to the library which functions to call to execute various requests from the platform.
 * 
 * Note that the sync provider only needs to register implemented callbacks, and **CF_CALLBACK_REGISTRATION** should always end with **CF_CALLBACK_REGISTRATION_END**.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_callback_registration
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_REGISTRATION {
    #StructPack 8

    /**
     * The type of callback to be registered. See [CF_CALLBACK_TYPE](ne-cfapi-cf_callback_type.md).
     */
    Type : CF_CALLBACK_TYPE

    /**
     * A pointer to the callback function.
     */
    Callback : IntPtr

}
