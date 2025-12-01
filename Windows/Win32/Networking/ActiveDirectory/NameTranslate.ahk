#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IADsNameTranslateinterface translates distinguished names (DNs) among various formats as defined in the ADS_NAME_TYPE_ENUM enumeration. The feature is available to objects in Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsnametranslate
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class NameTranslate extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
