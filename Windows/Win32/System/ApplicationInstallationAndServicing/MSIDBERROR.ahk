#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIDBERROR extends Win32Enum {

    /**
     * Native name: MSIDBERROR_INVALIDARG
     * @type {Integer (Int32)}
     */
    static INVALIDARG => -3

    /**
     * Native name: MSIDBERROR_MOREDATA
     * @type {Integer (Int32)}
     */
    static MOREDATA => -2

    /**
     * Native name: MSIDBERROR_FUNCTIONERROR
     * @type {Integer (Int32)}
     */
    static FUNCTIONERROR => -1

    /**
     * Native name: MSIDBERROR_NOERROR
     * @type {Integer (Int32)}
     */
    static NOERROR => 0

    /**
     * Native name: MSIDBERROR_DUPLICATEKEY
     * @type {Integer (Int32)}
     */
    static DUPLICATEKEY => 1

    /**
     * Native name: MSIDBERROR_REQUIRED
     * @type {Integer (Int32)}
     */
    static REQUIRED => 2

    /**
     * Native name: MSIDBERROR_BADLINK
     * @type {Integer (Int32)}
     */
    static BADLINK => 3

    /**
     * Native name: MSIDBERROR_OVERFLOW
     * @type {Integer (Int32)}
     */
    static OVERFLOW => 4

    /**
     * Native name: MSIDBERROR_UNDERFLOW
     * @type {Integer (Int32)}
     */
    static UNDERFLOW => 5

    /**
     * Native name: MSIDBERROR_NOTINSET
     * @type {Integer (Int32)}
     */
    static NOTINSET => 6

    /**
     * Native name: MSIDBERROR_BADVERSION
     * @type {Integer (Int32)}
     */
    static BADVERSION => 7

    /**
     * Native name: MSIDBERROR_BADCASE
     * @type {Integer (Int32)}
     */
    static BADCASE => 8

    /**
     * Native name: MSIDBERROR_BADGUID
     * @type {Integer (Int32)}
     */
    static BADGUID => 9

    /**
     * Native name: MSIDBERROR_BADWILDCARD
     * @type {Integer (Int32)}
     */
    static BADWILDCARD => 10

    /**
     * Native name: MSIDBERROR_BADIDENTIFIER
     * @type {Integer (Int32)}
     */
    static BADIDENTIFIER => 11

    /**
     * Native name: MSIDBERROR_BADLANGUAGE
     * @type {Integer (Int32)}
     */
    static BADLANGUAGE => 12

    /**
     * Native name: MSIDBERROR_BADFILENAME
     * @type {Integer (Int32)}
     */
    static BADFILENAME => 13

    /**
     * Native name: MSIDBERROR_BADPATH
     * @type {Integer (Int32)}
     */
    static BADPATH => 14

    /**
     * Native name: MSIDBERROR_BADCONDITION
     * @type {Integer (Int32)}
     */
    static BADCONDITION => 15

    /**
     * Native name: MSIDBERROR_BADFORMATTED
     * @type {Integer (Int32)}
     */
    static BADFORMATTED => 16

    /**
     * Native name: MSIDBERROR_BADTEMPLATE
     * @type {Integer (Int32)}
     */
    static BADTEMPLATE => 17

    /**
     * Native name: MSIDBERROR_BADDEFAULTDIR
     * @type {Integer (Int32)}
     */
    static BADDEFAULTDIR => 18

    /**
     * Native name: MSIDBERROR_BADREGPATH
     * @type {Integer (Int32)}
     */
    static BADREGPATH => 19

    /**
     * Native name: MSIDBERROR_BADCUSTOMSOURCE
     * @type {Integer (Int32)}
     */
    static BADCUSTOMSOURCE => 20

    /**
     * Native name: MSIDBERROR_BADPROPERTY
     * @type {Integer (Int32)}
     */
    static BADPROPERTY => 21

    /**
     * Native name: MSIDBERROR_MISSINGDATA
     * @type {Integer (Int32)}
     */
    static MISSINGDATA => 22

    /**
     * Native name: MSIDBERROR_BADCATEGORY
     * @type {Integer (Int32)}
     */
    static BADCATEGORY => 23

    /**
     * Native name: MSIDBERROR_BADKEYTABLE
     * @type {Integer (Int32)}
     */
    static BADKEYTABLE => 24

    /**
     * Native name: MSIDBERROR_BADMAXMINVALUES
     * @type {Integer (Int32)}
     */
    static BADMAXMINVALUES => 25

    /**
     * Native name: MSIDBERROR_BADCABINET
     * @type {Integer (Int32)}
     */
    static BADCABINET => 26

    /**
     * Native name: MSIDBERROR_BADSHORTCUT
     * @type {Integer (Int32)}
     */
    static BADSHORTCUT => 27

    /**
     * Native name: MSIDBERROR_STRINGOVERFLOW
     * @type {Integer (Int32)}
     */
    static STRINGOVERFLOW => 28

    /**
     * Native name: MSIDBERROR_BADLOCALIZEATTRIB
     * @type {Integer (Int32)}
     */
    static BADLOCALIZEATTRIB => 29
}
