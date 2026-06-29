#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROPVARIANT.ahk" { PROPVARIANT }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CAPROPVARIANT {
    #StructPack 8

    cElems : UInt32

    __pElems_ptr : IntPtr
    pElems {
        get => (addr := this.__pElems_ptr) ? PROPVARIANT.At(addr) : unset
        set => this.__pElems_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
