#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct LINEADDRESSSTATUS {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Number of stations that are currently using the address.
     */
    dwNumInUse : UInt32

    /**
     * Number of calls on the address that are in call states other than <i>idle</i>, <i>onhold</i>, <i>onholdpendingtransfer</i>, and <i>onholdpendingconference</i>.
     */
    dwNumActiveCalls : UInt32

    /**
     * Number of calls on the address in the <i>onhold</i> state.
     */
    dwNumOnHoldCalls : UInt32

    /**
     * Number of calls on the address in the <i>onholdpendingtransfer</i> or <i>onholdpendingconference</i> state.
     */
    dwNumOnHoldPendCalls : UInt32

    /**
     * Address-related functions that can be invoked on the address in its current state. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrfeature--constants">LINEADDRFEATURE_ constants</a>.
     */
    dwAddressFeatures : UInt32

    /**
     * Number of rings set for this address before an unanswered call is considered as no answer.
     */
    dwNumRingsNoAnswer : UInt32

    /**
     * Number of entries in the array referred to by <b>dwForwardSize</b> and <b>dwForwardOffset</b>.
     */
    dwForwardNumEntries : UInt32

    /**
     * Size of the forwarding information array, in bytes.
     */
    dwForwardSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field that describes the address's forwarding information. This information is an array of <b>dwForwardNumEntries</b> elements, of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineforward">LINEFORWARD</a>. The offsets of the addresses in the array are relative to the beginning of the 
     * <b>LINEADDRESSSTATUS</b> structure. The offsets <b>dwCallerAddressOffset</b> and <b>dwDestAddressOffset</b> in the variably sized field of type 
     * <b>LINEFORWARD</b> pointed to by <i>dwForwardOffset</i> are relative to the beginning of the 
     * <b>LINEADDRESSSTATUS</b> data structure (the "root" container). The size of the array is specified by <b>dwForwardSize</b>.
     */
    dwForwardOffset : UInt32

    /**
     * Size of the terminal modes array, in bytes.
     */
    dwTerminalModesSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized device field containing an array with <b>DWORD</b>-sized entries, that use one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linetermmode--constants">LINETERMMODE_ constants</a>. This array is indexed by terminal identifiers, in the range from zero to one less than <b>dwNumTerminals</b>. Each entry in the array specifies the current terminal modes for the corresponding terminal set with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetterminal">lineSetTerminal</a> function for this address. The size of the array is specified by <b>dwTerminalModesSize</b>.
     */
    dwTerminalModesOffset : UInt32

    /**
     * Size of the device-specific field, in bytes.
     */
    dwDevSpecificSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificSize</b>.
     */
    dwDevSpecificOffset : UInt32

}
