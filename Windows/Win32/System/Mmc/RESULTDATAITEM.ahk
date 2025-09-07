#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The RESULTDATAITEM structure specifies or receives the attributes of result items in the result pane of the snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-resultdataitem
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class RESULTDATAITEM extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A set of flags that specifies attributes of this data structure, or  an operation  that uses  this structure.
     * 
     * The following flags specify the members of the 
     * <b>RESULTDATAITEM</b> structure that  contain valid data, or need to be filled in with data. One or more of the flags can be set.
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>TRUE</b> if the <b>lParam</b> member refers to a scope item. <b>FALSE</b> if the <b>lParam</b> member refers to a result item.
     * @type {Integer}
     */
    bScopeItem {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A value that specifies a console-supplied unique item identifier for the result item. This value is used to identify an item in the result pane  of  calls to  some  
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultdata">IResultData</a> interface methods.
     * 
     * After the snap-in successfully inserts an item in the scope pane (by using <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-insertitem">IResultData::InsertItem</a>), the <b>itemID</b> member of the 
     * <b>RESULTDATAITEM</b> structure contains the <b>HRESULTITEM</b> handle of the newly inserted item. This handle is the unique identifier for the result item.
     * 
     * The snap-in should store this value  to  manipulate  (later) the inserted item by calling methods such as <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-getitem">IResultData::GetItem</a>. If this value is not stored, it can be looked up  by using <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-finditembylparam">IResultData::FindItemByLParam</a>.
     * @type {Pointer}
     */
    itemID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A value that specifies the zero-based index of the item to which this structure refers.
     * @type {Integer}
     */
    nIndex {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A value that specifies the column on which an operation is to be performed.  If the operation is to be performed on an item  and not  a  column, the value is zero (0).
     * @type {Integer}
     */
    nCol {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A pointer to a null-terminated string that contains the item text if the structure specifies the <b>RDI_STR</b> item attribute. If this member is the <b>MMC_CALLBACK</b> value, the item is a callback item.
     * 
     * Be aware that the snap-in can use <b>MMC_TEXTCALLBACK</b> instead of <b>MMC_CALLBACK</b>. The <b>MMC_TEXTCALLBACK</b> value is a type-correct (no casting necessary) version of <b>MMC_CALLBACK</b>.
     * 
     * <b>MMC_TEXTCALLBACK</b> is introduced in MMC version 1.2.
     * @type {PWSTR}
     */
    str{
        get {
            if(!this.HasProp("__str"))
                this.__str := PWSTR(this.ptr + 24)
            return this.__str
        }
    }

    /**
     * Virtual image index of the list view item's icon in the large  and small icon image lists. Be aware that the virtual image index is  mapped  internally to the actual index. This member can also be specified as a callback item: <b>MMC_CALLBACK</b> or <b>MMC_IMAGECALLBACK</b>. The <b>MMC_IMAGECALLBACK</b> value is a type-correct (no casting necessary) version of <b>MMC_CALLBACK</b>.
     * 
     * <b>MMC_IMAGECALLBACK</b> is introduced in MMC version 1.2.
     * @type {Integer}
     */
    nImage {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    nState {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A value that specifies a user-supplied 32-bit value to associate with the item. This item, also called a cookie, is the value that is passed as the first parameter to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-querydataobject">IComponent::QueryDataObject</a>.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    iIndent {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
