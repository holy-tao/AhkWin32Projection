#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\GDI_OBJECT.ahk
#Include .\userSTGMEDIUM.ahk
#Include ..\SystemServices\userHGLOBAL.ahk
#Include .\IUnknown.ahk
#Include .\BYTE_BLOB.ahk
#Include ..\SystemServices\userHENHMETAFILE.ahk
#Include ..\SystemServices\userHMETAFILEPICT.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class userFLAG_STGMEDIUM extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ContextFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fPassOwnership {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {userSTGMEDIUM}
     */
    Stgmed {
        get {
            if(!this.HasProp("__Stgmed"))
                this.__Stgmed := userSTGMEDIUM(8, this)
            return this.__Stgmed
        }
    }
}
