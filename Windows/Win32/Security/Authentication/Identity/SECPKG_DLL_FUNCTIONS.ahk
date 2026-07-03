#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SECPKG_DLL_FUNCTIONS structure contains pointers to the LSA functions that a security package can call while executing in-process with a client/server application.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_dll_functions
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_DLL_FUNCTIONS {
    #StructPack 8

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa374721(v=vs.85)">AllocateHeap</a> function.
     */
    AllocateHeap : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa375418(v=vs.85)">FreeHeap</a> function.
     */
    FreeHeap : IntPtr

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379372(v=vs.85)">RegisterCallback</a> function.
     */
    RegisterCallback : IntPtr

    LocatePackageById : IntPtr

}
