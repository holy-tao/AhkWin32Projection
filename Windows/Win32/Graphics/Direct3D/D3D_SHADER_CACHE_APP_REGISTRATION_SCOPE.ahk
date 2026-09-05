#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
class D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE extends Win32Enum {

    /**
     * Native name: D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE_USER
     * @type {Integer (Int32)}
     */
    static USER => 0

    /**
     * Native name: D3D_SHADER_CACHE_APP_REGISTRATION_SCOPE_SYSTEM
     * @type {Integer (Int32)}
     */
    static SYSTEM => 1
}
