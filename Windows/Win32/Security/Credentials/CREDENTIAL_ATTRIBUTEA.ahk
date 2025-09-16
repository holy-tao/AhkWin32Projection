#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CREDENTIAL_ATTRIBUTE structure contains an application-defined attribute of the credential. An attribute is a keyword-value pair. It is up to the application to define the meaning of the attribute. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The wincred.h header defines CREDENTIAL_ATTRIBUTE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ns-wincred-credential_attributea
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 * @charset ANSI
 */
class CREDENTIAL_ATTRIBUTEA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Name of the application-specific attribute. Names should be of the form &lt;CompanyName&gt;_&lt;Name&gt;. 
     * 
     * 
     * 
     * 
     * This member cannot be longer than CRED_MAX_STRING_LENGTH (256) characters.
     * @type {Pointer<PSTR>}
     */
    Keyword {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Identifies characteristics of the credential attribute. This member is reserved and should be originally initialized as zero and not otherwise altered to permit future enhancement.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Length of <b>Value</b> in bytes. This member cannot be larger than CRED_MAX_VALUE_SIZE (256).
     * @type {Integer}
     */
    ValueSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Data associated with the attribute. By convention, if <b>Value</b> is a text string, then  <b>Value</b> should not include the trailing zero character and should be in UNICODE. 
     * 
     * 
     * 
     * 
     * Credentials are expected to be portable. The application should take care to ensure that the data in value is portable. It is the responsibility of the application to define the byte-endian and alignment of the data in <b>Value</b>.
     * @type {Pointer<Byte>}
     */
    Value {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
