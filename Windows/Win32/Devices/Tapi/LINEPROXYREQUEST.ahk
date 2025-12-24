#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LINEAGENTGROUPLIST.ahk
#Include .\LINEAGENTCAPS.ahk
#Include .\LINEAGENTSTATUS.ahk
#Include .\LINEAGENTACTIVITYLIST.ahk
#Include ..\..\System\Com\CY.ahk
#Include .\LINEAGENTINFO.ahk
#Include .\LINEAGENTSESSIONLIST.ahk
#Include .\LINEAGENTSESSIONINFO.ahk
#Include .\LINEQUEUELIST.ahk
#Include .\LINEQUEUEINFO.ahk

/**
 * The LINEPROXYREQUEST structure contains parameter values of the application making the proxy request. Multiple TAPI call center functions generate a LINE_PROXYREQUEST message that references a LINEPROXYREQUEST structure.
 * @remarks
 * An address identifier is permanently associated with an address; the identifier remains constant across operating system upgrades.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineproxyrequest
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEPROXYREQUEST extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Total number of bytes allocated by TAPI to contain the 
     * <b>LINEPROXYREQUEST</b> structure. The <b>dwTotalSize</b> member of any structure contained within 
     * <b>LINEPROXYREQUEST</b> (for example, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentcaps">LINEAGENTCAPS</a>) reflects only the number of bytes allocated for that specific structure.
     * Total size, in bytes, of the <i>Params</i> parameter block.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the client machine name string, in bytes, including the <b>null</b>-terminating character.
     * @type {Integer}
     */
    dwClientMachineNameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string identifying the client machine that made this request. The size of the string is specified by <b>dwClientMachineNameSize</b>.
     * @type {Integer}
     */
    dwClientMachineNameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size of the client user name string, in bytes, including the <b>null</b>-terminating character.
     * @type {Integer}
     */
    dwClientUserNameSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string identifying the user under whose account the application is running on the client machine. The size of the string is specified by <b>dwClientUserNameSize</b>.
     * @type {Integer}
     */
    dwClientUserNameOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Highest API version supported by the application that made the request. The proxy handler should restrict the contents of any data returned to the application to those members and values that were defined in this, or earlier, versions of TAPI.
     * @type {Integer}
     */
    dwClientAppAPIVersion {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineproxyrequest--constants">LINEPROXYREQUEST_ Constants</a>. Identifies the type of function and the union component that defines the remaining data in the structure.
     * @type {Integer}
     */
    dwRequestType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    class _SetAgentGroup extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwAddressID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEAGENTGROUPLIST}
         */
        GroupList{
            get {
                if(!this.HasProp("__GroupList"))
                    this.__GroupList := LINEAGENTGROUPLIST(8, this)
                return this.__GroupList
            }
        }
    
    }

    class _SetAgentState extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {Integer}
         */
        dwAddressID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentState {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwNextAgentState {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _SetAgentActivity extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        dwAddressID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwActivityID {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _GetAgentCaps extends Win32Struct {
        static sizeof => 72
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwAddressID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEAGENTCAPS}
         */
        AgentCaps{
            get {
                if(!this.HasProp("__AgentCaps"))
                    this.__AgentCaps := LINEAGENTCAPS(8, this)
                return this.__AgentCaps
            }
        }
    
    }

    class _GetAgentStatus extends Win32Struct {
        static sizeof => 64
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwAddressID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEAGENTSTATUS}
         */
        AgentStatus{
            get {
                if(!this.HasProp("__AgentStatus"))
                    this.__AgentStatus := LINEAGENTSTATUS(8, this)
                return this.__AgentStatus
            }
        }
    
    }

    class _AgentSpecific extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Integer}
         */
        dwAddressID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentExtensionIDIndex {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwSize {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Array<Byte>}
         */
        Params{
            get {
                if(!this.HasProp("__ParamsProxyArray"))
                    this.__ParamsProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
                return this.__ParamsProxyArray
            }
        }
    
    }

    class _GetAgentActivityList extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwAddressID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEAGENTACTIVITYLIST}
         */
        ActivityList{
            get {
                if(!this.HasProp("__ActivityList"))
                    this.__ActivityList := LINEAGENTACTIVITYLIST(8, this)
                return this.__ActivityList
            }
        }
    
    }

    class _GetAgentGroupList extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwAddressID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEAGENTGROUPLIST}
         */
        GroupList{
            get {
                if(!this.HasProp("__GroupList"))
                    this.__GroupList := LINEAGENTGROUPLIST(8, this)
                return this.__GroupList
            }
        }
    
    }

    class _CreateAgent extends Win32Struct {
        static sizeof => 20
        static packingSize => 4

        /**
         * @type {Integer}
         */
        hAgent {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentIDSize {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentIDOffset {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentPINSize {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentPINOffset {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    class _SetAgentStateEx extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {Integer}
         */
        hAgent {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentState {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwNextAgentState {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _SetAgentMeasurementPeriod extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        hAgent {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwMeasurementPeriod {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _GetAgentInfo extends Win32Struct {
        static sizeof => 72
        static packingSize => 8

        /**
         * @type {Integer}
         */
        hAgent {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEAGENTINFO}
         */
        AgentInfo{
            get {
                if(!this.HasProp("__AgentInfo"))
                    this.__AgentInfo := LINEAGENTINFO(8, this)
                return this.__AgentInfo
            }
        }
    
    }

    class _CreateAgentSession extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        hAgentSession {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentPINSize {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentPINOffset {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        hAgent {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        GroupID {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        dwWorkingAddressID {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
    }

    class _GetAgentSessionList extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        hAgent {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEAGENTSESSIONLIST}
         */
        SessionList{
            get {
                if(!this.HasProp("__SessionList"))
                    this.__SessionList := LINEAGENTSESSIONLIST(8, this)
                return this.__SessionList
            }
        }
    
    }

    class _GetAgentSessionInfo extends Win32Struct {
        static sizeof => 96
        static packingSize => 8

        /**
         * @type {Integer}
         */
        hAgentSession {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEAGENTSESSIONINFO}
         */
        SessionInfo{
            get {
                if(!this.HasProp("__SessionInfo"))
                    this.__SessionInfo := LINEAGENTSESSIONINFO(8, this)
                return this.__SessionInfo
            }
        }
    
    }

    class _SetAgentSessionState extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {Integer}
         */
        hAgentSession {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwAgentSessionState {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        dwNextAgentSessionState {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _GetQueueList extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        GroupID {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {LINEQUEUELIST}
         */
        QueueList{
            get {
                if(!this.HasProp("__QueueList"))
                    this.__QueueList := LINEQUEUELIST(8, this)
                return this.__QueueList
            }
        }
    
    }

    class _SetQueueMeasurementPeriod extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        dwQueueID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        dwMeasurementPeriod {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _GetQueueInfo extends Win32Struct {
        static sizeof => 64
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwQueueID {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {LINEQUEUEINFO}
         */
        QueueInfo{
            get {
                if(!this.HasProp("__QueueInfo"))
                    this.__QueueInfo := LINEQUEUEINFO(8, this)
                return this.__QueueInfo
            }
        }
    
    }

    class _GetGroupList extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {LINEAGENTGROUPLIST}
         */
        GroupList{
            get {
                if(!this.HasProp("__GroupList"))
                    this.__GroupList := LINEAGENTGROUPLIST(0, this)
                return this.__GroupList
            }
        }
    
    }

    /**
     * @type {_SetAgentGroup}
     */
    SetAgentGroup{
        get {
            if(!this.HasProp("__SetAgentGroup"))
                this.__SetAgentGroup := %this.__Class%._SetAgentGroup(32, this)
            return this.__SetAgentGroup
        }
    }

    /**
     * @type {_SetAgentState}
     */
    SetAgentState{
        get {
            if(!this.HasProp("__SetAgentState"))
                this.__SetAgentState := %this.__Class%._SetAgentState(32, this)
            return this.__SetAgentState
        }
    }

    /**
     * @type {_SetAgentActivity}
     */
    SetAgentActivity{
        get {
            if(!this.HasProp("__SetAgentActivity"))
                this.__SetAgentActivity := %this.__Class%._SetAgentActivity(32, this)
            return this.__SetAgentActivity
        }
    }

    /**
     * @type {_GetAgentCaps}
     */
    GetAgentCaps{
        get {
            if(!this.HasProp("__GetAgentCaps"))
                this.__GetAgentCaps := %this.__Class%._GetAgentCaps(32, this)
            return this.__GetAgentCaps
        }
    }

    /**
     * @type {_GetAgentStatus}
     */
    GetAgentStatus{
        get {
            if(!this.HasProp("__GetAgentStatus"))
                this.__GetAgentStatus := %this.__Class%._GetAgentStatus(32, this)
            return this.__GetAgentStatus
        }
    }

    /**
     * @type {_AgentSpecific}
     */
    AgentSpecific{
        get {
            if(!this.HasProp("__AgentSpecific"))
                this.__AgentSpecific := %this.__Class%._AgentSpecific(32, this)
            return this.__AgentSpecific
        }
    }

    /**
     * @type {_GetAgentActivityList}
     */
    GetAgentActivityList{
        get {
            if(!this.HasProp("__GetAgentActivityList"))
                this.__GetAgentActivityList := %this.__Class%._GetAgentActivityList(32, this)
            return this.__GetAgentActivityList
        }
    }

    /**
     * @type {_GetAgentGroupList}
     */
    GetAgentGroupList{
        get {
            if(!this.HasProp("__GetAgentGroupList"))
                this.__GetAgentGroupList := %this.__Class%._GetAgentGroupList(32, this)
            return this.__GetAgentGroupList
        }
    }

    /**
     * @type {_CreateAgent}
     */
    CreateAgent{
        get {
            if(!this.HasProp("__CreateAgent"))
                this.__CreateAgent := %this.__Class%._CreateAgent(32, this)
            return this.__CreateAgent
        }
    }

    /**
     * @type {_SetAgentStateEx}
     */
    SetAgentStateEx{
        get {
            if(!this.HasProp("__SetAgentStateEx"))
                this.__SetAgentStateEx := %this.__Class%._SetAgentStateEx(32, this)
            return this.__SetAgentStateEx
        }
    }

    /**
     * @type {_SetAgentMeasurementPeriod}
     */
    SetAgentMeasurementPeriod{
        get {
            if(!this.HasProp("__SetAgentMeasurementPeriod"))
                this.__SetAgentMeasurementPeriod := %this.__Class%._SetAgentMeasurementPeriod(32, this)
            return this.__SetAgentMeasurementPeriod
        }
    }

    /**
     * @type {_GetAgentInfo}
     */
    GetAgentInfo{
        get {
            if(!this.HasProp("__GetAgentInfo"))
                this.__GetAgentInfo := %this.__Class%._GetAgentInfo(32, this)
            return this.__GetAgentInfo
        }
    }

    /**
     * @type {_CreateAgentSession}
     */
    CreateAgentSession{
        get {
            if(!this.HasProp("__CreateAgentSession"))
                this.__CreateAgentSession := %this.__Class%._CreateAgentSession(32, this)
            return this.__CreateAgentSession
        }
    }

    /**
     * @type {_GetAgentSessionList}
     */
    GetAgentSessionList{
        get {
            if(!this.HasProp("__GetAgentSessionList"))
                this.__GetAgentSessionList := %this.__Class%._GetAgentSessionList(32, this)
            return this.__GetAgentSessionList
        }
    }

    /**
     * @type {_GetAgentSessionInfo}
     */
    GetAgentSessionInfo{
        get {
            if(!this.HasProp("__GetAgentSessionInfo"))
                this.__GetAgentSessionInfo := %this.__Class%._GetAgentSessionInfo(32, this)
            return this.__GetAgentSessionInfo
        }
    }

    /**
     * @type {_SetAgentSessionState}
     */
    SetAgentSessionState{
        get {
            if(!this.HasProp("__SetAgentSessionState"))
                this.__SetAgentSessionState := %this.__Class%._SetAgentSessionState(32, this)
            return this.__SetAgentSessionState
        }
    }

    /**
     * @type {_GetQueueList}
     */
    GetQueueList{
        get {
            if(!this.HasProp("__GetQueueList"))
                this.__GetQueueList := %this.__Class%._GetQueueList(32, this)
            return this.__GetQueueList
        }
    }

    /**
     * @type {_SetQueueMeasurementPeriod}
     */
    SetQueueMeasurementPeriod{
        get {
            if(!this.HasProp("__SetQueueMeasurementPeriod"))
                this.__SetQueueMeasurementPeriod := %this.__Class%._SetQueueMeasurementPeriod(32, this)
            return this.__SetQueueMeasurementPeriod
        }
    }

    /**
     * @type {_GetQueueInfo}
     */
    GetQueueInfo{
        get {
            if(!this.HasProp("__GetQueueInfo"))
                this.__GetQueueInfo := %this.__Class%._GetQueueInfo(32, this)
            return this.__GetQueueInfo
        }
    }

    /**
     * @type {_GetGroupList}
     */
    GetGroupList{
        get {
            if(!this.HasProp("__GetGroupList"))
                this.__GetGroupList := %this.__Class%._GetGroupList(32, this)
            return this.__GetGroupList
        }
    }
}
