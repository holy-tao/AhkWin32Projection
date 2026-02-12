#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets a value that indicates whether the Business Rule (BizRule) allows the user to perform the requested task.
 * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazbizrulecontext-put_businessruleresult
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AzBizRuleContext extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
