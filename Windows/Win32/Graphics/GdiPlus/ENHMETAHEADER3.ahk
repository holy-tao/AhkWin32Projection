#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ENHMETAHEADER3 {
    #StructPack 4

    iType : UInt32

    nSize : UInt32

    rclBounds : RECTL

    rclFrame : RECTL

    dSignature : UInt32

    nVersion : UInt32

    nBytes : UInt32

    nRecords : UInt32

    nHandles : UInt16

    sReserved : UInt16

    nDescription : UInt32

    offDescription : UInt32

    nPalEntries : UInt32

    szlDevice : SIZE

    szlMillimeters : SIZE

}
