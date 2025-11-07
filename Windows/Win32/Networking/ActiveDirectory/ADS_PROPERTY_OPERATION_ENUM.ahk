#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies ways to update a named property in the cache.
 * @remarks
 * 
 * The elements of this enumeration are used with the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-putex">IADs.PutEx</a> method, the document of which provides an example of how to use these enumerated constants.
 * 
 * Because Visual Basic Scripting Edition (VBScript) cannot read data from a type library, VBScript applications do not recognize the symbolic constants as defined. Use the numeric constants instead to set the appropriate flags in your VBScript applications. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_property_operation_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_PROPERTY_OPERATION_ENUM{

    /**
     * Instructs the directory service to remove all the property value(s) from the object.
     * @type {Integer (Int32)}
     */
    static ADS_PROPERTY_CLEAR => 1

    /**
     * Instructs the directory service to replace the current value(s) with the specified value(s).
     * @type {Integer (Int32)}
     */
    static ADS_PROPERTY_UPDATE => 2

    /**
     * Instructs the directory service to append the specified value(s) to the existing values(s).
 * 
 * When the <b>ADS_PROPERTY_APPEND</b> operation is specified, the new attribute value(s) are automatically committed to the directory service and removed from the local cache. This forces the local cache to be updated from the directory service the next time the attribute value(s) are retrieved.
     * @type {Integer (Int32)}
     */
    static ADS_PROPERTY_APPEND => 3

    /**
     * Instructs the directory service to delete the specified value(s) from the object.
     * @type {Integer (Int32)}
     */
    static ADS_PROPERTY_DELETE => 4
}
