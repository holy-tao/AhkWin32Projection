#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The WM_STREAM_TYPE_INFO structure is used as the data item for the WM/StreamTypeInfo complex metadata attribute. It stores the major type and the size of the associated format data.
 * @remarks
 * None.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_stream_type_info
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_STREAM_TYPE_INFO {
    #StructPack 4

    /**
     * The major type of the stream.
     */
    guidMajorType : Guid

    /**
     * The size of format in bytes.
     */
    cbFormat : UInt32

}
