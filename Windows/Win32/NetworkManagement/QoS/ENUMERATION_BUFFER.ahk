#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TC_GEN_FILTER.ahk

/**
 * The ENUMERATION_BUFFER structure contains information specific to a given flow, including flow name, the number of filters associated with the flow, and an array of filters associated with the flow.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-enumeration_buffer
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class ENUMERATION_BUFFER extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

    /**
     * Number of bytes from the beginning of the 
     * <b>ENUMERATION_BUFFER</b> to the next 
     * <b>ENUMERATION_BUFFER</b>.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifies the owner of the process.
     * @type {Integer}
     */
    OwnerProcessId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the length of the <b>FlowName</b> member.
     * @type {Integer}
     */
    FlowNameLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Array of WCHAR characters, of length <b>MAX_STRING_LENGTH</b>, that specifies the flow name.
     * @type {String}
     */
    FlowName {
        get => StrGet(this.ptr + 10, 255, "UTF-16")
        set => StrPut(value, this.ptr + 10, 255, "UTF-16")
    }

    /**
     * Pointer to the corresponding 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_flow">TC_GEN_FLOW</a> structure. This structure is placed immediately after the array of TC_GEN_FILTERS and is included in <b>Length</b>.
     * @type {Pointer<TC_GEN_FLOW>}
     */
    pFlow {
        get => NumGet(this, 528, "ptr")
        set => NumPut("ptr", value, this, 528)
    }

    /**
     * Specifies the number of filters associated with the flow.
     * @type {Integer}
     */
    NumberOfFilters {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_filter">TC_GEN_FILTER</a> structures. The number of elements in the array corresponds to the number of filters attached to the specified flow. Note that in order to enumerate through the array of 
     * <b>TC_GEN_FILTER</b> structures, you need to increment the pointer to the current 
     * <b>TC_GEN_FILTER</b> by using the following: 
     * 
     * 
     * 
     * 
     * sizeof(TC_GEN_FILTER) + 2 * [the pattern size of the current 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_filter">TC_GEN_FILTER</a> structure].
     * @type {Array<TC_GEN_FILTER>}
     */
    GenericFilter{
        get {
            if(!this.HasProp("__GenericFilterProxyArray"))
                this.__GenericFilterProxyArray := Win32FixedArray(this.ptr + 544, 1, TC_GEN_FILTER, "")
            return this.__GenericFilterProxyArray
        }
    }
}
