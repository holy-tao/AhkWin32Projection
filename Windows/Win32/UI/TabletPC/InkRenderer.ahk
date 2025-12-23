#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the management of mappings from ink to the display window. Use the InkRenderer object to display ink in a window. You can also use it to reposition and resize stroke.
 * @remarks
 * Printing is also done through the **InkRenderer** object.
 * 
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) method in C++.
 * @see https://learn.microsoft.com/windows/win32/tablet/inkrenderer-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRenderer extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
