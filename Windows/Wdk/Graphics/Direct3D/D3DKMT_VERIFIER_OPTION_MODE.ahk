#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_VERIFIER_OPTION_MODE extends Win32Enum {

    /**
     * Native name: D3DKMT_VERIFIER_OPTION_QUERY
     * @type {Integer (Int32)}
     */
    static QUERY => 0

    /**
     * Native name: D3DKMT_VERIFIER_OPTION_SET
     * @type {Integer (Int32)}
     */
    static SET => 1
}
