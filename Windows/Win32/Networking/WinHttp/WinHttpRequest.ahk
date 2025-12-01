#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This topic provides information about using the WinHTTP WinHttpRequest COM object with scripting languages.
 * @remarks
 * The **WinHttpRequest** object has these types of members:
 * 
 * -   [Events](#events)
 * -   [Methods](#methods)
 * -   [Properties](#properties)
 * 
 * 
 * The **WinHttpRequest** object uses the [**IErrorInfo**](/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo) interface to provide error data. A description and numerical error value can be obtained with the [Err](/previous-versions//sbf5ze0e(v=vs.85)) object in Microsoft Visual Basic Scripting Edition (VBScript), and the [Error](https://msdn.microsoft.com/library/dww52sbt.aspx) object in Microsoft JScript. The lower 16 bits of an error number correspond to the values found in [**Error Messages**](error-messages.md).
 * 
 * > [!Note]  
 * > For Windows XP and Windows 2000, see [Run-Time Requirements](winhttp-start-page.md).
 * @see https://learn.microsoft.com/windows/win32/WinHttp/winhttprequest
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WinHttpRequest extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
