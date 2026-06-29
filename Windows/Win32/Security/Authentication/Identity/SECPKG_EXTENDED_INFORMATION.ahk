#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_NEGO2_INFO.ahk" { SECPKG_NEGO2_INFO }
#Import ".\SECPKG_GSS_INFO.ahk" { SECPKG_GSS_INFO }
#Import ".\SECPKG_EXTRA_OIDS.ahk" { SECPKG_EXTRA_OIDS }
#Import ".\SECPKG_SERIALIZED_OID.ahk" { SECPKG_SERIALIZED_OID }
#Import ".\SECURITY_STRING.ahk" { SECURITY_STRING }
#Import ".\SECPKG_CONTEXT_THUNKS.ahk" { SECPKG_CONTEXT_THUNKS }
#Import ".\SECPKG_WOW_CLIENT_DLL.ahk" { SECPKG_WOW_CLIENT_DLL }
#Import ".\SECPKG_EXTENDED_INFORMATION_CLASS.ahk" { SECPKG_EXTENDED_INFORMATION_CLASS }
#Import ".\SECPKG_MUTUAL_AUTH_LEVEL.ahk" { SECPKG_MUTUAL_AUTH_LEVEL }

/**
 * The SECPKG_EXTENDED_INFORMATION structure is used to hold information about optional package capabilities.This structure is used by the SpGetExtendedInformation and SpSetExtendedInformation functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_extended_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_EXTENDED_INFORMATION {
    #StructPack 8


    struct _Info {
        GssInfo : SECPKG_GSS_INFO

        static __New() {
            DefineProp(this.Prototype, 'ContextThunks', { type: SECPKG_CONTEXT_THUNKS, offset: 0 })
            DefineProp(this.Prototype, 'MutualAuthLevel', { type: SECPKG_MUTUAL_AUTH_LEVEL, offset: 0 })
            DefineProp(this.Prototype, 'WowClientDll', { type: SECPKG_WOW_CLIENT_DLL, offset: 0 })
            DefineProp(this.Prototype, 'ExtraOids', { type: SECPKG_EXTRA_OIDS, offset: 0 })
            DefineProp(this.Prototype, 'Nego2Info', { type: SECPKG_NEGO2_INFO, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A value from the 
     * <a href="https://docs.microsoft.com/windows/win32/api/ntsecpkg/ne-ntsecpkg-secpkg_extended_information_class">SECPKG_EXTENDED_INFORMATION_CLASS</a> enumeration which identifies the information in the structure.
     */
    Class : SECPKG_EXTENDED_INFORMATION_CLASS

    /**
     * Structure that contains the information.
     */
    Info : SECPKG_EXTENDED_INFORMATION._Info

}
