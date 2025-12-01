#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store multiple credential pairs. (IKEEXT_CREDENTIALS1)
 * @remarks
 * IKE and IKEv2 have only 1 pair.
 * 
 * AuthIP
 * has 1 pair, or 2 pairs if EM was enabled.
 * 
 * MM authentication is always index 0.
 * 
 * EM authentication, if it occurs,
 * is index 1.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_credentials1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CREDENTIALS1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of [IKEEXT_CREDENTIAL_PAIR1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential_pair1) structures in the array.
     * @type {Integer}
     */
    numCredentials {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * [size_is(numCredentials)]
     * 
     * Pointer to an array of [IKEEXT_CREDENTIAL_PAIR1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential_pair1) structures.
     * @type {Pointer<IKEEXT_CREDENTIAL_PAIR1>}
     */
    credentials {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
