#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class ACTCTX_SECTION_KEYED_DATA_2600 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulDataFormatVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpSectionGlobalData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ulSectionGlobalDataLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpSectionBase {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ulSectionTotalLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {HANDLE}
     */
    hActCtx{
        get {
            if(!this.HasProp("__hActCtx"))
                this.__hActCtx := HANDLE(56, this)
            return this.__hActCtx
        }
    }

    /**
     * @type {Integer}
     */
    ulAssemblyRosterIndex {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 72
    }
}
