#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class MM_MDL_PAGE_CONTENTS_STATE extends Win32Enum {

    /**
     * Native name: MmMdlPageContentsDynamic
     * @type {Integer (Int32)}
     */
    static Dynamic => 0

    /**
     * Native name: MmMdlPageContentsInvariant
     * @type {Integer (Int32)}
     */
    static Invariant => 1

    /**
     * Native name: MmMdlPageContentsQuery
     * @type {Integer (Int32)}
     */
    static Query => 2
}
