#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the sides of a DVD disc.
 * @remarks
 * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdvolumeinfo">IDvdInfo2::GetDVDVolumeInfo</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_disc_side
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_DISC_SIDE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
