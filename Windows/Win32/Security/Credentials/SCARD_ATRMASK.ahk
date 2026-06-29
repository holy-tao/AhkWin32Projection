#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by the SCardLocateCardsByATR function to locate cards.
 * @see https://learn.microsoft.com/windows/win32/api/winscard/ns-winscard-scard_atrmask
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SCARD_ATRMASK {
    #StructPack 4

    /**
     * The number of bytes in the ATR and the mask.
     */
    cbAtr : UInt32

    /**
     * An array of <b>BYTE</b> values for the ATR of the card with extra alignment bytes.
     */
    rgbAtr : Int8[36]

    /**
     * An array of <b>BYTE</b> values for the mask for the ATR with extra alignment bytes.
     */
    rgbMask : Int8[36]

}
