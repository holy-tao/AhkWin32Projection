#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the runtime ID for an element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rawelementproviderruntimeid
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class RawElementProviderRuntimeId extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The first part of the identifier.
     * @type {Integer}
     */
    Part1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The second part of the identifier.
     * @type {Integer}
     */
    Part2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
