#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_EXEC_UNICODE_URL_USER_INFO {
    #StructPack 8

    hImpersonationToken : HANDLE

    pszCustomUserName : PWSTR

    pszCustomAuthType : PSTR

}
