#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the key selection vector (KSV) for a High-Bandwidth Digital Content Protection (HDCP) receiver.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_hdcp_key_selection_vector
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_HDCP_KEY_SELECTION_VECTOR {
    #StructPack 1

    /**
     * A buffer that contains the device's KSV. (This is the value named <i>Bksv</i> in the HDCP specification.)
     */
    abKeySelectionVector : Int8[5]

}
