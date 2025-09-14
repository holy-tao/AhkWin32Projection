#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset ANSI
 */
class PERUSERSECTIONA extends Win32Struct
{
    static sizeof => 1408

    static packingSize => 4

    /**
     * @type {Array<SByte>}
     */
    szGUID{
        get {
            if(!this.HasProp("__szGUIDProxyArray"))
                this.__szGUIDProxyArray := Win32FixedArray(this.ptr + 0, 59, Primitive, "char")
            return this.__szGUIDProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDispName{
        get {
            if(!this.HasProp("__szDispNameProxyArray"))
                this.__szDispNameProxyArray := Win32FixedArray(this.ptr + 59, 128, Primitive, "char")
            return this.__szDispNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szLocale{
        get {
            if(!this.HasProp("__szLocaleProxyArray"))
                this.__szLocaleProxyArray := Win32FixedArray(this.ptr + 187, 10, Primitive, "char")
            return this.__szLocaleProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szStub{
        get {
            if(!this.HasProp("__szStubProxyArray"))
                this.__szStubProxyArray := Win32FixedArray(this.ptr + 197, 1040, Primitive, "char")
            return this.__szStubProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szVersion{
        get {
            if(!this.HasProp("__szVersionProxyArray"))
                this.__szVersionProxyArray := Win32FixedArray(this.ptr + 1237, 32, Primitive, "char")
            return this.__szVersionProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szCompID{
        get {
            if(!this.HasProp("__szCompIDProxyArray"))
                this.__szCompIDProxyArray := Win32FixedArray(this.ptr + 1269, 128, Primitive, "char")
            return this.__szCompIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwIsInstalled {
        get => NumGet(this, 1400, "uint")
        set => NumPut("uint", value, this, 1400)
    }

    /**
     * @type {Integer}
     */
    bRollback {
        get => NumGet(this, 1404, "int")
        set => NumPut("int", value, this, 1404)
    }
}
