#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTCAPS structure describes the capabilities of an ACD agent. The lineGetAgentCaps function returns the LINEAGENTCAPS structure.
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineagentcaps
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTCAPS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size needed to hold all the information requested, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size of the agent handler information, in bytes.
     * @type {Integer}
     */
    dwAgentHandlerInfoSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset from the beginning of the structure to a null-terminated string specifying the name, version, or other identifying information of the server application that is handling agent requests. The size of the string is specified by <b>dwAgentHandlerInfoSize</b>.
     * @type {Integer}
     */
    dwAgentHandlerInfoOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * TAPI version that the agent handler application used in preparing the contents of this structure. This is no greater than the API version that the calling application passed in to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetagentcapsa">lineGetAgentCaps</a>.
     * @type {Integer}
     */
    dwCapsVersion {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Agent-related features available for this line using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentfeature--constants">LINEAGENTFEATURE_ constants</a>. Invoking a supported feature requires the line and address to be in the proper state. A zero in a bit position indicates that the corresponding feature is never available. A one indicates that the corresponding feature may be available if the line is in the appropriate state for the operation to be meaningful. This field allows an application to discover which agent features can be (and which can never be) supported by the device.
     * @type {Integer}
     */
    dwFeatures {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstate--constants">LINEAGENTSTATE_ constants</a> that can be used in the <i>dwAgentState</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentState</a>. Setting a supported state requires the line and address to be in the proper state. A zero in a bit position indicates that the corresponding state is never available. A one indicates that the corresponding state may be available if the line is in the appropriate state for the state to be meaningful. This field allows an application to discover which agent states can be (and which can never be) supported on the device.
     * @type {Integer}
     */
    dwStates {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * LINEAGENTSTATE_ constants that can be used in the <i>dwNextAgentState</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentstate">lineSetAgentState</a>. Setting a supported state requires the line and address to be in the proper state. A zero in a bit position indicates that the corresponding state is never available. A one indicates that the corresponding state may be available if the line is in the appropriate state for the state to be meaningful. This field allows an application to discover which agent states can be (and which can never be) supported on the device.
     * @type {Integer}
     */
    dwNextStates {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Maximum number of agent identifiers that can be logged in on the address simultaneously. Determines the highest value that can be passed in as the <b>dwNumEntries</b> member in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgrouplist">LINEAGENTGROUPLIST</a> structure to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetagentgroup">lineSetAgentGroup</a>.
     * @type {Integer}
     */
    dwMaxNumGroupEntries {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Indicates the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineagentstatus--constants">LINEAGENTSTATUS_ constants</a> that can be received by the application in <i>dwParam2</i> of a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-agentstatus">LINE_AGENTSTATUS</a> message.
     * @type {Integer}
     */
    dwAgentStatusMessages {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a> structures that appear in the <i>ExtensionIDList</i> array. The value is 0 if agent-handler-specific extensions are supported on the address.
     * @type {Integer}
     */
    dwNumAgentExtensionIDs {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Size of the agent extension IDs array, in bytes.
     * @type {Integer}
     */
    dwAgentExtensionIDListSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineextensionid">LINEEXTENSIONID</a> structures. The size is <b>dwNumExtensionIDs</b> times SIZEOF(LINEEXTENSIONID). The array lists the 128-bit universally unique identifiers for all agent-handler-specific extensions supported by the agent handle for the address. The extension being used is referenced in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineagentspecific">lineAgentSpecific</a> function and 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-agentspecific">LINE_AGENTSPECIFIC</a> message by its position in this table, the first entry being entry 0, so it is important that the agent handler always present extension identifiers in this array in the same order. The size of the array is specified by <b>dwAgentExtensionIDListOffset</b>.
     * @type {Integer}
     */
    dwAgentExtensionIDListOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * GUID for ACD proxy associated with the line. This element is exposed only to applications that negotiate a TAPI version of 2.2 or higher.
     * @type {Pointer<Guid>}
     */
    ProxyGUID {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
