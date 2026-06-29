#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SL_ACTIVATION_TYPE.ahk" { SL_ACTIVATION_TYPE }

/**
 * Specifies the product activation information.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ns-slpublic-sl_activation_info_header
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SL_ACTIVATION_INFO_HEADER {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>SL_ACTIVATION_TYPE</b>
     * 
     * The activation type.
     */
    type : SL_ACTIVATION_TYPE

}
