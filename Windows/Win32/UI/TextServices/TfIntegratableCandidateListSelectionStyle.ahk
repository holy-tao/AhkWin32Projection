#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TfIntegratableCandidateListSelectionStyle enumeration specify the integratable candidate list selection styles.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/ne-ctffunc-tfintegratablecandidatelistselectionstyle
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfIntegratableCandidateListSelectionStyle extends Win32Enum{

    /**
     * The selection can be changed with the arrow keys.
     * @type {Integer (Int32)}
     */
    static STYLE_ACTIVE_SELECTION => 0

    /**
     * The default selection key will choose the selection.
     * @type {Integer (Int32)}
     */
    static STYLE_IMPLIED_SELECTION => 1
}
