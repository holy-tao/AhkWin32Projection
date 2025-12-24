#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MM_MDL_PAGE_CONTENTS_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MmMdlPageContentsDynamic => 0

    /**
     * @type {Integer (Int32)}
     */
    static MmMdlPageContentsInvariant => 1

    /**
     * @type {Integer (Int32)}
     */
    static MmMdlPageContentsQuery => 2
}
