#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSD_PROBE_MATCH_LIST.ahk
#Include .\WSD_PROBE_MATCH.ahk

/**
 * Represents a node in a single-linked list of ProbeMatch message structures.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_probe_match_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
class WSD_PROBE_MATCH_LIST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to the next node in the linked list of <b>WSD_PROBE_MATCH_LIST</b> structures.
     * @type {Pointer<WSD_PROBE_MATCH_LIST>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_probe_match">WSD_PROBE_MATCH</a> structure that contains the ProbeMatch message referenced by this node.
     * @type {Pointer<WSD_PROBE_MATCH>}
     */
    Element {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
