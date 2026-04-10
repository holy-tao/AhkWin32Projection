#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_GTFCOMPLIANCE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GTF_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GTF_COMPLIANT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GTF_NOTCOMPLIANT => 2
}
