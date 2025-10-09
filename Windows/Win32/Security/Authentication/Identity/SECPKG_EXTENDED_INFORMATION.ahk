#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SECPKG_GSS_INFO.ahk
#Include .\SECPKG_CONTEXT_THUNKS.ahk
#Include .\SECURITY_STRING.ahk
#Include .\SECPKG_WOW_CLIENT_DLL.ahk
#Include .\SECPKG_SERIALIZED_OID.ahk
#Include .\SECPKG_EXTRA_OIDS.ahk
#Include .\SECPKG_NEGO2_INFO.ahk

/**
 * The SECPKG_EXTENDED_INFORMATION structure is used to hold information about optional package capabilities.This structure is used by the SpGetExtendedInformation and SpSetExtendedInformation functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_extended_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_EXTENDED_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A value from the 
     * <a href="https://docs.microsoft.com/windows/win32/api/ntsecpkg/ne-ntsecpkg-secpkg_extended_information_class">SECPKG_EXTENDED_INFORMATION_CLASS</a> enumeration which identifies the information in the structure.
     * @type {Integer}
     */
    Class {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SECPKG_GSS_INFO}
     */
    GssInfo{
        get {
            if(!this.HasProp("__GssInfo"))
                this.__GssInfo := SECPKG_GSS_INFO(this.ptr + 8)
            return this.__GssInfo
        }
    }

    /**
     * @type {SECPKG_CONTEXT_THUNKS}
     */
    ContextThunks{
        get {
            if(!this.HasProp("__ContextThunks"))
                this.__ContextThunks := SECPKG_CONTEXT_THUNKS(this.ptr + 8)
            return this.__ContextThunks
        }
    }

    /**
     * @type {Integer}
     */
    MutualAuthLevel {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {SECPKG_WOW_CLIENT_DLL}
     */
    WowClientDll{
        get {
            if(!this.HasProp("__WowClientDll"))
                this.__WowClientDll := SECPKG_WOW_CLIENT_DLL(this.ptr + 8)
            return this.__WowClientDll
        }
    }

    /**
     * @type {SECPKG_EXTRA_OIDS}
     */
    ExtraOids{
        get {
            if(!this.HasProp("__ExtraOids"))
                this.__ExtraOids := SECPKG_EXTRA_OIDS(this.ptr + 8)
            return this.__ExtraOids
        }
    }

    /**
     * @type {SECPKG_NEGO2_INFO}
     */
    Nego2Info{
        get {
            if(!this.HasProp("__Nego2Info"))
                this.__Nego2Info := SECPKG_NEGO2_INFO(this.ptr + 8)
            return this.__Nego2Info
        }
    }
}
