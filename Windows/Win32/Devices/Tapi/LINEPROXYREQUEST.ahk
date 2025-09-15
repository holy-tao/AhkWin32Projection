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
    static sizeof => 40

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

    /**
     * @type {Integer}
     */
    dwAddressID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {LINEAGENTGROUPLIST}
     */
    GroupList{
        get {
            if(!this.HasProp("__GroupList"))
                this.__GroupList := LINEAGENTGROUPLIST(this.ptr + 40)
            return this.__GroupList
        }
    }

    /**
     * @type {Integer}
     */
    dwAgentState {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwNextAgentState {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwActivityID {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {LINEAGENTCAPS}
     */
    AgentCaps{
        get {
            if(!this.HasProp("__AgentCaps"))
                this.__AgentCaps := LINEAGENTCAPS(this.ptr + 40)
            return this.__AgentCaps
        }
    }

    /**
     * @type {LINEAGENTSTATUS}
     */
    AgentStatus{
        get {
            if(!this.HasProp("__AgentStatus"))
                this.__AgentStatus := LINEAGENTSTATUS(this.ptr + 40)
            return this.__AgentStatus
        }
    }

    /**
     * @type {Integer}
     */
    dwAgentExtensionIDIndex {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwSize1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<Byte>}
     */
    Params{
        get {
            if(!this.HasProp("__ParamsProxyArray"))
                this.__ParamsProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__ParamsProxyArray
        }
    }

    /**
     * @type {LINEAGENTACTIVITYLIST}
     */
    ActivityList{
        get {
            if(!this.HasProp("__ActivityList"))
                this.__ActivityList := LINEAGENTACTIVITYLIST(this.ptr + 40)
            return this.__ActivityList
        }
    }

    /**
     * @type {Integer}
     */
    hAgent {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwAgentIDSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwAgentIDOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwAgentPINSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    dwAgentPINOffset {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwMeasurementPeriod {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {LINEAGENTINFO}
     */
    AgentInfo{
        get {
            if(!this.HasProp("__AgentInfo"))
                this.__AgentInfo := LINEAGENTINFO(this.ptr + 40)
            return this.__AgentInfo
        }
    }

    /**
     * @type {Integer}
     */
    hAgentSession {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwAgentPINSize1 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwAgentPINOffset1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    hAgent1 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Pointer<Guid>}
     */
    GroupID {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwWorkingAddressID {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {LINEAGENTSESSIONLIST}
     */
    SessionList{
        get {
            if(!this.HasProp("__SessionList"))
                this.__SessionList := LINEAGENTSESSIONLIST(this.ptr + 40)
            return this.__SessionList
        }
    }

    /**
     * @type {LINEAGENTSESSIONINFO}
     */
    SessionInfo{
        get {
            if(!this.HasProp("__SessionInfo"))
                this.__SessionInfo := LINEAGENTSESSIONINFO(this.ptr + 40)
            return this.__SessionInfo
        }
    }

    /**
     * @type {Integer}
     */
    dwAgentSessionState {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwNextAgentSessionState {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Guid>}
     */
    GroupID1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {LINEQUEUELIST}
     */
    QueueList{
        get {
            if(!this.HasProp("__QueueList"))
                this.__QueueList := LINEQUEUELIST(this.ptr + 40)
            return this.__QueueList
        }
    }

    /**
     * @type {Integer}
     */
    dwQueueID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {LINEQUEUEINFO}
     */
    QueueInfo{
        get {
            if(!this.HasProp("__QueueInfo"))
                this.__QueueInfo := LINEQUEUEINFO(this.ptr + 40)
            return this.__QueueInfo
        }
    }

    /**
     * @type {LINEAGENTGROUPLIST}
     */
    GroupList1{
        get {
            if(!this.HasProp("__GroupList1"))
                this.__GroupList1 := LINEAGENTGROUPLIST(this.ptr + 32)
            return this.__GroupList1
        }
    }
}
