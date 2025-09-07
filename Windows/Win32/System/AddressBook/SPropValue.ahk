#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SBinary.ahk
#Include .\SShortArray.ahk
#Include .\SLongArray.ahk
#Include .\SRealArray.ahk
#Include .\SDoubleArray.ahk
#Include .\SCurrencyArray.ahk
#Include .\SAppTimeArray.ahk
#Include .\SDateTimeArray.ahk
#Include .\SBinaryArray.ahk
#Include .\SLPSTRArray.ahk
#Include .\SWStringArray.ahk
#Include .\SGuidArray.ahk
#Include .\SLargeIntegerArray.ahk
#Include .\__UPV.ahk

/**
 * Describes a MAPI property for Outlook 2013 and Outlook 2016.
 * @remarks
 * The **ulPropTag** member is made up of two parts: 
  *   
  * - An identifier in the high-order 16 bits.
  *     
  * - A type in the low-order 16 bits.
  *     
  * The identifier is a numeric value within a particular range. MAPI defines ranges for identifiers to describe what the property is used for and who is responsible for maintaining it. MAPI defines constraints for each of the property tags that it supports in the Mapitags.h header file.
  *   
  * The type indicates the format for the property's value. MAPI defines constants for each of the property types that it supports in the Mapidefs.h header file. 
  *   
  * For a complete list of the valid property ranges for identifiers and property types, see the [Property Identifiers and Types](property-identifiers-and-types.md) appendix. 
  *   
  * The **dwAlignPad** member is used as padding to make sure proper alignment on computers that require 8-byte alignment for 8-byte values. Developers who write code on such computers should use memory allocation routines that allocate the **SPropValue** arrays on 8-byte boundaries. 
  * 
  * The ``SPropValue::ul`` member has no corresponding MAPI property type, since OLE's VT_UI4 is not mapped to MAPI. For more information, see [MAPI Property Type Overview](mapi-property-type-overview.md) and [Updating MAPI Properties](updating-mapi-properties.md).
  * When the property type of an SPropValue indicates PT_LONG, the active member of the UPV union is generally ``l``, and accessing ``ul`` constitutes undefined behavior per the C standard.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/spropvalue
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SPropValue extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * > Property tag for the property. Property tags are 32-bit unsigned integers consisting of the property's unique identifier in the high-order 16 bits and the property's type in the low-order 16 bits.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Reserved for MAPI; do not use.
     * @type {Integer}
     */
    dwAlignPad {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Union of data values, the specific value dictated by the property type. The following table lists for each property type, the member of the union that should be used and its associated data type.
     *     
     * |**Property type**|**Value**|**Data type of Value**|
     * |:-----|:-----|:-----|
     * |PT_I2 or PT_SHORT  <br/> |**i** <br/> |short int  <br/> |
     * |PT_I4 or PT_LONG  <br/> |**l** <br/> |LONG  <br/> |
     * |-  <br/> |**ul** <br/> |ULONG  <br/> |
     * |PT_R4 or PT_FLOAT  <br/> |**flt** <br/> |float  <br/> |
     * |PT_R8 or PT_DOUBLE  <br/> |**dbl** <br/> |double  <br/> |
     * |PT_BOOLEAN  <br/> |**b** <br/> |unsigned short int  <br/> |
     * |PT_CURRENCY  <br/> |**cur** <br/> |[CURRENCY](currency.md) <br/> |
     * |PT_APPTIME  <br/> |**at** <br/> |double  <br/> |
     * |PT_SYSTIME  <br/> |**ft** <br/> |[FILETIME](filetime.md) <br/> |
     * |PT_STRING8  <br/> |**lpszA** <br/> |LPSTR  <br/> |
     * |PT_BINARY  <br/> |**bin** <br/> |BYTE [array]  <br/> |
     * |PT_UNICODE  <br/> |**lpszW** <br/> |LPWSTR  <br/> |
     * |PT_CLSID  <br/> |**lpguid** <br/> |LPGUID  <br/> |
     * |PT_I8 or PT_LONGLONG  <br/> |**li** <br/> |**LARGE_INTEGER** <br/> |
     * |PT_MV_I2  <br/> |**MVi** <br/> |[SShortArray](sshortarray.md) <br/> |
     * |PT_MV_LONG  <br/> |**MVI** <br/> |[SLongArray](slongarray.md) <br/> |
     * |PT_MV_R4  <br/> |**MVflt** <br/> |[SRealArray](srealarray.md) <br/> |
     * |PT_MV_DOUBLE  <br/> |**MVdbl** <br/> |[SDoubleArray](sdoublearray.md) <br/> |
     * |PT_MV_CURRENCY  <br/> |**MVcur** <br/> |[SCurrencyArray](scurrencyarray.md) <br/> |
     * |PT_MV_APPTIME  <br/> |**MVat** <br/> |[SAppTimeArray](sapptimearray.md) <br/> |
     * |PT_MV_SYSTIME  <br/> |**MVft** <br/> |[SDateTimeArray](sdatetimearray.md) <br/> |
     * |PT_MV_BINARY  <br/> |**MVbin** <br/> |[SBinaryArray](sbinaryarray.md) <br/> |
     * |PT_MV_STRING8  <br/> |**MVszA** <br/> |[SLPSTRArray](slpstrarray.md) <br/> |
     * |PT_MV_UNICODE  <br/> |**MVszW** <br/> |[SWStringArray](swstringarray.md) <br/> |
     * |PT_MV_CLSID  <br/> |**MVguid** <br/> |[SGuidArray](sguidarray.md) <br/> |
     * |PT_MV_I8  <br/> |**MVli** <br/> |[SLargeIntegerArray](slargeintegerarray.md) <br/> |
     * |PT_ERROR  <br/> |**err** <br/> |[SCODE](scode.md) <br/> |
     * |PT_NULL or PT_OBJECT  <br/> |**x** <br/> |LONG  <br/> |
     * |PT_PTR or PT_FILE_HANDLE  <br/> |**lpv** <br/> |VOID \*  <br/> |
     * @type {__UPV}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := __UPV(this.ptr + 8)
            return this.__Value
        }
    }
}
