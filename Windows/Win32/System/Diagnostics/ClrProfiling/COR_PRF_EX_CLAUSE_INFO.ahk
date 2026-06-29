#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COR_PRF_CLAUSE_TYPE.ahk" { COR_PRF_CLAUSE_TYPE }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_EX_CLAUSE_INFO {
    #StructPack 8

    clauseType : COR_PRF_CLAUSE_TYPE

    programCounter : IntPtr

    framePointer : IntPtr

    shadowStackPointer : IntPtr

}
