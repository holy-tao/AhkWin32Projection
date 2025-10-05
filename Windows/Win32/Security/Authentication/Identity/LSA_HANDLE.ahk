#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Handle to the local Policy object.
 * @remarks
 * Before you can use the local policy API your application must open a handle to a [**Policy**](policy-object.md) object. To do this, call [**LsaOpenPolicy**](/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaopenpolicy). This function returns a handle that your application can then specify in subsequent LSA policy function calls.
  * 
  * Each handle has an associated set of permissions that determine the operations your application can perform on the [**Policy**](policy-object.md) object by using the handle. Your application can open more than one handle to the **Policy** object at a time. When a handle is no longer required, your application should close it by calling [**LsaClose**](/windows/desktop/api/Ntsecapi/nf-ntsecapi-lsaclose).
 * @see https://learn.microsoft.com/windows/win32/SecMgmt/lsa-handle
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_HANDLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
