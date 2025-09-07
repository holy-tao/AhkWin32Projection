#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the level of confidence that the recognizer has in the recognition result.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkrecognitionconfidence
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecognitionConfidence{

    /**
     * The recognizer is confident that the best recognition alternate is correct.
     * @type {Integer (Int32)}
     */
    static IRC_Strong => 0

    /**
     * The recognizer is confident that the correct result is in the list of alternates.
     * @type {Integer (Int32)}
     */
    static IRC_Intermediate => 1

    /**
     * The recognizer is not confident that the result is in the list of alternates.
     * @type {Integer (Int32)}
     */
    static IRC_Poor => 2
}
