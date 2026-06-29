#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Ole\ARRAYDESC.ahk" { ARRAYDESC }

/**
 * Describes the type of a variable, the return type of a function, or the type of a function parameter.
 * @remarks
 * If the variable is VT_SAFEARRAY or VT_PTR, the union portion of the TYPEDESC contains a pointer to a TYPEDESC that specifies the element type.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-typedesc
 * @namespace Windows.Win32.System.Com
 */
export default struct TYPEDESC {
    #StructPack 8

    lptdesc : TYPEDESC.Ptr

    lpadesc {
        get => (addr := this.__lpadesc_ptr) ? ARRAYDESC.At(addr) : unset
        set => this.__lpadesc_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * The variant type.
     */
    vt : VARENUM

    static __New() {
        DefineProp(this.Prototype, '__lpadesc_ptr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'hreftype', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
