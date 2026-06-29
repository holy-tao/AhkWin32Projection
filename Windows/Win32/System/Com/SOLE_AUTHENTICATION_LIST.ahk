#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOLE_AUTHENTICATION_INFO.ahk" { SOLE_AUTHENTICATION_INFO }

/**
 * The SOLE_AUTHENTICATION_LIST (objidlbase.h) structure indicates the default authentication information to use with each authentication service.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ns-objidlbase-sole_authentication_list
 * @namespace Windows.Win32.System.Com
 */
export default struct SOLE_AUTHENTICATION_LIST {
    #StructPack 8

    /**
     * The count of pointers in the array pointed to by <b>aAuthInfo</b>.
     */
    cAuthInfo : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_info">SOLE_AUTHENTICATION_INFO</a> structures. Each of these structures contains an identifier for an authentication service, an identifier for the authorization service, and a pointer to authentication information to use with the specified authentication service.
     */
    aAuthInfo : SOLE_AUTHENTICATION_INFO.Ptr

}
