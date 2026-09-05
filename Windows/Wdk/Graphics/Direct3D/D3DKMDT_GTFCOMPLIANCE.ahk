#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_GTFCOMPLIANCE extends Win32Enum {

    /**
     * Native name: D3DKMDT_GTF_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static GTF_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_GTF_COMPLIANT
     * @type {Integer (Int32)}
     */
    static GTF_COMPLIANT => 1

    /**
     * Native name: D3DKMDT_GTF_NOTCOMPLIANT
     * @type {Integer (Int32)}
     */
    static GTF_NOTCOMPLIANT => 2
}
