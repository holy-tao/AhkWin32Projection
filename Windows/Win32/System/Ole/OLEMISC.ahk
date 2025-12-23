#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes miscellaneous characteristics of an object or class of objects.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-olemisc
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLEMISC extends Win32Enum{

    /**
     * When the container resizes the space allocated to displaying one of the object's presentations, the object wants to recompose the presentation. This means that on resize, the object wants to do more than scale its picture. If this bit is set, the container should force the object to the running state and call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setextent">IOleObject::SetExtent</a> with the new size.
     * @type {Integer (Int32)}
     */
    static OLEMISC_RECOMPOSEONRESIZE => 1

    /**
     * The object has no useful content view other than its icon. From the user's perspective, the <b>Display As Icon</b> check box (in the <b>Paste Special</b> dialog box) for this object should always be checked, and should not be uncheckable. Note that such an object should still have a drawable content aspect; it will look the same as its icon view.
     * @type {Integer (Int32)}
     */
    static OLEMISC_ONLYICONIC => 2

    /**
     * The object has initialized itself from the data in the container's current selection. Containers should examine this bit after calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-initfromdata">IOleObject::InitFromData</a> to initialize an object from the current selection. If set, the container should insert the object beside the current selection rather than replacing the current selection. If this bit is not set, the object being inserted replaces the current selection.
     * @type {Integer (Int32)}
     */
    static OLEMISC_INSERTNOTREPLACE => 4

    /**
     * This object is a static object, which is an object that contains only a presentation; it contains no native data. See <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatestaticfromdata">OleCreateStaticFromData</a>.
     * @type {Integer (Int32)}
     */
    static OLEMISC_STATIC => 8

    /**
     * This object cannot be the link source that when bound to activates (runs) the object. If the object is selected and copied to the clipboard, the object's container can offer a link in a clipboard data transfer that, when bound, must connect to the outside of the object. The user would see the object selected in its container, not open for editing. Rather than doing this, the container can simply refuse to offer a link source when transferring objects with this bit set. Examples of objects that have this bit set include OLE1 objects, static objects, and links.
     * @type {Integer (Int32)}
     */
    static OLEMISC_CANTLINKINSIDE => 16

    /**
     * This object can be linked to by OLE 1 containers. This bit is used in the <b>dwStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-objectdescriptor">OBJECTDESCRIPTOR</a> structure transferred with the Object and Link Source Descriptor formats. An object can be linked to by OLE 1 containers if it is an untitled document, a file, or a selection of data within a file. Embedded objects or pseudo-objects that are contained within an embedded object cannot be linked to by OLE 1 containers (i.e., OLE 1 containers cannot link to link sources that, when bound, require more than one object server to be run.
     * @type {Integer (Int32)}
     */
    static OLEMISC_CANLINKBYOLE1 => 32

    /**
     * This object is a link object. This bit is significant to OLE 1 and is set by the OLE 2 link object; object applications have no need to set this bit.
     * @type {Integer (Int32)}
     */
    static OLEMISC_ISLINKOBJECT => 64

    /**
     * This object is capable of activating in-place, without requiring installation of menus and toolbars to run. Several such objects can be active concurrently. Some containers, such as forms, may choose to activate such objects automatically.
     * @type {Integer (Int32)}
     */
    static OLEMISC_INSIDEOUT => 128

    /**
     * This bit is set only when OLEMISC_INSIDEOUT is set, and indicates that this object prefers to be activated whenever it is visible. Some containers may always ignore this hint.
     * @type {Integer (Int32)}
     */
    static OLEMISC_ACTIVATEWHENVISIBLE => 256

    /**
     * This object does not pay any attention to target devices. Its presentation data will be the same in all cases.
     * @type {Integer (Int32)}
     */
    static OLEMISC_RENDERINGISDEVICEINDEPENDENT => 512

    /**
     * This value is used with controls. It indicates that the control has no run-time user interface, but that it should be visible at design time. For example, a timer control that fires a specific event periodically would not show itself at run time, but it needs a design-time user interface so a form designer can set the event period and other properties.
     * @type {Integer (Int32)}
     */
    static OLEMISC_INVISIBLEATRUNTIME => 1024

    /**
     * This value is used with controls. It tells the container that this control always wants to be running. As a result, the container should call <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olerun">OleRun</a> when loading or creating the object.
     * @type {Integer (Int32)}
     */
    static OLEMISC_ALWAYSRUN => 2048

    /**
     * This value is used with controls. It indicates that the control is buttonlike in that it understands and obeys the container's DisplayAsDefault ambient property.
     * @type {Integer (Int32)}
     */
    static OLEMISC_ACTSLIKEBUTTON => 4096

    /**
     * This value is used with controls. It marks the control as a label for whatever control comes after it in the form's ordering. Pressing a mnemonic key for a label control activates the control after it.
     * @type {Integer (Int32)}
     */
    static OLEMISC_ACTSLIKELABEL => 8192

    /**
     * This value is used with controls. It indicates that the control has no UI active state, meaning that it requires no in-place tools, no shared menu, and no accelerators. It also means that the control never needs the focus.
     * @type {Integer (Int32)}
     */
    static OLEMISC_NOUIACTIVATE => 16384

    /**
     * This value is used with controls. It indicates that the control understands how to align itself within its display rectangle, according to alignment properties such as left, center, and right.
     * @type {Integer (Int32)}
     */
    static OLEMISC_ALIGNABLE => 32768

    /**
     * This value is used with controls. It indicates that the control is a simple grouping of other controls and does little more than pass Windows messages to the control container managing the form. Controls of this sort require the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-isimpleframesite">ISimpleFrameSite</a> on the container's site.
     * @type {Integer (Int32)}
     */
    static OLEMISC_SIMPLEFRAME => 65536

    /**
     * This value is used with controls. It indicates that the control wants to use <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a> as its initialization function, even before a call such as <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-initnew">IPersistStreamInit::InitNew</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-initnew">IPersistStorage::InitNew</a>. This allows the control to access a container's ambient properties before loading information from persistent storage. Note that the current implementations of <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreate">OleCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatefromdata">OleCreateFromData</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreatefromfile">OleCreateFromFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleload">OleLoad</a>, and the default handler do not understand this value. Control containers that wish to honor this value must currently implement their own versions of these functions in order to establish the correct initialization sequence for the control.
     * @type {Integer (Int32)}
     */
    static OLEMISC_SETCLIENTSITEFIRST => 131072

    /**
     * Obsolete. A control that works with an Input Method Editor (IME) system component can control the state of the IME through the IMEMode property rather than using this value in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olemisc">OLEMISC</a> enumeration. You can use an IME component to enter information in Asian character sets with a regular keyboard. A Japanese IME, for example, allows you to type a word such as "sushi," on a regular keyboard and when you hit the spacebar, the IME component converts that word to appropriate kanji or proposes possible choices. The OLEMISC_IMEMODE value was previously used to mark a control as capable of controlling an IME mode system component.
     * @type {Integer (Int32)}
     */
    static OLEMISC_IMEMODE => 262144

    /**
     * For new ActiveX controls to work in an older container, the control may need to have the OLEMISC_ACTIVATEWHENVISIBLE value set. However, in a newer container that understands and uses IPointerInactive, the control does not wish to be in-place activated when it becomes visible. To allow the control to work in both kinds of containers, the control can set this value. Then, the container ignores OLEMISC_ACTIVATEWHENVISIBLE and does not in-place activate the control when it becomes visible.
     * @type {Integer (Int32)}
     */
    static OLEMISC_IGNOREACTIVATEWHENVISIBLE => 524288

    /**
     * A control that can merge its menu with its container sets this value.
     * @type {Integer (Int32)}
     */
    static OLEMISC_WANTSTOMENUMERGE => 1048576

    /**
     * A control that supports multi-level undo sets this value.
     * @type {Integer (Int32)}
     */
    static OLEMISC_SUPPORTSMULTILEVELUNDO => 2097152
}
