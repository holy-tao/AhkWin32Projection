#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of Microsoft Direct3D authenticated channel.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_authenticated_channel_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_CHANNEL_TYPE extends Win32Enum{

    /**
     * Direct3D 11 channel. This channel provides communication with the Direct3D runtime.
     * @type {Integer (Int32)}
     */
    static D3D11_AUTHENTICATED_CHANNEL_D3D11 => 1

    /**
     * Software driver channel. This channel provides communication with a driver that implements content protection mechanisms in software.
     * @type {Integer (Int32)}
     */
    static D3D11_AUTHENTICATED_CHANNEL_DRIVER_SOFTWARE => 2

    /**
     * Hardware driver channel. This channel provides communication with a driver that implements content protection mechanisms in the GPU hardware.
     * @type {Integer (Int32)}
     */
    static D3D11_AUTHENTICATED_CHANNEL_DRIVER_HARDWARE => 3
}
