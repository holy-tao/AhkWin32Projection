#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by functions for tracking smart cards within readers. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The winscard.h header defines SCARD_READERSTATE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winscard/ns-winscard-scard_readerstatea
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 * @charset ANSI
 */
class SCARD_READERSTATEA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A pointer to the name of the reader being monitored.
     * 
     * Set the value of this member to "\\\\?PnP?\\Notification" and the values of all other members to zero to be notified of the arrival of a new smart card reader.
     * @type {Pointer<Ptr>}
     */
    szReader {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Not used by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card subsystem</a>. This member is used by the application.
     * @type {Pointer<Void>}
     */
    pvUserData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCurrentState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwEventState {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of bytes in the returned ATR.
     * @type {Integer}
     */
    cbAtr {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * ATR of the inserted card, with extra alignment bytes.
     * @type {Array<Byte>}
     */
    rgbAtr{
        get {
            if(!this.HasProp("__rgbAtrProxyArray"))
                this.__rgbAtrProxyArray := Win32FixedArray(this.ptr + 28, 36, Primitive, "char")
            return this.__rgbAtrProxyArray
        }
    }
}
