#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The TF_PERSISTENT_PROPERTY_HEADER_ACP structure is used to provide property header data.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_persistent_property_header_acp
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_PERSISTENT_PROPERTY_HEADER_ACP {
    #StructPack 4

    /**
     * Contains a GUID that identifies the property.
     */
    guidType : Guid

    /**
     * Contains the starting character position of the property.
     */
    ichStart : Int32

    /**
     * Contains the number of characters that the property spans.
     */
    cch : Int32

    /**
     * Contains the size, in bytes, of the property value.
     */
    cb : UInt32

    /**
     * Contains a <b>DWORD</b> value defined by the property owner.
     */
    dwPrivate : UInt32

    /**
     * Contains the CLSID of the property owner.
     */
    clsidTIP : Guid

}
