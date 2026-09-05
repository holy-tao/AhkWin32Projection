#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_PROCESS_VERIFIER_OPTION_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_PROCESS_VERIFIER_OPTION_VIDMM_FLAGS
     * @type {Integer (Int32)}
     */
    static VIDMM_FLAGS => 1000

    /**
     * Native name: D3DKMT_PROCESS_VERIFIER_OPTION_VIDMM_RESTRICT_BUDGET
     * @type {Integer (Int32)}
     */
    static VIDMM_RESTRICT_BUDGET => 1001
}
