#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LINEAGENTSESSIONINFO.ahk" { LINEAGENTSESSIONINFO }
#Import ".\LINEAGENTSTATUS.ahk" { LINEAGENTSTATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\LINEAGENTINFO.ahk" { LINEAGENTINFO }
#Import ".\LINEAGENTGROUPLIST.ahk" { LINEAGENTGROUPLIST }
#Import ".\LINEQUEUELIST.ahk" { LINEQUEUELIST }
#Import ".\LINEQUEUEINFO.ahk" { LINEQUEUEINFO }
#Import ".\LINEAGENTCAPS.ahk" { LINEAGENTCAPS }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import ".\LINEAGENTSESSIONLIST.ahk" { LINEAGENTSESSIONLIST }
#Import ".\LINEAGENTACTIVITYLIST.ahk" { LINEAGENTACTIVITYLIST }

/**
 * The LINEPROXYREQUEST structure contains parameter values of the application making the proxy request. Multiple TAPI call center functions generate a LINE_PROXYREQUEST message that references a LINEPROXYREQUEST structure.
 * @remarks
 * An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineproxyrequest
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEPROXYREQUEST {
    #StructPack 8


    struct _SetAgentGroup {
        dwAddressID : UInt32

        GroupList : LINEAGENTGROUPLIST

    }

    struct _SetAgentState {
        dwAddressID : UInt32

        dwAgentState : UInt32

        dwNextAgentState : UInt32

    }

    struct _SetAgentActivity {
        dwAddressID : UInt32

        dwActivityID : UInt32

    }

    struct _GetAgentCaps {
        dwAddressID : UInt32

        AgentCaps : LINEAGENTCAPS

    }

    struct _GetAgentStatus {
        dwAddressID : UInt32

        AgentStatus : LINEAGENTSTATUS

    }

    struct _AgentSpecific {
        dwAddressID : UInt32

        dwAgentExtensionIDIndex : UInt32

        dwSize : UInt32

        Params : Int8[1]

    }

    struct _GetAgentActivityList {
        dwAddressID : UInt32

        ActivityList : LINEAGENTACTIVITYLIST

    }

    struct _GetAgentGroupList {
        dwAddressID : UInt32

        GroupList : LINEAGENTGROUPLIST

    }

    struct _CreateAgent {
        hAgent : UInt32

        dwAgentIDSize : UInt32

        dwAgentIDOffset : UInt32

        dwAgentPINSize : UInt32

        dwAgentPINOffset : UInt32

    }

    struct _SetAgentStateEx {
        hAgent : UInt32

        dwAgentState : UInt32

        dwNextAgentState : UInt32

    }

    struct _SetAgentMeasurementPeriod {
        hAgent : UInt32

        dwMeasurementPeriod : UInt32

    }

    struct _GetAgentInfo {
        hAgent : UInt32

        AgentInfo : LINEAGENTINFO

    }

    struct _CreateAgentSession {
        hAgentSession : UInt32

        dwAgentPINSize : UInt32

        dwAgentPINOffset : UInt32

        hAgent : UInt32

        GroupID : Guid

        dwWorkingAddressID : UInt32

    }

    struct _GetAgentSessionList {
        hAgent : UInt32

        SessionList : LINEAGENTSESSIONLIST

    }

    struct _GetAgentSessionInfo {
        hAgentSession : UInt32

        SessionInfo : LINEAGENTSESSIONINFO

    }

    struct _SetAgentSessionState {
        hAgentSession : UInt32

        dwAgentSessionState : UInt32

        dwNextAgentSessionState : UInt32

    }

    struct _GetQueueList {
        GroupID : Guid

        QueueList : LINEQUEUELIST

    }

    struct _SetQueueMeasurementPeriod {
        dwQueueID : UInt32

        dwMeasurementPeriod : UInt32

    }

    struct _GetQueueInfo {
        dwQueueID : UInt32

        QueueInfo : LINEQUEUEINFO

    }

    struct _GetGroupList {
        GroupList : LINEAGENTGROUPLIST

    }

    /**
     * Total number of bytes allocated by TAPI to contain the 
     * <b>LINEPROXYREQUEST</b> structure. The <b>dwTotalSize</b> member of any structure contained within 
     * <b>LINEPROXYREQUEST</b> (for example, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentcaps">LINEAGENTCAPS</a>) reflects only the number of bytes allocated for that specific structure.
     * Total size, in bytes, of the <i>Params</i> parameter block.
     */
    dwSize : UInt32

    /**
     * Size of the client machine name string, in bytes, including the <b>null</b>-terminating character.
     */
    dwClientMachineNameSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string identifying the client machine that made this request. The size of the string is specified by <b>dwClientMachineNameSize</b>.
     */
    dwClientMachineNameOffset : UInt32

    /**
     * Size of the client user name string, in bytes, including the <b>null</b>-terminating character.
     */
    dwClientUserNameSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string identifying the user under whose account the application is running on the client machine. The size of the string is specified by <b>dwClientUserNameSize</b>.
     */
    dwClientUserNameOffset : UInt32

    /**
     * Highest API version supported by the application that made the request. The proxy handler should restrict the contents of any data returned to the application to those members and values that were defined in this, or earlier, versions of TAPI.
     */
    dwClientAppAPIVersion : UInt32

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineproxyrequest--constants">LINEPROXYREQUEST_ Constants</a>. Identifies the type of function and the union component that defines the remaining data in the structure.
     */
    dwRequestType : UInt32

    SetAgentGroup : LINEPROXYREQUEST._SetAgentGroup

    static __New() {
        DefineProp(this.Prototype, 'SetAgentState', { type: LINEPROXYREQUEST._SetAgentState, offset: 32 })
        DefineProp(this.Prototype, 'SetAgentActivity', { type: LINEPROXYREQUEST._SetAgentActivity, offset: 32 })
        DefineProp(this.Prototype, 'GetAgentCaps', { type: LINEPROXYREQUEST._GetAgentCaps, offset: 32 })
        DefineProp(this.Prototype, 'GetAgentStatus', { type: LINEPROXYREQUEST._GetAgentStatus, offset: 32 })
        DefineProp(this.Prototype, 'AgentSpecific', { type: LINEPROXYREQUEST._AgentSpecific, offset: 32 })
        DefineProp(this.Prototype, 'GetAgentActivityList', { type: LINEPROXYREQUEST._GetAgentActivityList, offset: 32 })
        DefineProp(this.Prototype, 'GetAgentGroupList', { type: LINEPROXYREQUEST._GetAgentGroupList, offset: 32 })
        DefineProp(this.Prototype, 'CreateAgent', { type: LINEPROXYREQUEST._CreateAgent, offset: 32 })
        DefineProp(this.Prototype, 'SetAgentStateEx', { type: LINEPROXYREQUEST._SetAgentStateEx, offset: 32 })
        DefineProp(this.Prototype, 'SetAgentMeasurementPeriod', { type: LINEPROXYREQUEST._SetAgentMeasurementPeriod, offset: 32 })
        DefineProp(this.Prototype, 'GetAgentInfo', { type: LINEPROXYREQUEST._GetAgentInfo, offset: 32 })
        DefineProp(this.Prototype, 'CreateAgentSession', { type: LINEPROXYREQUEST._CreateAgentSession, offset: 32 })
        DefineProp(this.Prototype, 'GetAgentSessionList', { type: LINEPROXYREQUEST._GetAgentSessionList, offset: 32 })
        DefineProp(this.Prototype, 'GetAgentSessionInfo', { type: LINEPROXYREQUEST._GetAgentSessionInfo, offset: 32 })
        DefineProp(this.Prototype, 'SetAgentSessionState', { type: LINEPROXYREQUEST._SetAgentSessionState, offset: 32 })
        DefineProp(this.Prototype, 'GetQueueList', { type: LINEPROXYREQUEST._GetQueueList, offset: 32 })
        DefineProp(this.Prototype, 'SetQueueMeasurementPeriod', { type: LINEPROXYREQUEST._SetQueueMeasurementPeriod, offset: 32 })
        DefineProp(this.Prototype, 'GetQueueInfo', { type: LINEPROXYREQUEST._GetQueueInfo, offset: 32 })
        DefineProp(this.Prototype, 'GetGroupList', { type: LINEPROXYREQUEST._GetGroupList, offset: 32 })
        this.DeleteProp("__New")
    }
}
