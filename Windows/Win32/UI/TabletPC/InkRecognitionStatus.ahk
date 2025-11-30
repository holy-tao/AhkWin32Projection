#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether an error occurred during recognition and, if so, which error occurred.
 * @remarks
 * 
 * The SetGuideFailed, SetFlagsFailed, SetFactoidFailed, and SetPrefixSuffixFailed members are redundant because an error is also raised when the corresponding properties are set.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkrecognitionstatus
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecognitionStatus extends Win32Enum{

    /**
     * Specifies no error.
     * @type {Integer (Int32)}
     */
    static IRS_NoError => 0

    /**
     * The recognition was interrupted by a call to <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-stopbackgroundrecognition">StopBackgroundRecognition</a>.
     * @type {Integer (Int32)}
     */
    static IRS_Interrupted => 1

    /**
     * The ink recognition process failed.
     * @type {Integer (Int32)}
     */
    static IRS_ProcessFailed => 2

    /**
     * The ink could not be added.
     * @type {Integer (Int32)}
     */
    static IRS_InkAddedFailed => 4

    /**
     * The <i>character Autocomplete</i> mode could not be set.
     * @type {Integer (Int32)}
     */
    static IRS_SetAutoCompletionModeFailed => 8

    /**
     * The strokes could not be set.
     * @type {Integer (Int32)}
     */
    static IRS_SetStrokesFailed => 16

    /**
     * The recognition guide could not be set.
     * @type {Integer (Int32)}
     */
    static IRS_SetGuideFailed => 32

    /**
     * The flags could not be set.
     * @type {Integer (Int32)}
     */
    static IRS_SetFlagsFailed => 64

    /**
     * The factoid could not be set.
     * @type {Integer (Int32)}
     */
    static IRS_SetFactoidFailed => 128

    /**
     * The suffix or the prefix could not be set.
     * @type {Integer (Int32)}
     */
    static IRS_SetPrefixSuffixFailed => 256

    /**
     * The word list could not be set.
     * @type {Integer (Int32)}
     */
    static IRS_SetWordListFailed => 512
}
