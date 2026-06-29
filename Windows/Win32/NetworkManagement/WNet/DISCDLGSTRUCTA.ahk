#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\DISCDLGSTRUCT_FLAGS.ahk" { DISCDLGSTRUCT_FLAGS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used in the WNetDisconnectDialog1 function. The structure contains required information for the disconnect attempt. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winnetwk.h header defines DISCDLGSTRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-discdlgstructa
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @charset ANSI
 */
export default struct DISCDLGSTRUCTA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the 
     * <b>DISCDLGSTRUCT</b> structure. The caller must supply this value.
     */
    cbStructure : UInt32

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the owner window of the dialog box.
     */
    hwndOwner : HWND

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated  string that specifies the local device name that is redirected to the network resource, such as "F:" or "LPT1".
     */
    lpLocalName : PSTR

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated  string that specifies the name of the network resource to disconnect. This member can be NULL if the <b>lpLocalName</b> member is specified. When <b>lpLocalName</b> is specified, the connection to the network resource redirected from <b>lpLocalName</b>  is disconnected.
     */
    lpRemoteName : PSTR

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : DISCDLGSTRUCT_FLAGS

}
