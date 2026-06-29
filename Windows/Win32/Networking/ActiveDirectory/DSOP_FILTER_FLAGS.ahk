#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSOP_UPLEVEL_FILTER_FLAGS.ahk" { DSOP_UPLEVEL_FILTER_FLAGS }

/**
 * Contains flags that indicate the types of objects presented to the user for a specified scope or scopes.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-dsop_filter_flags
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSOP_FILTER_FLAGS {
    #StructPack 4

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_uplevel_filter_flags">DSOP_UPLEVEL_FILTER_FLAGS</a> structure that contains the filter flags to use for up-level scopes. An up-level scope is a scope that supports the ADSI LDAP provider. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-ldap-provider">ADSI LDAP Provider</a>.
     */
    Uplevel : DSOP_UPLEVEL_FILTER_FLAGS

    /**
     * Contains the filter flags to use for down-level scopes. This member can be a combination of the following flags.
     */
    flDownlevel : UInt32

}
