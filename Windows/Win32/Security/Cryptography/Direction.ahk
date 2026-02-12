#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Direction Property
 * @remarks
 * Use the **Direction** property to specify how a parameter is passed to or from a procedure. The **Direction** property is read/write; this allows you to work with providers that don't return this information or to set this information when you don't want ADO to make an extra call to the provider to retrieve parameter information.  
 *   
 *  Not all providers can determine the direction of parameters in their stored procedures. In these cases, you must set the **Direction** property before you execute the query.
 * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/direction-property
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class Direction extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DirectionEncrypt => 1

    /**
     * @type {Integer (Int32)}
     */
    static DirectionDecrypt => 2
}
