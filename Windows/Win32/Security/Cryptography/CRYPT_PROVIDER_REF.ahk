#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a cryptographic interface that a provider supports.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_provider_ref
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_REF extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The identifier of the interface that this reference applies to. This will be one of the <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-interface-identifiers">CNG Interface Identifiers</a>.
     * @type {Integer}
     */
    dwInterface {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated Unicode string that identifies the algorithm or function that the reference applies to. This can be one of the standard <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> or the identifier for another registered algorithm.
     * @type {PWSTR}
     */
    pszFunction{
        get {
            if(!this.HasProp("__pszFunction"))
                this.__pszFunction := PWSTR(this.ptr + 8)
            return this.__pszFunction
        }
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider.
     * @type {PWSTR}
     */
    pszProvider{
        get {
            if(!this.HasProp("__pszProvider"))
                this.__pszProvider := PWSTR(this.ptr + 16)
            return this.__pszProvider
        }
    }

    /**
     * The number of elements in the <b>rgpProperties</b> array. If the algorithm or function has no properties, then this member will be zero.
     * @type {Integer}
     */
    cProperties {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_property_ref">CRYPT_PROPERTY_REF</a> structure pointers that contain the properties for this algorithm or function. The <b>cProperties</b> member contains the number of elements in this array.
     * @type {Pointer<CRYPT_PROPERTY_REF>}
     */
    rgpProperties {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_image_ref">CRYPT_IMAGE_REF</a> structure that contains information about the user mode provider module. If this information was not requested or the provider is not registered as a user mode provider, this member will be <b>NULL</b>.
     * @type {Pointer<CRYPT_IMAGE_REF>}
     */
    pUM {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_image_ref">CRYPT_IMAGE_REF</a> structure that contains information about the kernel mode provider module. If this information was not requested or the provider is not registered as a kernel mode provider, this member will be <b>NULL</b>.
     * @type {Pointer<CRYPT_IMAGE_REF>}
     */
    pKM {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
