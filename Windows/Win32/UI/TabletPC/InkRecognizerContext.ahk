#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/tablet/inkrecognizercontext-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecognizerContext extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
