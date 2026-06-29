#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HSE_EXEC_URL_ENTITY_INFO.ahk" { HSE_EXEC_URL_ENTITY_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\HSE_EXEC_URL_USER_INFO.ahk" { HSE_EXEC_URL_USER_INFO }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_EXEC_URL_INFO {
    #StructPack 8

    pszUrl : PSTR

    pszMethod : PSTR

    pszChildHeaders : PSTR

    pUserInfo : HSE_EXEC_URL_USER_INFO.Ptr

    pEntity : HSE_EXEC_URL_ENTITY_INFO.Ptr

    dwExecUrlFlags : UInt32

}
