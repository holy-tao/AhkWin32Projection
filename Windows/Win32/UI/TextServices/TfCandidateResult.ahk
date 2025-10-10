#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TfCandidateResult enumeration are used with the ITfCandidateList::SetResult method to specify the result of a reconversion operation performed on a given candidate string.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/ne-ctffunc-tfcandidateresult
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfCandidateResult{

    /**
     * The candidate string has been selected and accepted. The previous text should be replaced with the specified candidate.
     * @type {Integer (Int32)}
     */
    static CAND_FINALIZED => 0

    /**
     * The candidate string has been selected, but the selection is not yet final.
     * @type {Integer (Int32)}
     */
    static CAND_SELECTED => 1

    /**
     * The reconversion operation has been canceled.
     * @type {Integer (Int32)}
     */
    static CAND_CANCELED => 2
}
