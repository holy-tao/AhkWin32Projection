#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the style of the text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationstyleid
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationStyleId extends Win32Enum{

    /**
     * Text styled as Heading 1.
     * @type {Integer (Int32)}
     */
    static Heading1 => 70001

    /**
     * Text styled as Heading 2.
     * @type {Integer (Int32)}
     */
    static Heading2 => 70002

    /**
     * Text styled as Heading 3.
     * @type {Integer (Int32)}
     */
    static Heading3 => 70003

    /**
     * Text styled as Heading 4.
     * @type {Integer (Int32)}
     */
    static Heading4 => 70004

    /**
     * Text styled as Heading 5.
     * @type {Integer (Int32)}
     */
    static Heading5 => 70005

    /**
     * Text styled as Heading 6.
     * @type {Integer (Int32)}
     */
    static Heading6 => 70006

    /**
     * Text styled as Heading 7.
     * @type {Integer (Int32)}
     */
    static Heading7 => 70007

    /**
     * Text styled as Heading 8.
     * @type {Integer (Int32)}
     */
    static Heading8 => 70008

    /**
     * Text styled as Heading 9.
     * @type {Integer (Int32)}
     */
    static Heading9 => 70009

    /**
     * Text styled as Title.
     * @type {Integer (Int32)}
     */
    static Title => 70010

    /**
     * Text styled as Subtitle.
     * @type {Integer (Int32)}
     */
    static Subtitle => 70011

    /**
     * Text styled as Normal.
     * @type {Integer (Int32)}
     */
    static Normal => 70012

    /**
     * Text styled as Emphasis.
     * @type {Integer (Int32)}
     */
    static Emphasis => 70013

    /**
     * Text styled as Quote.
     * @type {Integer (Int32)}
     */
    static Quote => 70014

    /**
     * Text styled as Bulleted List.
     * @type {Integer (Int32)}
     */
    static BulletedList => 70015
}
