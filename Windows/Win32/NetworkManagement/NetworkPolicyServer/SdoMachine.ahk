#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Attach method attaches to an SDO computer. Attaching to an SDO computer is the first step is using the SDO API to administer that computer.
 * @remarks
 * Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-getattachedcomputer">ISdoMachine::GetAttachedComputer</a> method to determine if a computer is already attached.
 * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-attach
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class SdoMachine extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
