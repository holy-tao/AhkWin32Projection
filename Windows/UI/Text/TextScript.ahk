#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the character repertoire for a run of character formatting.
 * @remarks
 * Character repertoires are typically scripts like Arabic and Latin, but there are also character repertoires for symbols and Emoji.
 * 
 * To learn more about character repertoires, see [RichEdit Font Binding](/windows/win32/controls/use-font-binding-in-rich-edit-controls).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textscript
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class TextScript extends Win32Enum{

    /**
     * Undefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Latin 1 (ANSI)
     * @type {Integer (Int32)}
     */
    static Ansi => 1

    /**
     * Latin 1 and Latin 2
     * @type {Integer (Int32)}
     */
    static EastEurope => 2

    /**
     * Cyrillic
     * @type {Integer (Int32)}
     */
    static Cyrillic => 3

    /**
     * Greek
     * @type {Integer (Int32)}
     */
    static Greek => 4

    /**
     * Turkish (Latin 1 + dotless i, and so on)
     * @type {Integer (Int32)}
     */
    static Turkish => 5

    /**
     * Hebrew
     * @type {Integer (Int32)}
     */
    static Hebrew => 6

    /**
     * Arabic
     * @type {Integer (Int32)}
     */
    static Arabic => 7

    /**
     * From Latin 1 and 2
     * @type {Integer (Int32)}
     */
    static Baltic => 8

    /**
     * Latin 1 with some combining marks
     * @type {Integer (Int32)}
     */
    static Vietnamese => 9

    /**
     * Default character repertoire
     * @type {Integer (Int32)}
     */
    static Default => 10

    /**
     * Symbol character set (not Unicode)
     * @type {Integer (Int32)}
     */
    static Symbol => 11

    /**
     * Thai
     * @type {Integer (Int32)}
     */
    static Thai => 12

    /**
     * Japanese
     * @type {Integer (Int32)}
     */
    static ShiftJis => 13

    /**
     * Simplified Chinese
     * @type {Integer (Int32)}
     */
    static GB2312 => 14

    /**
     * Hangul
     * @type {Integer (Int32)}
     */
    static Hangul => 15

    /**
     * Traditional Chinese
     * @type {Integer (Int32)}
     */
    static Big5 => 16

    /**
     * PC437 character set (disk operating system (DOS))
     * @type {Integer (Int32)}
     */
    static PC437 => 17

    /**
     * OEM character set (original PC)
     * @type {Integer (Int32)}
     */
    static Oem => 18

    /**
     * Main Macintosh character repertoire
     * @type {Integer (Int32)}
     */
    static Mac => 19

    /**
     * Armenian
     * @type {Integer (Int32)}
     */
    static Armenian => 20

    /**
     * Syriac
     * @type {Integer (Int32)}
     */
    static Syriac => 21

    /**
     * Thaana
     * @type {Integer (Int32)}
     */
    static Thaana => 22

    /**
     * Devanagari
     * @type {Integer (Int32)}
     */
    static Devanagari => 23

    /**
     * Bangla
     * @type {Integer (Int32)}
     */
    static Bengali => 24

    /**
     * Gurmukhi
     * @type {Integer (Int32)}
     */
    static Gurmukhi => 25

    /**
     * Gujarati
     * @type {Integer (Int32)}
     */
    static Gujarati => 26

    /**
     * Odia
     * @type {Integer (Int32)}
     */
    static Oriya => 27

    /**
     * Tamil
     * @type {Integer (Int32)}
     */
    static Tamil => 28

    /**
     * Telugu
     * @type {Integer (Int32)}
     */
    static Telugu => 29

    /**
     * Kannada
     * @type {Integer (Int32)}
     */
    static Kannada => 30

    /**
     * Malayalam
     * @type {Integer (Int32)}
     */
    static Malayalam => 31

    /**
     * Sinhala
     * @type {Integer (Int32)}
     */
    static Sinhala => 32

    /**
     * Lao
     * @type {Integer (Int32)}
     */
    static Lao => 33

    /**
     * Tibetan
     * @type {Integer (Int32)}
     */
    static Tibetan => 34

    /**
     * Myanmar
     * @type {Integer (Int32)}
     */
    static Myanmar => 35

    /**
     * Georgian
     * @type {Integer (Int32)}
     */
    static Georgian => 36

    /**
     * Jamo
     * @type {Integer (Int32)}
     */
    static Jamo => 37

    /**
     * Ethiopic
     * @type {Integer (Int32)}
     */
    static Ethiopic => 38

    /**
     * Cherokee
     * @type {Integer (Int32)}
     */
    static Cherokee => 39

    /**
     * Aboriginal
     * @type {Integer (Int32)}
     */
    static Aboriginal => 40

    /**
     * Ogham
     * @type {Integer (Int32)}
     */
    static Ogham => 41

    /**
     * Runic
     * @type {Integer (Int32)}
     */
    static Runic => 42

    /**
     * Khmer
     * @type {Integer (Int32)}
     */
    static Khmer => 43

    /**
     * Mongolian
     * @type {Integer (Int32)}
     */
    static Mongolian => 44

    /**
     * Braille
     * @type {Integer (Int32)}
     */
    static Braille => 45

    /**
     * Yi (Nuosu or Nosu, also known as Northern Yi, Liangshan Yi, and Sichuan Yi)
     * @type {Integer (Int32)}
     */
    static Yi => 46

    /**
     * Limbu
     * @type {Integer (Int32)}
     */
    static Limbu => 47

    /**
     * TaiLe
     * @type {Integer (Int32)}
     */
    static TaiLe => 48

    /**
     * TaiLu
     * @type {Integer (Int32)}
     */
    static NewTaiLue => 49

    /**
     * Syloti Nagri
     * @type {Integer (Int32)}
     */
    static SylotiNagri => 50

    /**
     * Kharoshthi
     * @type {Integer (Int32)}
     */
    static Kharoshthi => 51

    /**
     * Kayahli
     * @type {Integer (Int32)}
     */
    static Kayahli => 52

    /**
     * Unicode symbol such as math operators
     * @type {Integer (Int32)}
     */
    static UnicodeSymbol => 53

    /**
     * Emoji
     * @type {Integer (Int32)}
     */
    static Emoji => 54

    /**
     * Glagolitic
     * @type {Integer (Int32)}
     */
    static Glagolitic => 55

    /**
     * Lisu
     * @type {Integer (Int32)}
     */
    static Lisu => 56

    /**
     * Vai
     * @type {Integer (Int32)}
     */
    static Vai => 57

    /**
     * NKo
     * @type {Integer (Int32)}
     */
    static NKo => 58

    /**
     * Osmanya
     * @type {Integer (Int32)}
     */
    static Osmanya => 59

    /**
     * PhagsPa
     * @type {Integer (Int32)}
     */
    static PhagsPa => 60

    /**
     * Gothic
     * @type {Integer (Int32)}
     */
    static Gothic => 61

    /**
     * Deseret
     * @type {Integer (Int32)}
     */
    static Deseret => 62

    /**
     * Tifinagh
     * @type {Integer (Int32)}
     */
    static Tifinagh => 63
}
