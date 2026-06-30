#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ole\PARAMDESCEX.ahk
#Include ..\Ole\ARRAYDESC.ahk
#Include .\IDLFLAGS.ahk
#Include ..\Ole\PARAMFLAGS.ahk
#Include ..\Ole\PARAMDESC.ahk
#Include ..\Variant\VARENUM.ahk
#Include .\TYPEDESC.ahk
#Include .\IDLDESC.ahk

/**
 * The ELEMDESC structure contains the type description and process-transfer information for a variable, a function, or a function parameter. (ELEMDESC)
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-elemdesc~r1
 * @namespace Windows.Win32.System.Com
 */
class ELEMDESC extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The type of the element.
     * @type {TYPEDESC}
     */
    tdesc {
        get {
            if(!this.HasProp("__tdesc"))
                this.__tdesc := TYPEDESC(0, this)
            return this.__tdesc
        }
    }

    /**
     * @type {IDLDESC}
     */
    idldesc {
        get {
            if(!this.HasProp("__idldesc"))
                this.__idldesc := IDLDESC(16, this)
            return this.__idldesc
        }
    }

    /**
     * @type {PARAMDESC}
     */
    paramdesc {
        get {
            if(!this.HasProp("__paramdesc"))
                this.__paramdesc := PARAMDESC(16, this)
            return this.__paramdesc
        }
    }
}
