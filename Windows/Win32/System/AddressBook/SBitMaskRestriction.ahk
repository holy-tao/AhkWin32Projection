#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a bitmask restriction, which is used to perform a bitwise AND operation and test the result.
 * @remarks
 * The **SBitMaskRestriction** structure performs a bitwise **AND** operation using the bitmask described in the **ulMask** member and the value of the property described by the **ulPropTag** member. If the result is zero, BMR_EQZ is satisfied. If it is nonzero, that is, if the property value has at least one of the same bits set as **ulMask**, then BMR_NEZ is satisfied.
 *   
 * For more information about the **SBitMaskRestriction** structure and restrictions in general, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sbitmaskrestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SBitMaskRestriction extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * > Relational operator that describes how the mask specified in the **ulMask** member should be applied to the property tag. Possible values are as follows: 
     *     
     * BMR_EQZ 
     *   
     * > Perform a bitwise **AND** operation of the mask in the **ulMask** member with the property represented by the **ulPropTag** member and test for being equal to zero. 
     *     
     * BMR_NEZ 
     *   
     * > Perform a bitwise **AND** operation of the mask in the **ulMask** member with the property represented by the **ulPropTag** member and test for being not equal to zero.
     * @type {Integer}
     */
    relBMR {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Property tag of the property to which the bitmask is applied.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Bitmask to apply to the property identified by **ulPropTag**.
     * @type {Integer}
     */
    ulMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
