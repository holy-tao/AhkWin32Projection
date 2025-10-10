#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents context parameters that are used as input for the CLUSCTL_RESOURCE_GET_OPERATION_CONTEXT control code.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-get_operation_context_params
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class GET_OPERATION_CONTEXT_PARAMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The version of this structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ne-resapi-resdll_context_operation_type">RESDLL_CONTEXT_OPERATION_TYPE</a> enumeration value that specifies the context operation type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * TBD
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
