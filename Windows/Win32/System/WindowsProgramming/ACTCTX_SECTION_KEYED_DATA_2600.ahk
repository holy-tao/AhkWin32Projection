#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct ACTCTX_SECTION_KEYED_DATA_2600 {
    #StructPack 8

    cbSize : UInt32 := this.Size

    ulDataFormatVersion : UInt32

    lpData : IntPtr

    ulLength : UInt32

    lpSectionGlobalData : IntPtr

    ulSectionGlobalDataLength : UInt32

    lpSectionBase : IntPtr

    ulSectionTotalLength : UInt32

    hActCtx : HANDLE

    ulAssemblyRosterIndex : UInt32

}
