#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class DOC_INFO_INTERNAL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<SByte>}
     */
    pDocName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<SByte>}
     */
    pOutputFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SByte>}
     */
    pDatatype {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    bLowILJob{
        get {
            if(!this.HasProp("__bLowILJob"))
                this.__bLowILJob := BOOL(this.ptr + 24)
            return this.__bLowILJob
        }
    }

    /**
     * @type {HANDLE}
     */
    hTokenLowIL{
        get {
            if(!this.HasProp("__hTokenLowIL"))
                this.__hTokenLowIL := HANDLE(this.ptr + 32)
            return this.__hTokenLowIL
        }
    }
}
