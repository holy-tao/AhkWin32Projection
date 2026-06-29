#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\CY.ahk" { CY }
#Import ".\DBTIMESTAMP.ahk" { DBTIMESTAMP }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DB_NUMERIC.ahk" { DB_NUMERIC }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DBOBJECT.ahk" { DBOBJECT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SSVARIANT {
    #StructPack 8


    struct _NCharVal {
        sActualLength : Int16

        sMaxLength : Int16

        pwchNCharVal : PWSTR

        rgbReserved : Int8[5]

        dwReserved : UInt32

        pwchReserved : PWSTR

    }

    struct _CharVal {
        sActualLength : Int16

        sMaxLength : Int16

        pchCharVal : PSTR

        rgbReserved : Int8[5]

        dwReserved : UInt32

        pwchReserved : PWSTR

    }

    struct _BinaryVal {
        sActualLength : Int16

        sMaxLength : Int16

        prgbBinaryVal : IntPtr

        dwReserved : UInt32

    }

    struct _UnknownType {
        dwActualLength : UInt32

        rgMetadata : Int8[16]

        pUnknownData : IntPtr

    }

    struct _BLOBType {
        dbobj : DBOBJECT

        pUnk : IUnknown

    }

    vt : UInt16

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    bTinyIntVal : Int8

    static __New() {
        DefineProp(this.Prototype, 'sShortIntVal', { type: Int16, offset: 16 })
        DefineProp(this.Prototype, 'lIntVal', { type: Int32, offset: 16 })
        DefineProp(this.Prototype, 'llBigIntVal', { type: Int64, offset: 16 })
        DefineProp(this.Prototype, 'fltRealVal', { type: Float32, offset: 16 })
        DefineProp(this.Prototype, 'dblFloatVal', { type: Float64, offset: 16 })
        DefineProp(this.Prototype, 'cyMoneyVal', { type: CY, offset: 16 })
        DefineProp(this.Prototype, 'NCharVal', { type: SSVARIANT._NCharVal, offset: 16 })
        DefineProp(this.Prototype, 'CharVal', { type: SSVARIANT._CharVal, offset: 16 })
        DefineProp(this.Prototype, 'fBitVal', { type: VARIANT_BOOL, offset: 16 })
        DefineProp(this.Prototype, 'rgbGuidVal', { type: Int8[16], offset: 16 })
        DefineProp(this.Prototype, 'numNumericVal', { type: DB_NUMERIC, offset: 16 })
        DefineProp(this.Prototype, 'BinaryVal', { type: SSVARIANT._BinaryVal, offset: 16 })
        DefineProp(this.Prototype, 'tsDateTimeVal', { type: DBTIMESTAMP, offset: 16 })
        DefineProp(this.Prototype, 'UnknownType', { type: SSVARIANT._UnknownType, offset: 16 })
        DefineProp(this.Prototype, 'BLOBType', { type: SSVARIANT._BLOBType, offset: 16 })
        this.DeleteProp("__New")
    }
}
