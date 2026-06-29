#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The POLICY_ELEMENT (lpmapi.h) structure contains an RSVP policy element.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-policy_element
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct POLICY_ELEMENT {
    #StructPack 8

    targetEndpointAddress : PWSTR

    issuerEndpointAddress : PWSTR

    issuedTokenParameters : PWSTR

    privacyNoticeLink : PWSTR

    privacyNoticeVersion : UInt32

    useManagedPresentation : BOOL

}
