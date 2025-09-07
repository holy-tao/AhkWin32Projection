#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * OPM_GET_CODEC_INFO_PARAMETERS (opmapi.h) contains information for the OPM_GET_CODEC_INFO command.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_get_codec_info_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_GET_CODEC_INFO_PARAMETERS extends Win32Struct
{
    static sizeof => 4056

    static packingSize => 1

    /**
     * The amount of valid data in the <b>Verifier</b> array, in bytes.
     * @type {Integer}
     */
    cbVerifier {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A byte array that contains one of the following:
     * 
     * <ul>
     * <li>The CLSID of the Media Foundation transform (MFT) that represents the hardware codec.</li>
     * <li>A null-terminated, wide-character string that contains the symbolic link for the hardware codec. Include the size of the terminating null in the value of the <b>cbVerifier</b> member. </li>
     * </ul>
     * @type {Array<Byte>}
     */
    Verifier{
        get {
            if(!this.HasProp("__VerifierProxyArray"))
                this.__VerifierProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__VerifierProxyArray
        }
    }
}
