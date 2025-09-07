#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * Represents the data structure used for the CF_OBJECTDESRIPTOR and CF_LINKSRCDESCRIPTOR file formats.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ns-oleidl-objectdescriptor
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OBJECTDESCRIPTOR extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The CLSID of the object being transferred. The clsid is used to obtain the icon for the <b>Display As Icon</b> option in the <b>Paste Special</b> dialog box and is applicable only if the Embed Source or Embedded Object formats are offered. If neither is offered, the value of clsid should be CLSID_NULL. The clsid can be retrieved by the source by loading the object and calling the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getuserclassid">IOleObject::GetUserClassID</a> method. Note that for link objects, this value is not the same as the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">IPersist::GetClassID</a> method.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The display aspect of the object. Typically, this value is DVASPECT_CONTENT or DVASPECT_ICON. If the source application did not draw the object originally, the <b>dwDrawAspect</b> field contains a zero value (which is not the same as DVASPECT_CONTENT). For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>.
     * @type {Integer}
     */
    dwDrawAspect {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The true extent of the object (without cropping or scaling) in <b>HIMETRIC</b> units. Setting this field is optional. The value can be (0,0) for applications that do not draw the object being transferred. This field is used primarily by targets of drag-and-drop operations, so they can give appropriate feedback to the user.
     * @type {SIZE}
     */
    sizel{
        get {
            if(!this.HasProp("__sizel"))
                this.__sizel := SIZE(this.ptr + 24)
            return this.__sizel
        }
    }

    /**
     * The offset in <b>HIMETRIC</b> units from the upper-left corner of the object where a drag-and-drop operation was initiated. This field is only meaningful for a drag-and-drop transfer operation since it corresponds to the point where the mouse was clicked to initiate the drag-and-drop operation. The value is (0,0) for other transfer situations, such as a clipboard copy and paste.
     * @type {POINTL}
     */
    pointl{
        get {
            if(!this.HasProp("__pointl"))
                this.__pointl := POINTL(this.ptr + 32)
            return this.__pointl
        }
    }

    /**
     * The copy of the status flags for the object. These flags are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olemisc">OLEMISC</a> enumeration. If an embedded object is being transferred, they are returned by calling the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getmiscstatus">IOleObject::GetMiscStatus</a> method.
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The offset for finding the full user type name of the object being transferred. It specifies the offset, in bytes, from the beginning of the <b>OBJECTDESCRIPTOR</b> data structure to the null-terminated string that specifies the full user type name of the object being transferred. The value is zero if the string is not present. This string is used by the destination of a data transfer to create labels in the <b>Paste Special</b> dialog box. The destination application must be able to handle the cases when this string is omitted.
     * @type {Integer}
     */
    dwFullUserTypeName {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The offset, in bytes, from the beginning of the data structure to the null-terminated string that specifies the source of the transfer. The <b>dwSrcOfCopy</b> member is typically implemented as the display name of the temporary moniker that identifies the data source. The value for <b>dwSrcOfCopy</b> is displayed in the Source line of the <b>Paste Special</b> dialog box. A zero value indicates that the string is not present. If <b>dwSrcOfCopy</b> is zero, the string "Unknown Source" is displayed in the <b>Paste Special</b> dialog box.
     * @type {Integer}
     */
    dwSrcOfCopy {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
