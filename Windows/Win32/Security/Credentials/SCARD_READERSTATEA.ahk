#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCARD_STATE.ahk" { SCARD_STATE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used by functions for tracking smart cards within readers. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winscard.h header defines SCARD_READERSTATE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winscard/ns-winscard-scard_readerstatea
 * @namespace Windows.Win32.Security.Credentials
 * @charset ANSI
 */
export default struct SCARD_READERSTATEA {
    #StructPack 8

    /**
     * A pointer to the name of the reader being monitored.
     * 
     * Set the value of this member to "\\\\?PnP?\\Notification" and the values of all other members to zero to be notified of the arrival of a new smart card reader.
     */
    szReader : PSTR

    /**
     * Not used by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card subsystem</a>. This member is used by the application.
     */
    pvUserData : IntPtr

    dwCurrentState : SCARD_STATE

    dwEventState : SCARD_STATE

    /**
     * Number of bytes in the returned ATR.
     */
    cbAtr : UInt32

    /**
     * ATR of the inserted card, with extra alignment bytes.
     */
    rgbAtr : Int8[36]

}
