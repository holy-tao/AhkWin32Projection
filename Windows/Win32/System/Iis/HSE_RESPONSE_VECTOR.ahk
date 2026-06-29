#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HSE_VECTOR_ELEMENT.ahk" { HSE_VECTOR_ELEMENT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_RESPONSE_VECTOR {
    #StructPack 8

    dwFlags : UInt32

    pszStatus : PSTR

    pszHeaders : PSTR

    nElementCount : UInt32

    lpElementArray : HSE_VECTOR_ELEMENT.Ptr

}
