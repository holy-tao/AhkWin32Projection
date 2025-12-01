#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifiers how to create alternates from a best result string.
 * @remarks
 * Check the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_attrs">dwRecoCapabilityFlags</a> member of the <b>RECO_ATTRS</b> structure to ensure the recognizer supports different alternate breaks.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ne-rectypes-alt_breaks
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ALT_BREAKS extends Win32Enum{

    /**
     * An alternate must use the same segment breaks as the best result string. For example, if you ask for an alternate list for the best result string of "together", the recognizer may return "Tunisia" but not "to get her". This is because "to get her" involves different segment breaks.
     * @type {Integer (Int32)}
     */
    static ALT_BREAKS_SAME => 0

    /**
     * An alternate must have different segment breaks than the best result string. Only one such alternate is returned. For example, alternates for the best result string of "to get her" may include "to gather" and "together". However, "to got her" is not returned because it has the same segment break as "to get her".
     * @type {Integer (Int32)}
     */
    static ALT_BREAKS_UNIQUE => 1

    /**
     * The top-rated alternates are returned regardless of segment breaks. Thus "together" may return "Tunisia", "to get her", and "to gather" among others. The alternates are returned in order of their rating, from best to worst.
     * @type {Integer (Int32)}
     */
    static ALT_BREAKS_FULL => 2
}
