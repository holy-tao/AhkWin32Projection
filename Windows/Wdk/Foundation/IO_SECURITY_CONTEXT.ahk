#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Security\SECURITY_QUALITY_OF_SERVICE.ahk
#Include .\ACCESS_STATE.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class IO_SECURITY_CONTEXT extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<SECURITY_QUALITY_OF_SERVICE>}
     */
    SecurityQos {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<ACCESS_STATE>}
     */
    AccessState {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DesiredAccess {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    FullCreateOptions {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
