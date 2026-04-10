#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
class D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE_USER => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE_SYSTEM => 1
}
