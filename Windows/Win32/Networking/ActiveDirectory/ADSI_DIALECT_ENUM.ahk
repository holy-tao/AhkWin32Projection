#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ADSI_DIALECT_ENUM enumeration specifies query dialects used in the OLE DB provider for ADSI.
 * @remarks
 * An ActiveX Data Object (ADO) client can use one of the two ADSI query dialects to query a directory. For more information about the ADSI query dialects, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/searching-with-activex-data-objects-ado">Searching with ActiveX Data Objects</a>.
 * 
 * <div class="alert"><b>Note</b>  Because Visual Basic Script (VBScript) cannot read data from a type library, VBScript applications do not recognize the symbolic constants as defined above. Use the numerical constants to set the appropriate flags in your VBScript applications. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-adsi_dialect_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class ADSI_DIALECT_ENUM extends Win32Enum {

    /**
     * ADSI queries are based on the LDAP dialect.
     * Native name: ADSI_DIALECT_LDAP
     * @type {Integer (Int32)}
     */
    static LDAP => 0

    /**
     * ADSI queries are based on the SQL dialect.
     * Native name: ADSI_DIALECT_SQL
     * @type {Integer (Int32)}
     */
    static SQL => 1
}
