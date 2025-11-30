#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSIDBERROR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_INVALIDARG => -3

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_MOREDATA => -2

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_FUNCTIONERROR => -1

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_NOERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_DUPLICATEKEY => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_REQUIRED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADLINK => 3

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_OVERFLOW => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_UNDERFLOW => 5

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_NOTINSET => 6

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADVERSION => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADCASE => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADGUID => 9

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADWILDCARD => 10

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADIDENTIFIER => 11

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADLANGUAGE => 12

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADFILENAME => 13

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADPATH => 14

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADCONDITION => 15

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADFORMATTED => 16

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADTEMPLATE => 17

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADDEFAULTDIR => 18

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADREGPATH => 19

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADCUSTOMSOURCE => 20

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADPROPERTY => 21

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_MISSINGDATA => 22

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADCATEGORY => 23

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADKEYTABLE => 24

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADMAXMINVALUES => 25

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADCABINET => 26

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADSHORTCUT => 27

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_STRINGOVERFLOW => 28

    /**
     * @type {Integer (Int32)}
     */
    static MSIDBERROR_BADLOCALIZEATTRIB => 29
}
