#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\STREAMBUFFER_ATTR_DATATYPE.ahk" { STREAMBUFFER_ATTR_DATATYPE }

/**
 * This topic applies only to Windows XP Service Pack 1 or later. The STREAMBUFFER_ATTRIBUTE structure describes an attribute on a stream buffer file.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/ns-sbe-streambuffer_attribute
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct STREAMBUFFER_ATTRIBUTE {
    #StructPack 8

    /**
     * Pointer to a null-terminated wide-character string that contains the name of the attribute.
     */
    pszName : PWSTR

    /**
     * Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ne-sbe-streambuffer_attr_datatype">STREAMBUFFER_ATTR_DATATYPE</a> enumeration. The value indicates the data type that you should use to interpret the attribute data, which is contained in the <b>pbAttribute</b> member.
     */
    StreamBufferAttributeType : STREAMBUFFER_ATTR_DATATYPE

    /**
     * Pointer to a buffer that contains the attribute data.
     */
    pbAttribute : IntPtr

    /**
     * The size of the buffer given in <b>pbAttribute</b>, in bytes.
     */
    cbLength : UInt16

}
