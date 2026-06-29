#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct ImgErrorInfo {
    #StructPack 8

    description : BSTR

    guid : Guid

    helpContext : UInt32

    helpFile : BSTR

    source : BSTR

    devDescription : BSTR

    errorID : Guid

    cUserParameters : UInt32

    aUserParameters : BSTR.Ptr

    userFallback : BSTR

    exceptionID : UInt32

}
