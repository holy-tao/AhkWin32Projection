#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\OLESTREAMVTBL.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
class OLESTREAM extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<OLESTREAMVTBL>}
     */
    lpstbl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
