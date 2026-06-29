#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SContentRestriction.ahk" { SContentRestriction }
#Import ".\SAndRestriction.ahk" { SAndRestriction }
#Import ".\SExistRestriction.ahk" { SExistRestriction }
#Import ".\SNotRestriction.ahk" { SNotRestriction }
#Import ".\SComparePropsRestriction.ahk" { SComparePropsRestriction }
#Import ".\SPropValue.ahk" { SPropValue }
#Import ".\SSubRestriction.ahk" { SSubRestriction }
#Import ".\SSizeRestriction.ahk" { SSizeRestriction }
#Import ".\SPropertyRestriction.ahk" { SPropertyRestriction }
#Import ".\SBitMaskRestriction.ahk" { SBitMaskRestriction }
#Import ".\SOrRestriction.ahk" { SOrRestriction }
#Import ".\SCommentRestriction.ahk" { SCommentRestriction }

/**
 * Describes a filter for limiting the view of a table to particular rows for Outlook 2013 and Outlook 2016.
 * @remarks
 * Clients use an **SRestriction** structure to limit the number and type of rows in their view of a table and to search for specific messages in a folder. To impose the limitation on a table, clients call either [IMAPITable::Restrict](imapitable-restrict.md) or [IMAPITable::FindRow](imapitable-findrow.md). To impose the limitation on a folder, clients call the folder's [IMAPIContainer::SetSearchCriteria](imapicontainer-setsearchcriteria.md) method. 
 *   
 * For information about how to use restrictions with tables, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/srestriction
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SRestriction {
    #StructPack 8


    struct _res {
        resCompareProps : SComparePropsRestriction

        static __New() {
            DefineProp(this.Prototype, 'resAnd', { type: SAndRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resOr', { type: SOrRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resNot', { type: SNotRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resContent', { type: SContentRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resProperty', { type: SPropertyRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resBitMask', { type: SBitMaskRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resSize', { type: SSizeRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resExist', { type: SExistRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resSub', { type: SSubRestriction, offset: 0 })
            DefineProp(this.Prototype, 'resComment', { type: SCommentRestriction, offset: 0 })
            this.DeleteProp("__New")
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
     */
    rt : UInt32

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
     */
    res : SRestriction._res

}
