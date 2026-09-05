#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Xps
 */
class PSINJECT_POINT extends Win32BitflagEnum {

    /**
     * Native name: PSINJECT_BEGINSTREAM
     * @type {Integer (UInt16)}
     */
    static BEGINSTREAM => 1

    /**
     * Native name: PSINJECT_PSADOBE
     * @type {Integer (UInt16)}
     */
    static PSADOBE => 2

    /**
     * Native name: PSINJECT_PAGESATEND
     * @type {Integer (UInt16)}
     */
    static PAGESATEND => 3

    /**
     * Native name: PSINJECT_PAGES
     * @type {Integer (UInt16)}
     */
    static PAGES => 4

    /**
     * Native name: PSINJECT_DOCNEEDEDRES
     * @type {Integer (UInt16)}
     */
    static DOCNEEDEDRES => 5

    /**
     * Native name: PSINJECT_DOCSUPPLIEDRES
     * @type {Integer (UInt16)}
     */
    static DOCSUPPLIEDRES => 6

    /**
     * Native name: PSINJECT_PAGEORDER
     * @type {Integer (UInt16)}
     */
    static PAGEORDER => 7

    /**
     * Native name: PSINJECT_ORIENTATION
     * @type {Integer (UInt16)}
     */
    static ORIENTATION => 8

    /**
     * Native name: PSINJECT_BOUNDINGBOX
     * @type {Integer (UInt16)}
     */
    static BOUNDINGBOX => 9

    /**
     * Native name: PSINJECT_DOCUMENTPROCESSCOLORS
     * @type {Integer (UInt16)}
     */
    static DOCUMENTPROCESSCOLORS => 10

    /**
     * Native name: PSINJECT_COMMENTS
     * @type {Integer (UInt16)}
     */
    static COMMENTS => 11

    /**
     * Native name: PSINJECT_BEGINDEFAULTS
     * @type {Integer (UInt16)}
     */
    static BEGINDEFAULTS => 12

    /**
     * Native name: PSINJECT_ENDDEFAULTS
     * @type {Integer (UInt16)}
     */
    static ENDDEFAULTS => 13

    /**
     * Native name: PSINJECT_BEGINPROLOG
     * @type {Integer (UInt16)}
     */
    static BEGINPROLOG => 14

    /**
     * Native name: PSINJECT_ENDPROLOG
     * @type {Integer (UInt16)}
     */
    static ENDPROLOG => 15

    /**
     * Native name: PSINJECT_BEGINSETUP
     * @type {Integer (UInt16)}
     */
    static BEGINSETUP => 16

    /**
     * Native name: PSINJECT_ENDSETUP
     * @type {Integer (UInt16)}
     */
    static ENDSETUP => 17

    /**
     * Native name: PSINJECT_TRAILER
     * @type {Integer (UInt16)}
     */
    static TRAILER => 18

    /**
     * Native name: PSINJECT_EOF
     * @type {Integer (UInt16)}
     */
    static EOF => 19

    /**
     * Native name: PSINJECT_ENDSTREAM
     * @type {Integer (UInt16)}
     */
    static ENDSTREAM => 20

    /**
     * Native name: PSINJECT_DOCUMENTPROCESSCOLORSATEND
     * @type {Integer (UInt16)}
     */
    static DOCUMENTPROCESSCOLORSATEND => 21

    /**
     * Native name: PSINJECT_PAGENUMBER
     * @type {Integer (UInt16)}
     */
    static PAGENUMBER => 100

    /**
     * Native name: PSINJECT_BEGINPAGESETUP
     * @type {Integer (UInt16)}
     */
    static BEGINPAGESETUP => 101

    /**
     * Native name: PSINJECT_ENDPAGESETUP
     * @type {Integer (UInt16)}
     */
    static ENDPAGESETUP => 102

    /**
     * Native name: PSINJECT_PAGETRAILER
     * @type {Integer (UInt16)}
     */
    static PAGETRAILER => 103

    /**
     * Native name: PSINJECT_PLATECOLOR
     * @type {Integer (UInt16)}
     */
    static PLATECOLOR => 104

    /**
     * Native name: PSINJECT_SHOWPAGE
     * @type {Integer (UInt16)}
     */
    static SHOWPAGE => 105

    /**
     * Native name: PSINJECT_PAGEBBOX
     * @type {Integer (UInt16)}
     */
    static PAGEBBOX => 106

    /**
     * Native name: PSINJECT_ENDPAGECOMMENTS
     * @type {Integer (UInt16)}
     */
    static ENDPAGECOMMENTS => 107

    /**
     * Native name: PSINJECT_VMSAVE
     * @type {Integer (UInt16)}
     */
    static VMSAVE => 200

    /**
     * Native name: PSINJECT_VMRESTORE
     * @type {Integer (UInt16)}
     */
    static VMRESTORE => 201
}
