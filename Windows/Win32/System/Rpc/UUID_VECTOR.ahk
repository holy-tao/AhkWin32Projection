#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The UUID_VECTOR structure contains a list of UUIDs.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> vector contains a count member containing the total number of <b>UUID</b>s in the vector, followed by an array of pointers to <b>UUID</b>s.
 * 
 * An application constructs a <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a> vector to contain object <b>UUID</b>s to be exported or unexported from the name service.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-uuid_vector
 * @namespace Windows.Win32.System.Rpc
 */
export default struct UUID_VECTOR {
    #StructPack 8

    /**
     * Number of <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>s present in the array <b>Uuid</b>.
     */
    Count : UInt32

    /**
     * Array of pointers to <a href="https://docs.microsoft.com/windows/win32/rpc/rpcdce/ns-rpcdce-uuid">UUID</a>s that contains <b>Count</b> elements.
     */
    Uuid : Guid.Ptr[1]

}
