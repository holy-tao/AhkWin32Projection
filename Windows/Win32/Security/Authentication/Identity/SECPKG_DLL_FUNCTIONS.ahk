#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SECPKG_DLL_FUNCTIONS structure contains pointers to the LSA functions that a security package can call while executing in-process with a client/server application.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_dll_functions
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_DLL_FUNCTIONS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa374721(v=vs.85)">AllocateHeap</a> function.
     * @type {Pointer<PLSA_ALLOCATE_LSA_HEAP>}
     */
    AllocateHeap {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa375418(v=vs.85)">FreeHeap</a> function.
     * @type {Pointer<PLSA_FREE_LSA_HEAP>}
     */
    FreeHeap {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379372(v=vs.85)">RegisterCallback</a> function.
     * @type {Pointer<PLSA_REGISTER_CALLBACK>}
     */
    RegisterCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<PLSA_LOCATE_PKG_BY_ID>}
     */
    LocatePackageById {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
