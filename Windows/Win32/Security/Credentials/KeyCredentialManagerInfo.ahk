#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Data structure returned from KeyCredentialManagerGetInformation.
 * @see https://learn.microsoft.com/windows/win32/api/keycredmgr/ns-keycredmgr-keycredentialmanagerinfo
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct KeyCredentialManagerInfo {
    #StructPack 4

    /**
     * Unique identifier of the users WHFB container. Only one container per Windows user profile.
     */
    containerId : Guid

}
