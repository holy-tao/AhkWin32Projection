#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SAFEARR_BSTR.ahk
#Include .\SAFEARR_UNKNOWN.ahk
#Include .\SAFEARR_DISPATCH.ahk
#Include .\SAFEARR_VARIANT.ahk
#Include .\SAFEARR_BRECORD.ahk
#Include .\SAFEARR_HAVEIID.ahk
#Include ..\Com\BYTE_SIZEDARR.ahk
#Include ..\Com\WORD_SIZEDARR.ahk
#Include ..\Com\DWORD_SIZEDARR.ahk
#Include ..\Com\HYPER_SIZEDARR.ahk
#Include .\SAFEARRAYUNION.ahk
#Include ..\Com\SAFEARRAYBOUND.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class _wireSAFEARRAY extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cDims {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fFeatures {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    cbElements {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cLocks {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {SAFEARRAYUNION}
     */
    uArrayStructs{
        get {
            if(!this.HasProp("__uArrayStructs"))
                this.__uArrayStructs := SAFEARRAYUNION(16, this)
            return this.__uArrayStructs
        }
    }

    /**
     * @type {Array<SAFEARRAYBOUND>}
     */
    rgsabound{
        get {
            if(!this.HasProp("__rgsaboundProxyArray"))
                this.__rgsaboundProxyArray := Win32FixedArray(this.ptr + 192, 1, SAFEARRAYBOUND, "")
            return this.__rgsaboundProxyArray
        }
    }
}
