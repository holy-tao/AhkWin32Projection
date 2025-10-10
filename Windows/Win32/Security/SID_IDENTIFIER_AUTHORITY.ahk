#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the top-level authority of a security identifier (SID).
 * @remarks
 * 
  * The identifier authority value identifies the agency that issued the SID. The following identifier authorities are predefined.
  * 
  * <table>
  * <tr>
  * <th>Identifier authority</th>
  * <th>Value</th>
  * </tr>
  * <tr>
  * <td>SECURITY_NULL_SID_AUTHORITY</td>
  * <td>0</td>
  * </tr>
  * <tr>
  * <td>SECURITY_WORLD_SID_AUTHORITY</td>
  * <td>1</td>
  * </tr>
  * <tr>
  * <td>SECURITY_LOCAL_SID_AUTHORITY</td>
  * <td>2</td>
  * </tr>
  * <tr>
  * <td>SECURITY_CREATOR_SID_AUTHORITY</td>
  * <td>3</td>
  * </tr>
  * <tr>
  * <td>SECURITY_NON_UNIQUE_AUTHORITY</td>
  * <td>4</td>
  * </tr>
  * <tr>
  * <td>SECURITY_NT_AUTHORITY</td>
  * <td>5</td>
  * </tr>
  * <tr>
  * <td>SECURITY_RESOURCE_MANAGER_AUTHORITY</td>
  * <td>9</td>
  * </tr>
  * </table>
  *  
  * 
  * A SID must contain a top-level authority and at least one <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">relative identifier</a> (RID) value.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-sid_identifier_authority
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SID_IDENTIFIER_AUTHORITY extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * An array of 6 bytes specifying a SID's top-level authority.
     * @type {Array<Byte>}
     */
    Value{
        get {
            if(!this.HasProp("__ValueProxyArray"))
                this.__ValueProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__ValueProxyArray
        }
    }
}
