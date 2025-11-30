#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies why the marshaling is to be done.
 * @see https://docs.microsoft.com/windows/win32/api//wtypesbase/ne-wtypesbase-mshlflags
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class MSHLFLAGS extends Win32Enum{

    /**
     * The marshaling is occurring because an interface pointer is being passed from one process to another. This is the normal case. The data packet produced by the marshaling process will be unmarshaled in the destination process. The marshaled data packet can be unmarshaled just once, or not at all. If the receiver unmarshals the data packet successfully, the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreleasemarshaldata">CoReleaseMarshalData</a> function is automatically called on the data packet as part of the unmarshaling process. If the receiver does not or cannot unmarshal the data packet, the sender must call <b>CoReleaseMarshalData</b> on the data packet.
     * @type {Integer (Int32)}
     */
    static MSHLFLAGS_NORMAL => 0

    /**
     * The marshaling is occurring because the data packet is to be stored in a globally accessible table from which it can be unmarshaled one or more times, or not at all. The presence of the data packet in the table counts as a strong reference to the interface being marshaled, meaning that it is sufficient to keep the object alive. When the data packet is removed from the table, the table implementer must call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreleasemarshaldata">CoReleaseMarshalData</a> function on the data packet.
     * 
     * MSHLFLAGS_TABLESTRONG is used by the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-registerdragdrop">RegisterDragDrop</a> function when registering a window as a drop target. This keeps the window registered as a drop target no matter how many times the end user drags across the window. The <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-revokedragdrop">RevokeDragDrop</a> function calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreleasemarshaldata">CoReleaseMarshalData</a>.
     * @type {Integer (Int32)}
     */
    static MSHLFLAGS_TABLESTRONG => 1

    /**
     * The marshaling is occurring because the data packet is to be stored in a globally accessible table from which it can be unmarshaled one or more times, or not at all. However, the presence of the data packet in the table acts as a weak reference to the interface being marshaled, meaning that it is not sufficient to keep the object alive. When the data packet is removed from the table, the table implementer must call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreleasemarshaldata">CoReleaseMarshalData</a> function on the data packet. 
     * 
     * MSHLFLAGS_TABLEWEAK is typically used when registering an object in the running object table (ROT). This prevents the object's entry in the ROT from keeping the object alive in the absence of any other connections. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a> for more information.
     * @type {Integer (Int32)}
     */
    static MSHLFLAGS_TABLEWEAK => 2

    /**
     * Adding this flag to an original object marshaling (as opposed to marshaling a proxy) will disable the ping protocol for that object.
     * @type {Integer (Int32)}
     */
    static MSHLFLAGS_NOPING => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MSHLFLAGS_RESERVED1 => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MSHLFLAGS_RESERVED2 => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MSHLFLAGS_RESERVED3 => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MSHLFLAGS_RESERVED4 => 64
}
