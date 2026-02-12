#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **VpnDataPathType** is not supported and may be altered or unavailable in the future.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndatapathtype
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnDataPathType extends Win32Enum{

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static Send => 0

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static Receive => 1
}
