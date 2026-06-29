#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XLAT_SIDE.ahk" { XLAT_SIDE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct FULL_PTR_XLAT_TABLES {
    #StructPack 8

    RefIdToPointer : IntPtr

    PointerToRefId : IntPtr

    NextRefId : UInt32

    XlatSide : XLAT_SIDE

}
