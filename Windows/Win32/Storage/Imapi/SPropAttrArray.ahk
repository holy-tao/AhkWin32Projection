#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a list of attributes for properties of an object. The SPropAttrArray structure is used by property data objects that implement the IPropData:IMAPIProp interface.
 * @remarks
 * The **SPropAttrArray** structure is used by property data objects that implement the [IPropData : IMAPIProp](ipropdataimapiprop.md) interface. It is also used by MAPI's implementation of [IMAPIMessageSite : IUnknown](imapimessagesiteiunknown.md) that is based on structured storage.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/spropattrarray
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct SPropAttrArray {
    #StructPack 4

    /**
     * > Count of property attributes in the **aPropAttr** member.
     */
    cValues : UInt32

    /**
     * > An array of property attributes. Valid values for attributes are as follows:
     * 
     *   - PROPATTR_MANDATORY
     *   - PROPATTR_READABLE
     *   - PROPATTR_WRITEABLE
     *   - PROPATTR_NOT_PRESENT
     */
    aPropAttr : UInt32[1]

}
