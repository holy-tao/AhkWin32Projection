#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the recognizer interprets the ink and determines the result string.
 * @remarks
 * 
 * In C++, explicit casting is required when trying to set more than one flag at a time using the bitwise <b>OR</b> operator. A compilation error occurs if explicit casting is not used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkrecognitionmodes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecognitionModes{

    /**
     * The recognizer applies no recognition modes.
     * @type {Integer (Int32)}
     */
    static IRM_None => 0

    /**
     * The recognizer treats the ink as a single word.
     * 
     * For example, if the recognizer context contains to get her, the recognizer returns together.
     * 
     * <div class="alert"><b>Note</b>  Some compound words in the dictionary are treated as single words by recognizers of Latin script. For example, recognizers of Latin script treat "Los Angeles" as a single word if you use the WordMode flag. In addition, certain factoids-such as the Date <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Factoid</a> in English (United Kingdom), English (United States), German, and French-treat some multiple word dates as single words. For example, these recognizers treat "January 21, 2000" as a single word if you use the WordMode flag.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IRM_WordModeOnly => 1

    /**
     * The recognizer coerces the result based on the factoid that you specified for the context.
     * 
     * For example, if you specified the Telephone factoid and the user enters the word hello, the recognizer may return a random phone number or an empty string. If you do not specify this flag, the recognizer returns hello as the result.
     * @type {Integer (Int32)}
     */
    static IRM_Coerce => 2

    /**
     * The recognizer disables multiple segmentation.
     * 
     * This turns off the recognizer's ability to return recognition results based on more than one recognition segment of the ink, where each segment corresponds to a word (in recognizers of Latin script) or a character (in recognizers of East Asian characters).
     * 
     * In other words, the word together always returns alternates based on together being a single word, and the recognizer does not consider that the string might also be "to get her" or some other variation with differing segmentation.
     * 
     * Turning on this flag enhances recognition speed.
     * @type {Integer (Int32)}
     */
    static IRM_TopInkBreaksOnly => 4

    /**
     * The recognizer applies partial word recognition.
     * @type {Integer (Int32)}
     */
    static IRM_PrefixOk => 8

    /**
     * The recognizer does not emply line breaking inside the recognizer and all of the ink is recognized as one line.
     * @type {Integer (Int32)}
     */
    static IRM_LineMode => 16

    /**
     * The recognizer disables personalization on the recognizer.
     * @type {Integer (Int32)}
     */
    static IRM_DisablePersonalization => 32

    /**
     * The recognizer should automatically determine word breaks between newly written (and recognized) text and the suffix and prefix.
     * 
     * For example, when AutoSpace is enabled and the user inserts bye after the recognized word, good, the recognizer returns bye with no space inserted before it as the recognized text because the compound "goodbye" is a valid word.
     * 
     * If the user inserts world after the recognized word, hello, the recognizer returns world with a space inserted before it as the recognized text to produce the words, hello world. If AutoSpace is disabled, the recognizer returns world with no space.
     * 
     * This flag is used only by recognizers of Latin script.
     * @type {Integer (Int32)}
     */
    static IRM_AutoSpace => 64

    /**
     * For internal use only.
     * @type {Integer (Int32)}
     */
    static IRM_Max => 128
}
