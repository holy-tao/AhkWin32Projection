#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\CY.ahk" { CY }
#Import "..\Com\FLAGGED_WORD_BLOB.ahk" { FLAGGED_WORD_BLOB }
#Import ".\_wireBRECORD.ahk" { _wireBRECORD }
#Import ".\_wireSAFEARRAY.ahk" { _wireSAFEARRAY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct _wireVARIANT {
    #StructPack 8

    clSize : UInt32

    rpcReserved : UInt32

    vt : UInt16

    wReserved1 : UInt16

    wReserved2 : UInt16

    wReserved3 : UInt16

    llVal : Int64

    static __New() {
        DefineProp(this.Prototype, 'lVal', { type: Int32, offset: 16 })
        DefineProp(this.Prototype, 'bVal', { type: Int8, offset: 16 })
        DefineProp(this.Prototype, 'iVal', { type: Int16, offset: 16 })
        DefineProp(this.Prototype, 'fltVal', { type: Float32, offset: 16 })
        DefineProp(this.Prototype, 'dblVal', { type: Float64, offset: 16 })
        DefineProp(this.Prototype, 'boolVal', { type: VARIANT_BOOL, offset: 16 })
        DefineProp(this.Prototype, 'scode', { type: Int32, offset: 16 })
        DefineProp(this.Prototype, 'cyVal', { type: CY, offset: 16 })
        DefineProp(this.Prototype, 'date', { type: Float64, offset: 16 })
        DefineProp(this.Prototype, 'bstrVal', { type: FLAGGED_WORD_BLOB.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'punkVal', { type: IUnknown, offset: 16 })
        DefineProp(this.Prototype, 'pdispVal', { type: IDispatch, offset: 16 })
        DefineProp(this.Prototype, 'parray', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'brecVal', { type: _wireBRECORD.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pbVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'piVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'plVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pllVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pfltVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pdblVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pboolVal', { type: VARIANT_BOOL.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pscode', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pcyVal', { type: CY.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pdate', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pbstrVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'ppunkVal', { type: IUnknown.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'ppdispVal', { type: IDispatch.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pparray', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pvarVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'cVal', { type: CHAR, offset: 16 })
        DefineProp(this.Prototype, 'uiVal', { type: UInt16, offset: 16 })
        DefineProp(this.Prototype, 'ulVal', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'ullVal', { type: Int64, offset: 16 })
        DefineProp(this.Prototype, 'intVal', { type: Int32, offset: 16 })
        DefineProp(this.Prototype, 'uintVal', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'decVal', { type: DECIMAL, offset: 16 })
        DefineProp(this.Prototype, 'pdecVal', { type: DECIMAL.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pcVal', { type: PSTR, offset: 16 })
        DefineProp(this.Prototype, 'puiVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pulVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pullVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pintVal', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'puintVal', { type: IntPtr, offset: 16 })
        this.DeleteProp("__New")
    }
}
