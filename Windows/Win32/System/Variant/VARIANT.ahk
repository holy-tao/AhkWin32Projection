#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import ".\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * VARIANTARG describes arguments passed within DISPPARAMS, and VARIANT to specify variant data that cannot be passed by reference.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-variant
 * @namespace Windows.Win32.System.Variant
 */
export default struct VARIANT {
    #StructPack 8

    vt : VARENUM

    wReserved1 : UInt16

    wReserved2 : UInt16

    wReserved3 : UInt16

    llVal : Int64

    pRecInfo : IRecordInfo

    static __New() {
        DefineProp(this.Prototype, 'lVal', { type: Int32, offset: 8 })
        DefineProp(this.Prototype, 'bVal', { type: Int8, offset: 8 })
        DefineProp(this.Prototype, 'iVal', { type: Int16, offset: 8 })
        DefineProp(this.Prototype, 'fltVal', { type: Float32, offset: 8 })
        DefineProp(this.Prototype, 'dblVal', { type: Float64, offset: 8 })
        DefineProp(this.Prototype, 'boolVal', { type: VARIANT_BOOL, offset: 8 })
        DefineProp(this.Prototype, '__OBSOLETE__VARIANT_BOOL', { type: VARIANT_BOOL, offset: 8 })
        DefineProp(this.Prototype, 'scode', { type: Int32, offset: 8 })
        DefineProp(this.Prototype, 'cyVal', { type: CY, offset: 8 })
        DefineProp(this.Prototype, 'date', { type: Float64, offset: 8 })
        DefineProp(this.Prototype, 'bstrVal', { type: BSTR, offset: 8 })
        DefineProp(this.Prototype, 'punkVal', { type: IUnknown, offset: 8 })
        DefineProp(this.Prototype, 'pdispVal', { type: IDispatch, offset: 8 })
        DefineProp(this.Prototype, 'parray', { type: SAFEARRAY.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pbVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'piVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'plVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pllVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pfltVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pdblVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pboolVal', { type: VARIANT_BOOL.Ptr, offset: 8 })
        DefineProp(this.Prototype, '__OBSOLETE__VARIANT_PBOOL', { type: VARIANT_BOOL.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pscode', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pcyVal', { type: CY.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pdate', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pbstrVal', { type: BSTR.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'ppunkVal', { type: IUnknown.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'ppdispVal', { type: IDispatch.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pparray', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pvarVal', { type: VARIANT.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'byref', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'cVal', { type: CHAR, offset: 8 })
        DefineProp(this.Prototype, 'uiVal', { type: UInt16, offset: 8 })
        DefineProp(this.Prototype, 'ulVal', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'ullVal', { type: Int64, offset: 8 })
        DefineProp(this.Prototype, 'intVal', { type: Int32, offset: 8 })
        DefineProp(this.Prototype, 'uintVal', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'pdecVal', { type: DECIMAL.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pcVal', { type: PSTR, offset: 8 })
        DefineProp(this.Prototype, 'puiVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pulVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pullVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pintVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'puintVal', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pvRecord', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'decVal', { type: DECIMAL, offset: 0 })
        this.DeleteProp("__New")
    }
}
