#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a Microsoft-extended property.
 * @remarks
 * The **ExtendedProperty** object has these types of members:
  * 
  * -   [Properties](#properties)
  * 
  * 
  * The **ExtendedProperty** object is used by the [**ExtendedProperties**](extendedproperties.md) collection.
  * 
  * The **ExtendedProperty** object can be created, and it is not safe for scripting. The ProgID for the **ExtendedProperty** object is CAPICOM.ExtendedProperty.1.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/extendedproperty
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ExtendedProperty extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<BSTR>}
     */
    PropertyName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    PropertyValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
