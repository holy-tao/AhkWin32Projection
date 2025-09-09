#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the key selection vector (KSV) for a High-Bandwidth Digital Content Protection (HDCP) receiver.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_hdcp_key_selection_vector
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_HDCP_KEY_SELECTION_VECTOR extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * A buffer that contains the device's KSV. (This is the value named <i>Bksv</i> in the HDCP specification.)
     * @type {Array<Byte>}
     */
    abKeySelectionVector{
        get {
            if(!this.HasProp("__abKeySelectionVectorProxyArray"))
                this.__abKeySelectionVectorProxyArray := Win32FixedArray(this.ptr + 0, 5, Primitive, "char")
            return this.__abKeySelectionVectorProxyArray
        }
    }
}
