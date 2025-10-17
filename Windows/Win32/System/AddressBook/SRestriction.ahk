#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SComparePropsRestriction.ahk
#Include .\SAndRestriction.ahk
#Include .\SOrRestriction.ahk
#Include .\SNotRestriction.ahk
#Include .\SContentRestriction.ahk
#Include .\SPropertyRestriction.ahk
#Include .\SBitMaskRestriction.ahk
#Include .\SSizeRestriction.ahk
#Include .\SExistRestriction.ahk
#Include .\SSubRestriction.ahk
#Include .\SCommentRestriction.ahk

/**
 * Do not use. Describes a filter for limiting the view of a table to particular rows.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-srestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SRestriction extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the restriction type. The possible values are as follows.
     * @type {Integer}
     */
    rt {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {SComparePropsRestriction}
     */
    resCompareProps{
        get {
            if(!this.HasProp("__resCompareProps"))
                this.__resCompareProps := SComparePropsRestriction(8, this)
            return this.__resCompareProps
        }
    }

    /**
     * @type {SAndRestriction}
     */
    resAnd{
        get {
            if(!this.HasProp("__resAnd"))
                this.__resAnd := SAndRestriction(8, this)
            return this.__resAnd
        }
    }

    /**
     * @type {SOrRestriction}
     */
    resOr{
        get {
            if(!this.HasProp("__resOr"))
                this.__resOr := SOrRestriction(8, this)
            return this.__resOr
        }
    }

    /**
     * @type {SNotRestriction}
     */
    resNot{
        get {
            if(!this.HasProp("__resNot"))
                this.__resNot := SNotRestriction(8, this)
            return this.__resNot
        }
    }

    /**
     * @type {SContentRestriction}
     */
    resContent{
        get {
            if(!this.HasProp("__resContent"))
                this.__resContent := SContentRestriction(8, this)
            return this.__resContent
        }
    }

    /**
     * @type {SPropertyRestriction}
     */
    resProperty{
        get {
            if(!this.HasProp("__resProperty"))
                this.__resProperty := SPropertyRestriction(8, this)
            return this.__resProperty
        }
    }

    /**
     * @type {SBitMaskRestriction}
     */
    resBitMask{
        get {
            if(!this.HasProp("__resBitMask"))
                this.__resBitMask := SBitMaskRestriction(8, this)
            return this.__resBitMask
        }
    }

    /**
     * @type {SSizeRestriction}
     */
    resSize{
        get {
            if(!this.HasProp("__resSize"))
                this.__resSize := SSizeRestriction(8, this)
            return this.__resSize
        }
    }

    /**
     * @type {SExistRestriction}
     */
    resExist{
        get {
            if(!this.HasProp("__resExist"))
                this.__resExist := SExistRestriction(8, this)
            return this.__resExist
        }
    }

    /**
     * @type {SSubRestriction}
     */
    resSub{
        get {
            if(!this.HasProp("__resSub"))
                this.__resSub := SSubRestriction(8, this)
            return this.__resSub
        }
    }

    /**
     * @type {SCommentRestriction}
     */
    resComment{
        get {
            if(!this.HasProp("__resComment"))
                this.__resComment := SCommentRestriction(8, this)
            return this.__resComment
        }
    }
}
