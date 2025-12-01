#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the sides of a DVD disc.
 * @remarks
 * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdvolumeinfo">IDvdInfo2::GetDVDVolumeInfo</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_disc_side
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_DISC_SIDE extends Win32Enum{

    /**
     * Side A.
     * @type {Integer (Int32)}
     */
    static DVD_SIDE_A => 1

    /**
     * Side B.
     * @type {Integer (Int32)}
     */
    static DVD_SIDE_B => 2
}
