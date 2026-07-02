#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SBinaryArray.ahk" { SBinaryArray }
#Import ".\SBinary.ahk" { SBinary }
#Import "..\Com\CY.ahk" { CY }
#Import ".\SAppTimeArray.ahk" { SAppTimeArray }
#Import ".\SShortArray.ahk" { SShortArray }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\SLongArray.ahk" { SLongArray }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\SDoubleArray.ahk" { SDoubleArray }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SGuidArray.ahk" { SGuidArray }
#Import ".\SWStringArray.ahk" { SWStringArray }
#Import ".\SRealArray.ahk" { SRealArray }
#Import ".\SDateTimeArray.ahk" { SDateTimeArray }
#Import ".\SLPSTRArray.ahk" { SLPSTRArray }
#Import ".\SCurrencyArray.ahk" { SCurrencyArray }
#Import ".\SLargeIntegerArray.ahk" { SLargeIntegerArray }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct __UPV {
    #StructPack 8

    i : Int16

    static __New() {
        DefineProp(this.Prototype, 'l', { type: Int32, offset: 0 })
        DefineProp(this.Prototype, 'ul', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'flt', { type: Float32, offset: 0 })
        DefineProp(this.Prototype, 'dbl', { type: Float64, offset: 0 })
        DefineProp(this.Prototype, 'b', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'cur', { type: CY, offset: 0 })
        DefineProp(this.Prototype, 'at', { type: Float64, offset: 0 })
        DefineProp(this.Prototype, 'ft', { type: FILETIME, offset: 0 })
        DefineProp(this.Prototype, 'lpszA', { type: PSTR, offset: 0 })
        DefineProp(this.Prototype, 'bin', { type: SBinary, offset: 0 })
        DefineProp(this.Prototype, 'lpszW', { type: PWSTR, offset: 0 })
        DefineProp(this.Prototype, 'lpguid', { type: Guid.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'li', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'MVi', { type: SShortArray, offset: 0 })
        DefineProp(this.Prototype, 'MVl', { type: SLongArray, offset: 0 })
        DefineProp(this.Prototype, 'MVflt', { type: SRealArray, offset: 0 })
        DefineProp(this.Prototype, 'MVdbl', { type: SDoubleArray, offset: 0 })
        DefineProp(this.Prototype, 'MVcur', { type: SCurrencyArray, offset: 0 })
        DefineProp(this.Prototype, 'MVat', { type: SAppTimeArray, offset: 0 })
        DefineProp(this.Prototype, 'MVft', { type: SDateTimeArray, offset: 0 })
        DefineProp(this.Prototype, 'MVbin', { type: SBinaryArray, offset: 0 })
        DefineProp(this.Prototype, 'MVszA', { type: SLPSTRArray, offset: 0 })
        DefineProp(this.Prototype, 'MVszW', { type: SWStringArray, offset: 0 })
        DefineProp(this.Prototype, 'MVguid', { type: SGuidArray, offset: 0 })
        DefineProp(this.Prototype, 'MVli', { type: SLargeIntegerArray, offset: 0 })
        DefineProp(this.Prototype, 'err', { type: Int32, offset: 0 })
        DefineProp(this.Prototype, 'x', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
