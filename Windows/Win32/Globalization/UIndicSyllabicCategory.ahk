#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UIndicSyllabicCategory {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_AVAGRAHA => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_BINDU => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_BRAHMI_JOINING_NUMBER => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CANTILLATION_MARK => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT => 5

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_DEAD => 6

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_FINAL => 7

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_HEAD_LETTER => 8

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_INITIAL_POSTFIXED => 9

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_KILLER => 10

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_MEDIAL => 11

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_PLACEHOLDER => 12

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_PRECEDING_REPHA => 13

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_PREFIXED => 14

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_SUBJOINED => 15

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_SUCCEEDING_REPHA => 16

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_CONSONANT_WITH_STACKER => 17

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_GEMINATION_MARK => 18

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_INVISIBLE_STACKER => 19

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_JOINER => 20

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_MODIFYING_LETTER => 21

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_NON_JOINER => 22

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_NUKTA => 23

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_NUMBER => 24

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_NUMBER_JOINER => 25

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_PURE_KILLER => 26

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_REGISTER_SHIFTER => 27

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_SYLLABLE_MODIFIER => 28

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_TONE_LETTER => 29

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_TONE_MARK => 30

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_VIRAMA => 31

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_VISARGA => 32

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_VOWEL => 33

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_VOWEL_DEPENDENT => 34

    /**
     * @type {Integer (Int32)}
     */
    static U_INSC_VOWEL_INDEPENDENT => 35
}
