#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the attributes of a recognizer. You also use this enumeration to determine which attributes to use when you search for an installed recognizer.
 * @remarks
 * 
 * This enumeration is a flag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkrecognizercapabilities
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecognizerCapabilities{

    /**
     * Ignores all other flags that are set.
     * @type {Integer (Int32)}
     */
    static IRC_DontCare => 1

    /**
     * The recognizer performs object recognition; otherwise, the recognizer performs text recognition.
     * @type {Integer (Int32)}
     */
    static IRC_Object => 2

    /**
     * The recognizer supports free input. Ink is entered without the use of a recognition guide, such as lines or boxes.
     * @type {Integer (Int32)}
     */
    static IRC_FreeInput => 4

    /**
     * The recognizer supports lined input, which is similar to writing on lined paper.
     * @type {Integer (Int32)}
     */
    static IRC_LinedInput => 8

    /**
     * The recognizer supports boxed input, in which each character or word is entered in a box.
     * @type {Integer (Int32)}
     */
    static IRC_BoxedInput => 16

    /**
     * The recognizer supports character Autocomplete. Recognizers that support character Autocomplete require boxed input.
     * @type {Integer (Int32)}
     */
    static IRC_CharacterAutoCompletionInput => 32

    /**
     * The recognizer supports western and Asian languages.
     * @type {Integer (Int32)}
     */
    static IRC_RightAndDown => 64

    /**
     * The recognizer supports Hebrew and Arabic languages.
     * @type {Integer (Int32)}
     */
    static IRC_LeftAndDown => 128

    /**
     * The recognizer supports Asian languages.
     * @type {Integer (Int32)}
     */
    static IRC_DownAndLeft => 256

    /**
     * The recognizer supports the Chinese language.
     * @type {Integer (Int32)}
     */
    static IRC_DownAndRight => 512

    /**
     * The recognizer supports text that is written at arbitrary angles.
     * @type {Integer (Int32)}
     */
    static IRC_ArbitraryAngle => 1024

    /**
     * The recognizer can return a lattice object.
     * @type {Integer (Int32)}
     */
    static IRC_Lattice => 2048

    /**
     * The recognizer's background recognition can be interrupted, as in when the ink has changed.
     * @type {Integer (Int32)}
     */
    static IRC_AdviseInkChange => 4096

    /**
     * Specifies that stroke order - spatial and temporal - is handled.
     * @type {Integer (Int32)}
     */
    static IRC_StrokeReorder => 8192

    /**
     * The recognizer supports personalization.
     * @type {Integer (Int32)}
     */
    static IRC_Personalizable => 16384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IRC_PrefersArbitraryAngle => 32768

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IRC_PrefersParagraphBreaking => 65536

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IRC_PrefersSegmentation => 131072

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IRC_Cursive => 262144

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IRC_TextPrediction => 524288

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IRC_Alpha => 1048576

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IRC_Beta => 2097152
}
