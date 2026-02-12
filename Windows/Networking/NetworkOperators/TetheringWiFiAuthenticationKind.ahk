#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the wireless authentication algorithm to be used for the Wi-Fi tethering connection.
 * @remarks
 * Older Wi-Fi adapters don't support WPA3. Call [Windows.Networking.NetworkOperators.NetworkOperatorTetheringAccessPointConfiguration.IsAuthenticationKindSupported]() to find out whether your adapter supports a specific authentication kind.
 * 
 * Use Wpa3TransitionMode to let the adapter automatically fall back to WPA2 if WPA3 is not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringwifiauthenticationkind
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class TetheringWiFiAuthenticationKind extends Win32Enum{

    /**
     * Specifies that the Wi-Fi adapter should use only the WPA2 authentication kind. Supported by all current hardware.
     * @type {Integer (Int32)}
     */
    static Wpa2 => 0

    /**
     * Specifies that the Wi-Fi adapter should choose WPA3 if available; and otherwise will fall back to WPA2 for each individual client/peer connection. This is supported only on hardware that supports WPA3, and it's meant to allow WPA2 clients to also be able to connect to WPA3 hardware. Also known as WPA3 Transitional or WPA3 Transition Mode.
     * @type {Integer (Int32)}
     */
    static Wpa3TransitionMode => 1

    /**
     * Specifies that the Wi-Fi adapter should use only the WPA3 authentication kind.
     * @type {Integer (Int32)}
     */
    static Wpa3 => 2
}
