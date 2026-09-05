#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_STANDARDALLOCATIONTYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_STANDARDALLOCATIONTYPE_EXISTINGHEAP
     * @type {Integer (Int32)}
     */
    static EXISTINGHEAP => 1

    /**
     * Native name: D3DKMT_STANDARDALLOCATIONTYPE_INTERNALBACKINGSTORE
     * @type {Integer (Int32)}
     */
    static INTERNALBACKINGSTORE => 2

    /**
     * Native name: D3DKMT_STANDARDALLOCATIONTYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
