#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\REPAIR_RISK.ahk" { REPAIR_RISK }
#Import ".\REPAIR_SCOPE.ahk" { REPAIR_SCOPE }
#Import ".\RepairInfo.ahk" { RepairInfo }
#Import ".\ShellCommandInfo.ahk" { ShellCommandInfo }
#Import ".\UI_INFO_TYPE.ahk" { UI_INFO_TYPE }
#Import ".\UiInfo.ahk" { UiInfo }

/**
 * Contains detailed repair information that can be used to help resolve the root cause of an incident.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-repairinfoex
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct RepairInfoEx {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-repairinfo">RepairInfo</a></b>
     * 
     * The detailed repair information.
     */
    repair : RepairInfo

    /**
     * Type: <b>USHORT</b>
     * 
     * The rank of the repair, relative to other repairs in the <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-rootcauseinfo">RootCauseInfo</a> structure associated with the incident. A repair with rank 1 is expected to be more relevant to the problem and thus will be the first repair to be attempted. The success of any individual repair is not guaranteed, regardless of its rank.
     */
    repairRank : UInt16

}
