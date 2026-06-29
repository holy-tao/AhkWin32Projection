#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct MS_ADDINFO_DETACHEDSIG {
    #StructPack 8

    cbStruct : UInt32

    hSignatureFile : HANDLE

    cbSignatureObject : UInt32

    pbSignatureObject : IntPtr

}
