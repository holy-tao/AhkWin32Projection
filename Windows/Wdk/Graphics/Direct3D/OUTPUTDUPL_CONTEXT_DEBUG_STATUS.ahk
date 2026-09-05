#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class OUTPUTDUPL_CONTEXT_DEBUG_STATUS extends Win32Enum {

    /**
     * Native name: OUTPUTDUPL_CONTEXT_DEBUG_STATUS_INACTIVE
     * @type {Integer (Int32)}
     */
    static INACTIVE => 0

    /**
     * Native name: OUTPUTDUPL_CONTEXT_DEBUG_STATUS_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 1

    /**
     * Native name: OUTPUTDUPL_CONTEXT_DEBUG_STATUS_PENDING_DESTROY
     * @type {Integer (Int32)}
     */
    static PENDING_DESTROY => 2
}
