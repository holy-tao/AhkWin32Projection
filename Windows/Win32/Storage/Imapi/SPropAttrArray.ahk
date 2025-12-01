#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of attributes for properties of an object. The SPropAttrArray structure is used by property data objects that implement the IPropData:IMAPIProp interface.
 * @remarks
 * The **SPropAttrArray** structure is used by property data objects that implement the [IPropData : IMAPIProp](ipropdataimapiprop.md) interface. It is also used by MAPI's implementation of [IMAPIMessageSite : IUnknown](imapimessagesiteiunknown.md) that is based on structured storage.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/spropattrarray
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class SPropAttrArray extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * > Count of property attributes in the **aPropAttr** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > An array of property attributes. Valid values for attributes are as follows:
     * 
     *   - PROPATTR_MANDATORY
     *   - PROPATTR_READABLE
     *   - PROPATTR_WRITEABLE
     *   - PROPATTR_NOT_PRESENT
     * @type {Array<UInt32>}
     */
    aPropAttr{
        get {
            if(!this.HasProp("__aPropAttrProxyArray"))
                this.__aPropAttrProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__aPropAttrProxyArray
        }
    }
}
