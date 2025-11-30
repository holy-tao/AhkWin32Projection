#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlInput extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputButton => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputCheckbox => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputFile => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputHidden => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputImage => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputPassword => 6

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputRadio => 7

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputReset => 8

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputSelectOne => 9

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputSelectMultiple => 10

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputSubmit => 11

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputText => 12

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputTextarea => 13

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputRichtext => 14

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputRange => 15

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputUrl => 16

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputEmail => 17

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputNumber => 18

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputTel => 19

    /**
     * @type {Integer (Int32)}
     */
    static htmlInputSearch => 20

    /**
     * @type {Integer (Int32)}
     */
    static htmlInput_Max => 2147483647
}
