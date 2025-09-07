#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\ShellCommandInfo.ahk
#Include .\UiInfo.ahk
#Include .\RepairInfo.ahk

/**
 * Contains detailed repair information that can be used to help resolve the root cause of an incident.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-repairinfoex
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class RepairInfoEx extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-repairinfo">RepairInfo</a></b>
     * 
     * The detailed repair information.
     * @type {RepairInfo}
     */
    repair{
        get {
            if(!this.HasProp("__repair"))
                this.__repair := RepairInfo(this.ptr + 0)
            return this.__repair
        }
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * The rank of the repair, relative to other repairs in the <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-rootcauseinfo">RootCauseInfo</a> structure associated with the incident. A repair with rank 1 is expected to be more relevant to the problem and thus will be the first repair to be attempted. The success of any individual repair is not guaranteed, regardless of its rank.
     * @type {Integer}
     */
    repairRank {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }
}
