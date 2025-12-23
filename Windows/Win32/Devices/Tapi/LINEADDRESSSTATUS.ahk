#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEADDRESSSTATUS structure describes the current status of an address. The lineGetAddressStatus function and the TSPI_lineGetAddressStatus function return the LINEADDRESSSTATUS structure.
 * @remarks
 * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
 * 
 * This data structure is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetaddressstatus">lineGetAddressStatus</a> function. When items in this data structure change as a consequence of activities on the address, a 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-addressstate">LINE_ADDRESSSTATE</a> message is sent to the application. A parameter to this message is the address state, one of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddressstate--constants">LINEADDRESSSTATE_ constants</a>, which indicates that the status item in this record changed.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineaddressstatus
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEADDRESSSTATUS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
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
     * Number of stations that are currently using the address.
     * @type {Integer}
     */
    dwNumInUse {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of calls on the address that are in call states other than <i>idle</i>, <i>onhold</i>, <i>onholdpendingtransfer</i>, and <i>onholdpendingconference</i>.
     * @type {Integer}
     */
    dwNumActiveCalls {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of calls on the address in the <i>onhold</i> state.
     * @type {Integer}
     */
    dwNumOnHoldCalls {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of calls on the address in the <i>onholdpendingtransfer</i> or <i>onholdpendingconference</i> state.
     * @type {Integer}
     */
    dwNumOnHoldPendCalls {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Address-related functions that can be invoked on the address in its current state. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrfeature--constants">LINEADDRFEATURE_ constants</a>.
     * @type {Integer}
     */
    dwAddressFeatures {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Number of rings set for this address before an unanswered call is considered as no answer.
     * @type {Integer}
     */
    dwNumRingsNoAnswer {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Number of entries in the array referred to by <b>dwForwardSize</b> and <b>dwForwardOffset</b>.
     * @type {Integer}
     */
    dwForwardNumEntries {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Size of the forwarding information array, in bytes.
     * @type {Integer}
     */
    dwForwardSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field that describes the address's forwarding information. This information is an array of <b>dwForwardNumEntries</b> elements, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineforward">LINEFORWARD</a>. The offsets of the addresses in the array are relative to the beginning of the 
     * <b>LINEADDRESSSTATUS</b> structure. The offsets <b>dwCallerAddressOffset</b> and <b>dwDestAddressOffset</b> in the variably sized field of type 
     * <b>LINEFORWARD</b> pointed to by <i>dwForwardOffset</i> are relative to the beginning of the 
     * <b>LINEADDRESSSTATUS</b> data structure (the "root" container). The size of the array is specified by <b>dwForwardSize</b>.
     * @type {Integer}
     */
    dwForwardOffset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Size of the terminal modes array, in bytes.
     * @type {Integer}
     */
    dwTerminalModesSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Offset from the beginning of the structure to the variably sized device field containing an array with <b>DWORD</b>-sized entries, that use one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermmode--constants">LINETERMMODE_ constants</a>. This array is indexed by terminal identifiers, in the range from zero to one less than <b>dwNumTerminals</b>. Each entry in the array specifies the current terminal modes for the corresponding terminal set with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetterminal">lineSetTerminal</a> function for this address. The size of the array is specified by <b>dwTerminalModesSize</b>.
     * @type {Integer}
     */
    dwTerminalModesOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Size of the device-specific field, in bytes.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Offset from the beginning of this structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
