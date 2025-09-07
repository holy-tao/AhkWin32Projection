#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The FILEPATHS_SINGNERINFO structure stores source and target path information, and also file signature information. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The setupapi.h header defines FILEPATHS_SIGNERINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-filepaths_signerinfo_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class FILEPATHS_SIGNERINFO_A extends Win32Struct
{
    static sizeof => 48

    static packingSize => 1

    /**
     * Path to the target file.
     * @type {PSTR}
     */
    Target{
        get {
            if(!this.HasProp("__Target"))
                this.__Target := PSTR(this.ptr + 0)
            return this.__Target
        }
    }

    /**
     * Path to the source file. This member is not used when the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-filepaths_a">FILEPATHS</a> structure is used with a file delete operation.
     * @type {PSTR}
     */
    Source{
        get {
            if(!this.HasProp("__Source"))
                this.__Source := PSTR(this.ptr + 8)
            return this.__Source
        }
    }

    /**
     * If an error occurs, this member is the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If no error has occurred, it is  NO_ERROR.
     * @type {Integer}
     */
    Win32Error {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Additional information that depends on the notification sent with the 
     * <b>FILEPATHS_SIGNERINFO</b> structure. 
     * 
     * 
     * 
     * 
     * For
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Digital signer of the file.
     * @type {PSTR}
     */
    DigitalSigner{
        get {
            if(!this.HasProp("__DigitalSigner"))
                this.__DigitalSigner := PSTR(this.ptr + 24)
            return this.__DigitalSigner
        }
    }

    /**
     * Version of the file.
     * @type {PSTR}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := PSTR(this.ptr + 32)
            return this.__Version
        }
    }

    /**
     * Catalog file.
     * @type {PSTR}
     */
    CatalogFile{
        get {
            if(!this.HasProp("__CatalogFile"))
                this.__CatalogFile := PSTR(this.ptr + 40)
            return this.__CatalogFile
        }
    }
}
