#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AMCOPPSignature structure contains the signature needed for the IAMCertifiedOutputProtection::SessionSequenceStart method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-amcoppsignature
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMCOPPSignature {
    #StructPack 1

    /**
     * Buffer that contains the signature. For more information, see the Remarks section for the <b>SessionSequenceStart</b> method.
     */
    Signature : Int8[256]

}
