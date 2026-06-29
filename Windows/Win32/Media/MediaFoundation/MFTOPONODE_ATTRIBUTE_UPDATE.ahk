#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MF_ATTRIBUTE_TYPE.ahk" { MF_ATTRIBUTE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies a new attribute value for a topology node.
 * @remarks
 * Due to an error in the structure declaration, the <b>u64</b> member is declared as a 32-bit integer, not a 64-bit integer. Therefore, any 64-bit value passed to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynodeattributeeditor-updatenodeattributes">IMFTopologyNodeAttributeEditor::UpdateNodeAttributes</a> method is truncated to 32 bits.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mftoponode_attribute_update
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFTOPONODE_ATTRIBUTE_UPDATE {
    #StructPack 8

    /**
     * The identifier of the topology node to update. To get the identifier of a topology node, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-gettoponodeid">IMFTopologyNode::GetTopoNodeID</a>.
     */
    NodeId : Int64

    /**
     * GUID that specifies the attribute to update.
     */
    guidAttributeKey : Guid

    /**
     * Attribute type, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_type">MF_ATTRIBUTE_TYPE</a> enumeration.
     */
    attrType : MF_ATTRIBUTE_TYPE

    u32 : UInt32

    static __New() {
        DefineProp(this.Prototype, 'u64', { type: Int64, offset: 32 })
        DefineProp(this.Prototype, 'd', { type: Float64, offset: 32 })
        this.DeleteProp("__New")
    }
}
