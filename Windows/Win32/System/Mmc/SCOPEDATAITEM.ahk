#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SCOPEDATAITEM structure specifies items to be inserted into the scope pane.
 * @remarks
 * 
 * It is not valid to insert an item as a sibling of the static node. If a snap-in sets the <b>relativeID</b> member to the <b>HSCOPEITEM</b> of the static node, sets  the <b>SDI_PREVIOUS</b> or <b>SDI_NEXT</b> flags, and then calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-insertitem">IConsoleNameSpace2::InsertItem</a>, MMC  returns  <b>E_INVALIDARG</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-scopedataitem
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SCOPEDATAITEM extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A value that specifies an array of flags  that indicate  which members of the structure contain valid data. When this structure is used in the
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>MMC_CALLBACK</b> value or a pointer to a null-terminated string, which depends on how the structure is being used.
     * 
     * <ul>
     * <li>When an item is inserted  by using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-insertitem">IConsoleNameSpace2::InsertItem</a>, this member must be set to <b>MMC_CALLBACK</b>.</li>
     * <li>When the name of an item inserted by the snap-in is changed  by using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-setitem">IConsoleNameSpace2::SetItem</a>, this member must be set to <b>MMC_CALLBACK</b>.</li>
     * <li>When the name of the static node (an item  that the console inserts) is changed, this member can  be set to <b>MMC_CALLBACK</b>, or be a pointer to the null-terminated string that contains the item text.</li>
     * </ul>
     * Be aware that the snap-in can use <b>MMC_TEXTCALLBACK</b> instead of <b>MMC_CALLBACK</b>. The <b>MMC_TEXTCALLBACK</b> value is a type-correct (no casting necessary) version of <b>MMC_CALLBACK</b>.
     * 
     * <b>MMC_TEXTCALLBACK</b> is introduced in MMC version 1.2.
     * @type {PWSTR}
     */
    displayname {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Virtual image index in the image list when the item is in the nonselected state. Be aware that the virtual image index is mapped internally to the actual index. This member can also be specified as a callback item: <b>MMC_CALLBACK</b> or <b>MMC_IMAGECALLBACK</b>. The <b>MMC_IMAGECALLBACK</b> is a type-correct (no casting necessary) version of <b>MMC_CALLBACK</b>.
     * 
     * <b>MMC_IMAGECALLBACK</b> is introduced in MMC version 1.2.
     * @type {Integer}
     */
    nImage {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Virtual image index in the image list when the item is in the selected state. Be aware that the virtual image index is mapped internally to the actual index. The item is like a folder in Microsoft Windows Explorer. The icon is for an open folder.
     * @type {Integer}
     */
    nOpenImage {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A value that specifies the state mask for the item. For <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-getitem">IConsoleNameSpace2::GetItem</a>, this member returns <b>MMC_SCOPE_ITEM_STATE_EXPANDEDONCE</b> if the item has been expanded at least  one time,  or 0 (zero) if the item has not been expanded.
     * 
     * This member is ignored for <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-insertitem">IConsoleNameSpace2::InsertItem</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-setitem">IConsoleNameSpace2::SetItem</a>.
     * @type {Integer}
     */
    nState {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A value that specifies the number of enumerated items.
     * 
     * When a snap-in inserts a scope item, it should set the <b>cChildren</b> field to  0 (zero),  and set the <b>SDI_CHILDREN</b> flag if both of the following conditions are met:
     * 
     * <ul>
     * <li>The snap-in does not have any child items to add under the inserted item.</li>
     * <li>The snap-in does not dynamically enable any namespace extension snap-ins for this item.</li>
     * </ul>
     * Otherwise, when inserting a scope item, the <b>cChildren</b> field should be set to 1 (one), or not set at all.
     * 
     * If conditions change at a later time, the snap-in can modify the <b>cChildren</b> field  by using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-setitem">IConsoleNameSpace2::SetItem</a>.
     * 
     * If  it  will take a significant amount of time to determine the number of children, the snap-in should use a best guess at insertion time, and make the actual determination on another thread so the MMC user interface will not be locked out. 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-setitem">IConsoleNameSpace2::SetItem</a> can be used to correct the setting if necessary.
     * 
     * When MMC detects a scope item with a <b>cChildren</b> count of 0 (zero), it  checks for   namespace extensions  that have been statically enabled for the item  by the user or  the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-irequiredextensions">IRequiredExtensions</a> interface. If none are enabled, the plus (+) sign  is  removed from the item.
     * 
     * After an item  is  expanded, the state of the plus sign  is  determined by the actual number of child items present.
     * @type {Integer}
     */
    cChildren {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * A value that specifies a user-supplied 32-bit value to associate with the item. This item, also called a cookie, is the value that is passed as the first parameter to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponentdata-querydataobject">IComponentData::QueryDataObject</a>.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A console-supplied unique item identifier. An item is inserted at a position relative to the item  that  this member specifies. The  <b>mask</b> settings determine the  relative position.
     * 
     * To determine how <b>relativeID</b> is interpreted, specify one of the following constants as the <b>mask</b> member.
     * @type {Pointer}
     */
    relativeID {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A value that specifies a console-supplied unique identifier for the scope item. This value is used to identify an item in the scope pane  of  calls to  some  of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole2">IConsole2</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsolenamespace2">IConsoleNameSpace2</a> interface methods.
     * 
     * After the snap-in successfully inserts an item into the scope pane (by using <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-insertitem">IConsoleNameSpace2::InsertItem</a>), the 
     * <b>ID</b> member of the 
     * <b>SCOPEDATAITEM</b> structure contains the <b>HSCOPEITEM</b> handle of the newly inserted item. This handle is the unique identifier for the scope item.
     * 
     * For a  static node, MMC  inserts  an item  into the  scope pane  of the snap-in. Then  MMC  passes the  <b>HSCOPEITEM</b>  of the  static node  to the snap-in as the <i>param</i> parameter in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a> notification.
     * 
     * Be aware that snap-ins should store the <b>HSCOPEITEM</b> of each inserted item and use it  later  to  manipulate the item  by using the methods of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole2">IConsole2</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsolenamespace2">IConsoleNameSpace2</a> interfaces.
     * @type {Pointer}
     */
    ID {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
