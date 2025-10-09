#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NODERESTRICTION.ahk
#Include .\VECTORRESTRICTION.ahk
#Include ..\Com\StructuredStorage\PROPSPEC.ahk
#Include ..\..\Storage\IndexServer\FULLPROPSPEC.ahk
#Include .\CONTENTRESTRICTION.ahk
#Include .\NATLANGUAGERESTRICTION.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\Com\StructuredStorage\BSTRBLOB.ahk
#Include ..\Com\BLOB.ahk
#Include ..\Com\StructuredStorage\CAC.ahk
#Include ..\Com\StructuredStorage\CAUB.ahk
#Include ..\Com\StructuredStorage\CAI.ahk
#Include ..\Com\StructuredStorage\CAUI.ahk
#Include ..\Com\StructuredStorage\CAL.ahk
#Include ..\Com\StructuredStorage\CAUL.ahk
#Include ..\Com\StructuredStorage\CAH.ahk
#Include ..\Com\StructuredStorage\CAUH.ahk
#Include ..\Com\StructuredStorage\CAFLT.ahk
#Include ..\Com\StructuredStorage\CADBL.ahk
#Include ..\Com\StructuredStorage\CABOOL.ahk
#Include ..\Com\StructuredStorage\CASCODE.ahk
#Include ..\Com\StructuredStorage\CACY.ahk
#Include ..\Com\StructuredStorage\CADATE.ahk
#Include ..\Com\StructuredStorage\CAFILETIME.ahk
#Include ..\Com\StructuredStorage\CACLSID.ahk
#Include ..\Com\StructuredStorage\CACLIPDATA.ahk
#Include ..\Com\StructuredStorage\CABSTR.ahk
#Include ..\Com\StructuredStorage\CABSTRBLOB.ahk
#Include ..\Com\StructuredStorage\CALPSTR.ahk
#Include ..\Com\StructuredStorage\CALPWSTR.ahk
#Include ..\Com\StructuredStorage\CAPROPVARIANT.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\PROPERTYRESTRICTION.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class RESTRICTION extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    class _URes extends Win32Struct {
        static sizeof => 256
        static packingSize => 8

        /**
         * @type {NODERESTRICTION}
         */
        ar{
            get {
                if(!this.HasProp("__ar"))
                    this.__ar := NODERESTRICTION(this.ptr + 0)
                return this.__ar
            }
        }
    
        /**
         * @type {NODERESTRICTION}
         */
        orRestriction{
            get {
                if(!this.HasProp("__orRestriction"))
                    this.__orRestriction := NODERESTRICTION(this.ptr + 0)
                return this.__orRestriction
            }
        }
    
        /**
         * @type {NODERESTRICTION}
         */
        pxr{
            get {
                if(!this.HasProp("__pxr"))
                    this.__pxr := NODERESTRICTION(this.ptr + 0)
                return this.__pxr
            }
        }
    
        /**
         * @type {VECTORRESTRICTION}
         */
        vr{
            get {
                if(!this.HasProp("__vr"))
                    this.__vr := VECTORRESTRICTION(this.ptr + 0)
                return this.__vr
            }
        }
    
        /**
         * @type {Pointer<TypeHandle>}
         */
        nr {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {CONTENTRESTRICTION}
         */
        cr{
            get {
                if(!this.HasProp("__cr"))
                    this.__cr := CONTENTRESTRICTION(this.ptr + 0)
                return this.__cr
            }
        }
    
        /**
         * @type {NATLANGUAGERESTRICTION}
         */
        nlr{
            get {
                if(!this.HasProp("__nlr"))
                    this.__nlr := NATLANGUAGERESTRICTION(this.ptr + 0)
                return this.__nlr
            }
        }
    
        /**
         * @type {PROPERTYRESTRICTION}
         */
        pr{
            get {
                if(!this.HasProp("__pr"))
                    this.__pr := PROPERTYRESTRICTION(this.ptr + 0)
                return this.__pr
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    rt {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    weight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_URes}
     */
    res{
        get {
            if(!this.HasProp("__res"))
                this.__res := %this.__Class%._URes(this.ptr + 8)
            return this.__res
        }
    }
}
