#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FIO_CONTEXT {
    #StructPack 8

    m_dwTempHack : UInt32

    m_dwSignature : UInt32

    m_hFile : HANDLE

    m_dwLinesOffset : UInt32

    m_dwHeaderLength : UInt32

}
