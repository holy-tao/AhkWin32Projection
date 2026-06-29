#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESTRICTION.ahk" { RESTRICTION }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct NOTRESTRICTION {
    #StructPack 8

    __pRes_ptr : IntPtr
    pRes {
        get => (addr := this.__pRes_ptr) ? RESTRICTION.At(addr) : unset
        set => this.__pRes_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
