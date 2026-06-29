#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VARDESC.ahk" { VARDESC }
#Import ".\ITypeComp.ahk" { ITypeComp }
#Import ".\FUNCDESC.ahk" { FUNCDESC }

/**
 * Describes a pointer.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-bindptr
 * @namespace Windows.Win32.System.Com
 */
export default struct BINDPTR {
    #StructPack 8

    /**
     * Pointer to a function.
     */
    lpfuncdesc : FUNCDESC.Ptr

    static __New() {
        DefineProp(this.Prototype, 'lpvardesc', { type: VARDESC.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'lptcomp', { type: ITypeComp, offset: 0 })
        this.DeleteProp("__New")
    }
}
