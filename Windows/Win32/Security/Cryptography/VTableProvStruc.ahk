#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains pointers to callback functions that can be used by cryptographic service provider (CSP) functions.
 * @remarks
 * The pointers in the **VTableProvStruc** structure are only available within the [**CPAcquireContext**](https://www.bing.com/search?q=**CPAcquireContext**) function. If members of the structure are needed after a call to **CPAcquireContext** is completed, copies of the needed structure elements must be made by the CSP. The function pointers in this structure can be stored and used until the CSP context is released.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/vtableprovstruc
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 * @charset ANSI
 */
class VTableProvStruc extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A **DWORD** value that indicates the version of the structure. Three versions of this structure are used. The versions are number 1, 2, and 3, and determine which members of the structure are valid. Version 1 members are valid on all systems that support this structure.
     * 
     * This is a version 1 member.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The address of a [**FuncVerifyImage**](funcverifyimage.md) callback function that the CSP uses to verify the signature of any DLLs that the CSP will load. All auxiliary DLLs into which a CSP makes function calls must be signed in the same manner (and with the same key) as the primary CSP DLL. To ensure this signature, the auxiliary DLLs must be loaded dynamically by using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) function. But before the DLL is loaded, the signature of the DLL must be verified. The CSP performs this verification by calling the **FuncVerifyImage** function, as shown in the example below.
     * 
     * This function pointer can be stored and used until the CSP context is released.
     * 
     * This is a version 1 member.
     * @type {Pointer<CRYPT_VERIFY_IMAGE_A>}
     */
    FuncVerifyImage {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The address of a [**FuncReturnhWnd**](funcreturnhwnd.md) callback function that returns the window handle that the CSP should use as the parent or owner of any user interface that is displayed. CSPs that do not communicate directly with the user and CSPs that use dedicated hardware for this purpose can ignore this entry. This window handle is zero by default, but an application can set this to a different value by using the [**CryptSetProvParam**](/windows/desktop/api/Wincrypt/nf-wincrypt-cryptsetprovparam) function to set the **PP\_CLIENT\_HWND** property.
     * 
     * This function pointer can be stored and used until the CSP context is released.
     * 
     * This is a version 1 member.
     * @type {Pointer<CRYPT_RETURN_HWND>}
     */
    FuncReturnhWnd {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A **DWORD** value that specifies the type of provider to acquire. The following [*provider types*](../secgloss/p-gly.md) are predefined and are discussed in detail in [CSP Interoperability](https://www.bing.com/search?q=CSP+Interoperability):
     * 
     * -   PROV\_RSA\_FULL
     * -   PROV\_RSA\_SIG
     * -   PROV\_DSS
     * -   PROV\_FORTEZZA
     * -   PROV\_MS\_EXCHANGE
     * 
     * This is a version 2 member.
     * @type {Integer}
     */
    dwProvType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to an array of context information. The **pbContextInfo** and **cbContextInfo** members together determine the information set used when a [**CPSetProvParam**](https://www.bing.com/search?q=**CPSetProvParam**) function is called with PP\_CONTEXT\_INFO set.
     * 
     * This is a version 2 member.
     * @type {Pointer<Byte>}
     */
    pbContextInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A **DWORD** value that indicates the number of elements in the **pbContextInfo** array.
     * 
     * This is a version 2 member.
     * @type {Integer}
     */
    cbContextInfo {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A string that contains the name of the provider.
     * 
     * This is a version 3 member.
     * @type {Pointer<PSTR>}
     */
    pszProvName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
