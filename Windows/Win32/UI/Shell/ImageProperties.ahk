#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the specified properties associated with the item.
 * @remarks
 * In JavaScript, use [then](/previous-versions/windows/apps/br229728(v=win.10)) or [done](/previous-versions/windows/apps/hh701079(v=win.10)) to specify handler functions that will capture and process the collection when it is returned.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.imageproperties.retrievepropertiesasync
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ImageProperties extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
