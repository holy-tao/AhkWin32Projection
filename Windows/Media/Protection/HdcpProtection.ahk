#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the level of protection of an [HdcpSession](hdcpsession.md) instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.hdcpprotection
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class HdcpProtection extends Win32Enum{

    /**
     * HDCP is off.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * HDCP is on.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * HDCP is on with type enforcement (other connected devices/monitors, besides the one that the content is running on, have HDCP required).
     * @type {Integer (Int32)}
     */
    static OnWithTypeEnforcement => 2
}
