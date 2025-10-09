#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BUCKETCATEGORIZE.ahk
#Include .\RANGECATEGORIZE.ahk
#Include .\COLUMNSET.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class CATEGORIZATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulCatType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cClusters {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BUCKETCATEGORIZE}
     */
    bucket{
        get {
            if(!this.HasProp("__bucket"))
                this.__bucket := BUCKETCATEGORIZE(this.ptr + 8)
            return this.__bucket
        }
    }

    /**
     * @type {RANGECATEGORIZE}
     */
    range{
        get {
            if(!this.HasProp("__range"))
                this.__range := RANGECATEGORIZE(this.ptr + 8)
            return this.__range
        }
    }

    /**
     * @type {COLUMNSET}
     */
    csColumns{
        get {
            if(!this.HasProp("__csColumns"))
                this.__csColumns := COLUMNSET(this.ptr + 24)
            return this.__csColumns
        }
    }
}
