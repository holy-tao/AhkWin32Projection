#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies effects on a DirectDraw hardware overlay surface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-amoverlayfx
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMOVERLAYFX extends Win32Enum{

    /**
     * Normal video (no effects).
     * @type {Integer (Int32)}
     */
    static AMOVERFX_NOFX => 0

    /**
     * Mirror the overlay across the vertical axis.
     * @type {Integer (Int32)}
     */
    static AMOVERFX_MIRRORLEFTRIGHT => 2

    /**
     * Mirror the overlay across the horizontal axis.
     * @type {Integer (Int32)}
     */
    static AMOVERFX_MIRRORUPDOWN => 4

    /**
     * When used in <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamoverlayfx-queryoverlayfxcaps">IAMOverlayFX::QueryOverlayFXCaps</a>, this flag specifies whether the hardware can support the DirectDraw 7 DDOVERFX_DEINTERLACE hint. When used with the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamoverlayfx-getoverlayfx">IAMOverlayFX::GetOverlayFX</a> or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamoverlayfx-setoverlayfx">IAMOverlayFX::SetOverlayFX</a> methods, this flag indicates that the overlay should be deinterlaced if possible.
     * @type {Integer (Int32)}
     */
    static AMOVERFX_DEINTERLACE => 8
}
