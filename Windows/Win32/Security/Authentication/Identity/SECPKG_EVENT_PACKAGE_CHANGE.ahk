#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURITY_STRING.ahk" { SECURITY_STRING }
#Import ".\SECPKG_PACKAGE_CHANGE_TYPE.ahk" { SECPKG_PACKAGE_CHANGE_TYPE }

/**
 * The SECPKG_EVENT_PACKAGE_CHANGE structure contains information about changes in security package availability.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_event_package_change
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_EVENT_PACKAGE_CHANGE {
    #StructPack 8

    ChangeType : SECPKG_PACKAGE_CHANGE_TYPE

    /**
     * The identifier of the security package.
     */
    PackageId : IntPtr

    /**
     * The name of the security package.
     */
    PackageName : SECURITY_STRING

}
