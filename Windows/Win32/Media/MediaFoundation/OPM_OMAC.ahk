#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * OPM_OMAC (opmapi.h) contains a Message Authentication Code (MAC) for an Output Protection Manager (OPM) message.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_omac
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_OMAC {
    #StructPack 1

    /**
     * A buffer that contains the cryptographic MAC value of the message.
     */
    abOMAC : Int8[16]

}
