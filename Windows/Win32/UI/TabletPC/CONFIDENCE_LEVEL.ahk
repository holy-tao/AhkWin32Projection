#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the level of confidence the recognizer has in the recognition result.
 * @see https://docs.microsoft.com/windows/win32/api//rectypes/ne-rectypes-confidence_level
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class CONFIDENCE_LEVEL extends Win32Enum{

    /**
     * The recognizer is confident that the best alternate is correct.
     * @type {Integer (Int32)}
     */
    static CFL_STRONG => 0

    /**
     * The recognizer is confident that the correct result is in the list of alternates.
     * @type {Integer (Int32)}
     */
    static CFL_INTERMEDIATE => 1

    /**
     * The recognizer is not confident that the result is in the list of alternates.
     * @type {Integer (Int32)}
     */
    static CFL_POOR => 2
}
