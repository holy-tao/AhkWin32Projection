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
 * Describes a filter for limiting the view of a table to particular rows for Outlook 2013 and Outlook 2016.
 * @remarks
 * Clients use an **SRestriction** structure to limit the number and type of rows in their view of a table and to search for specific messages in a folder. To impose the limitation on a table, clients call either [IMAPITable::Restrict](imapitable-restrict.md) or [IMAPITable::FindRow](imapitable-findrow.md). To impose the limitation on a folder, clients call the folder's [IMAPIContainer::SetSearchCriteria](imapicontainer-setsearchcriteria.md) method. 
 *   
 * For information about how to use restrictions with tables, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/srestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SRestriction extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _res_e__Union extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {SComparePropsRestriction}
         */
        resCompareProps{
            get {
                if(!this.HasProp("__resCompareProps"))
                    this.__resCompareProps := SComparePropsRestriction(0, this)
                return this.__resCompareProps
            }
        }
    
        /**
         * @type {SAndRestriction}
         */
        resAnd{
            get {
                if(!this.HasProp("__resAnd"))
                    this.__resAnd := SAndRestriction(0, this)
                return this.__resAnd
            }
        }
    
        /**
         * @type {SOrRestriction}
         */
        resOr{
            get {
                if(!this.HasProp("__resOr"))
                    this.__resOr := SOrRestriction(0, this)
                return this.__resOr
            }
        }
    
        /**
         * @type {SNotRestriction}
         */
        resNot{
            get {
                if(!this.HasProp("__resNot"))
                    this.__resNot := SNotRestriction(0, this)
                return this.__resNot
            }
        }
    
        /**
         * @type {SContentRestriction}
         */
        resContent{
            get {
                if(!this.HasProp("__resContent"))
                    this.__resContent := SContentRestriction(0, this)
                return this.__resContent
            }
        }
    
        /**
         * @type {SPropertyRestriction}
         */
        resProperty{
            get {
                if(!this.HasProp("__resProperty"))
                    this.__resProperty := SPropertyRestriction(0, this)
                return this.__resProperty
            }
        }
    
        /**
         * @type {SBitMaskRestriction}
         */
        resBitMask{
            get {
                if(!this.HasProp("__resBitMask"))
                    this.__resBitMask := SBitMaskRestriction(0, this)
                return this.__resBitMask
            }
        }
    
        /**
         * @type {SSizeRestriction}
         */
        resSize{
            get {
                if(!this.HasProp("__resSize"))
                    this.__resSize := SSizeRestriction(0, this)
                return this.__resSize
            }
        }
    
        /**
         * @type {SExistRestriction}
         */
        resExist{
            get {
                if(!this.HasProp("__resExist"))
                    this.__resExist := SExistRestriction(0, this)
                return this.__resExist
            }
        }
    
        /**
         * @type {SSubRestriction}
         */
        resSub{
            get {
                if(!this.HasProp("__resSub"))
                    this.__resSub := SSubRestriction(0, this)
                return this.__resSub
            }
        }
    
        /**
         * @type {SCommentRestriction}
         */
        resComment{
            get {
                if(!this.HasProp("__resComment"))
                    this.__resComment := SCommentRestriction(0, this)
                return this.__resComment
            }
        }
    
    }

    /**
     * > The restriction type. Possible values are as follows: 
     *     
     * RES_AND 
     *   
     * > An **AND** restriction, which applies a bitwise **AND** operation to a restriction. 
     *     
     * RES_BITMASK 
     *   
     * > A bitmask restriction, which applies a bitmask to a property value.
     *     
     * RES_COMMENT 
     *   
     * > A comment restriction, which associates a comment with a restriction.
     *     
     * RES_COMPAREPROPS 
     *   
     * > A property comparison restriction, which compares two property values.
     *     
     * RES_CONTENT 
     *   
     * > A content restriction, which searches a property value for specific content.
     *     
     * RES_EXIST 
     *   
     * > An exist restriction, which determines whether a property is supported.
     *     
     * RES_NOT 
     *   
     * > A **NOT** restriction, which applies a logical **NOT** operation to a restriction. 
     *     
     * RES_OR 
     *   
     * > An **OR** restriction, which applies a logical **OR** operation to a restriction. 
     *     
     * RES_PROPERTY 
     *   
     * > A property restriction, which determines whether a property value matches a particular value.
     *     
     * RES_SIZE 
     *   
     * > A size restriction, which determines whether a property value is a particular size.
     *     
     * RES_SUBRESTRICTION 
     *   
     * > A sub-object restriction, which applies a restriction to a message's attachments or recipients.
     * @type {Integer}
     */
    rt {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Union of restriction structures describing the filter to be applied. The specific structure included in the **res** member depends on the value of the **rt** member. The mapping between restriction type and structure is listed in the following table. 
     *     
     * |Property |Value |
     * |:-----|:-----|
     * |**Restriction type** <br/> |**Restriction structure** <br/> |
     * |RES_AND  <br/> |[SAndRestriction](sandrestriction.md) <br/> |
     * |RES_BITMASK  <br/> |[SBitMaskRestriction](sbitmaskrestriction.md) <br/> |
     * |RES_COMMENT  <br/> |[SCommentRestriction](scommentrestriction.md) <br/> |
     * |RES_COMPAREPROPS  <br/> |[SComparePropsRestriction](scomparepropsrestriction.md) <br/> |
     * |RES_CONTENT  <br/> |[SContentRestriction](scontentrestriction.md) <br/> |
     * |RES_EXIST  <br/> |[SExistRestriction](sexistrestriction.md) <br/> |
     * |RES_NOT  <br/> |[SNotRestriction](snotrestriction.md) <br/> |
     * |RES_OR  <br/> |[SOrRestriction](sorrestriction.md) <br/> |
     * |RES_PROPERTY  <br/> |[SPropertyRestriction](spropertyrestriction.md) <br/> |
     * |RES_SIZE  <br/> |[SSizeRestriction](ssizerestriction.md) <br/> |
     * |RES_SUBRESTRICTION  <br/> |[SSubRestriction](ssubrestriction.md) <br/> |
     * @type {_res_e__Union}
     */
    res{
        get {
            if(!this.HasProp("__res"))
                this.__res := %this.__Class%._res_e__Union(8, this)
            return this.__res
        }
    }
}
