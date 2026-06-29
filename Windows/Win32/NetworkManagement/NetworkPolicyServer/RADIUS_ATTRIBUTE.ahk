#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RADIUS_DATA_TYPE.ahk" { RADIUS_DATA_TYPE }

/**
 * The RADIUS_ATTRIBUTE structure represents a RADIUS attribute or an extended attribute.
 * @see https://learn.microsoft.com/windows/win32/api/authif/ns-authif-radius_attribute
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct RADIUS_ATTRIBUTE {
    #StructPack 8

    /**
     * Stores a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_attribute_type">RADIUS_ATTRIBUTE_TYPE</a> enumeration. This value specifies the type of the attribute represented by the 
     * <b>RADIUS_ATTRIBUTE</b> structure.
     */
    dwAttrType : UInt32

    /**
     * Stores a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_data_type">RADIUS_DATA_TYPE</a> enumeration. This value specifies the type of the value stored in the union that contains the <b>dwValue</b> and <b>lpValue</b> members.
     */
    fDataType : RADIUS_DATA_TYPE

    /**
     * Stores the length, in bytes, of the data. The <b>cbDataLength</b> member is used only if <b>lpValue</b> member is used.
     */
    cbDataLength : UInt32

    dwValue : UInt32

    static __New() {
        DefineProp(this.Prototype, 'lpValue', { type: IntPtr, offset: 16 })
        this.DeleteProp("__New")
    }
}
