#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a new attribute value for a topology node.
 * @remarks
 * 
  * Due to an error in the structure declaration, the <b>u64</b> member is declared as a 32-bit integer, not a 64-bit integer. Therefore, any 64-bit value passed to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynodeattributeeditor-updatenodeattributes">IMFTopologyNodeAttributeEditor::UpdateNodeAttributes</a> method is truncated to 32 bits.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-mftoponode_attribute_update
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFTOPONODE_ATTRIBUTE_UPDATE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The identifier of the topology node to update. To get the identifier of a topology node, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-gettoponodeid">IMFTopologyNode::GetTopoNodeID</a>.
     * @type {Integer}
     */
    NodeId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * GUID that specifies the attribute to update.
     * @type {Pointer<Guid>}
     */
    guidAttributeKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Attribute type, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_type">MF_ATTRIBUTE_TYPE</a> enumeration.
     * @type {Integer}
     */
    attrType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    u32 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    u64 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Float}
     */
    d {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
