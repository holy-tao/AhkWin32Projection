#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import ".\PSID.ahk" { PSID }

/**
 * Defines the security capabilities of the app container.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-security_capabilities
 * @namespace Windows.Win32.Security
 */
export default struct SECURITY_CAPABILITIES {
    #StructPack 8

    /**
     * The SID of the app container.
     */
    AppContainerSid : PSID

    /**
     * The specific capabilities.
     */
    Capabilities : SID_AND_ATTRIBUTES.Ptr

    CapabilityCount : UInt32

    /**
     * This member is reserved. Do not use it.
     */
    Reserved : UInt32

}
