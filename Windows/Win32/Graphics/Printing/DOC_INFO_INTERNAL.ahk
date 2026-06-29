#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DOC_INFO_INTERNAL {
    #StructPack 8

    pDocName : IntPtr

    pOutputFile : IntPtr

    pDatatype : IntPtr

    bLowILJob : BOOL

    hTokenLowIL : HANDLE

}
