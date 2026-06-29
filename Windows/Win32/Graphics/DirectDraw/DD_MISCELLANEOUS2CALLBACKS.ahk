#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_MISCELLANEOUS2CALLBACKS structure is used to return the addresses of miscellaneous callback routines.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_miscellaneous2callbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_MISCELLANEOUS2CALLBACKS {
    #StructPack 8

    /**
     * Specifies the size, in bytes, of this structure.
     */
    dwSize : UInt32

    /**
     * Indicates which miscellaneous callback functions the driver implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_MISC2CB32_CREATESURFACEEX</dt>
     * <dt>DDHAL_MISC2CB32_GETDRIVERSTATE</dt>
     * <dt>DDHAL_MISC2CB32_DESTROYDDLOCAL</dt>
     * </dl>
     */
    dwFlags : UInt32

    /**
     * Unused and must be set to <b>NULL</b>.
     */
    AlphaBlt : IntPtr

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurfaceex">D3dCreateSurfaceEx</a> implementation. This callback creates an association between a DirectDraw surface and a small integer handle.
     */
    CreateSurfaceEx : IntPtr

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverstate">D3dGetDriverState</a> implementation.
     */
    GetDriverState : IntPtr

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_destroyddlocal">D3dDestroyDDLocal</a> implementation. Used to destroy the local copy of the device context.
     */
    DestroyDDLocal : IntPtr

}
