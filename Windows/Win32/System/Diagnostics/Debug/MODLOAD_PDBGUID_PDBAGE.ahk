#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MODLOAD_PDBGUID_PDBAGE {
    #StructPack 4

    PdbGuid : Guid

    PdbAge : UInt32

}
