#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags used with ReportLiveObjects to specify the amount of info to report about an object's lifetime.
 * @remarks
 * Use this enumeration with <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgidebug-reportliveobjects">IDXGIDebug::ReportLiveObjects</a>.
 *         
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.
 *       </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/ne-dxgidebug-dxgi_debug_rlo_flags
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_DEBUG_RLO_FLAGS extends Win32BitflagEnum {

    /**
     * A flag that specifies to obtain a summary about an object's lifetime.
     * Native name: DXGI_DEBUG_RLO_SUMMARY
     * @type {Integer (Int32)}
     */
    static SUMMARY => 1

    /**
     * A flag that specifies to obtain detailed info about an object's lifetime.
     * Native name: DXGI_DEBUG_RLO_DETAIL
     * @type {Integer (Int32)}
     */
    static DETAIL => 2

    /**
     * This flag indicates to ignore objects which have no external refcounts keeping them alive.
     *             D3D objects are printed using an external refcount and an internal refcount. 
     *             Typically, all objects are printed. 
     *             This flag means ignore the objects whose external refcount is 0, because the application is not responsible for keeping them alive.
     * Native name: DXGI_DEBUG_RLO_IGNORE_INTERNAL
     * @type {Integer (Int32)}
     */
    static IGNORE_INTERNAL => 4

    /**
     * A flag that specifies to obtain both a summary and detailed info about an object's lifetime.
     * Native name: DXGI_DEBUG_RLO_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 7
}
