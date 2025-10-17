#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * An element of a certificate trust list (CTL).
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ctl_entry
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> containing a unique identifier of a subject. It can be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> or any unique byte sequence.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SubjectIdentifier{
        get {
            if(!this.HasProp("__SubjectIdentifier"))
                this.__SubjectIdentifier := CRYPT_INTEGER_BLOB(0, this)
            return this.__SubjectIdentifier
        }
    }

    /**
     * Count of elements in the <b>rgAttribute</b> member array.
     * @type {Integer}
     */
    cAttribute {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each holding information about the subject.
     * @type {Pointer<CRYPT_ATTRIBUTE>}
     */
    rgAttribute {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
