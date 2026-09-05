#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlInput extends Win32Enum {

    /**
     * Native name: htmlInputNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlInputButton
     * @type {Integer (Int32)}
     */
    static Button => 1

    /**
     * Native name: htmlInputCheckbox
     * @type {Integer (Int32)}
     */
    static Checkbox => 2

    /**
     * Native name: htmlInputFile
     * @type {Integer (Int32)}
     */
    static File => 3

    /**
     * Native name: htmlInputHidden
     * @type {Integer (Int32)}
     */
    static Hidden => 4

    /**
     * Native name: htmlInputImage
     * @type {Integer (Int32)}
     */
    static Image => 5

    /**
     * Native name: htmlInputPassword
     * @type {Integer (Int32)}
     */
    static Password => 6

    /**
     * Native name: htmlInputRadio
     * @type {Integer (Int32)}
     */
    static Radio => 7

    /**
     * Native name: htmlInputReset
     * @type {Integer (Int32)}
     */
    static Reset => 8

    /**
     * Native name: htmlInputSelectOne
     * @type {Integer (Int32)}
     */
    static SelectOne => 9

    /**
     * Native name: htmlInputSelectMultiple
     * @type {Integer (Int32)}
     */
    static SelectMultiple => 10

    /**
     * Native name: htmlInputSubmit
     * @type {Integer (Int32)}
     */
    static Submit => 11

    /**
     * Native name: htmlInputText
     * @type {Integer (Int32)}
     */
    static Text => 12

    /**
     * Native name: htmlInputTextarea
     * @type {Integer (Int32)}
     */
    static Textarea => 13

    /**
     * Native name: htmlInputRichtext
     * @type {Integer (Int32)}
     */
    static Richtext => 14

    /**
     * Native name: htmlInputRange
     * @type {Integer (Int32)}
     */
    static Range => 15

    /**
     * Native name: htmlInputUrl
     * @type {Integer (Int32)}
     */
    static Url => 16

    /**
     * Native name: htmlInputEmail
     * @type {Integer (Int32)}
     */
    static Email => 17

    /**
     * Native name: htmlInputNumber
     * @type {Integer (Int32)}
     */
    static Number => 18

    /**
     * Native name: htmlInputTel
     * @type {Integer (Int32)}
     */
    static Tel => 19

    /**
     * Native name: htmlInputSearch
     * @type {Integer (Int32)}
     */
    static Search => 20

    /**
     * Native name: htmlInput_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
