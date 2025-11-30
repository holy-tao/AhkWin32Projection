#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_PROCESS_VERIFIER_OPTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PROCESS_VERIFIER_OPTION_VIDMM_FLAGS => 1000

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PROCESS_VERIFIER_OPTION_VIDMM_RESTRICT_BUDGET => 1001
}
