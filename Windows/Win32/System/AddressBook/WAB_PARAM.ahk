#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Do not use. Contains the input information to pass to WABOpen.
 * @see https://learn.microsoft.com/windows/win32/api/wabapi/ns-wabapi-wab_param
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct WAB_PARAM {
    #StructPack 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies the size of the <b>WAB_PARAM</b> structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HWND</b>
     * 
     * Value of type <b>HWND</b> that specifies the window handle of the calling client application. Can be <b>NULL</b>.
     */
    hwnd : HWND

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Value of type <b>LPTSTR</b> that specifies the WAB file name to open. If this parameter is <b>NULL</b>, the default Address Book file is opened.
     */
    szFileName : PSTR

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies flags that control the behavior of WAB functionality. Available only on Internet Explorer 4.0 or later.
     */
    ulFlags : UInt32

    /**
     * Type: <b>GUID</b>
     * 
     * Value of type <b>GUID</b> that specifies the GUID that identifies the calling application's property sheet extensions. The GUID can be used to determine whether the extension property sheets are displayed or not. Available only on Internet Explorer 5 or later.
     */
    guidPSExt : Guid

}
