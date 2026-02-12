#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IOmHistory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOmHistory
     * @type {Guid}
     */
    static IID => Guid("{feceaaa2-8405-11cf-8ba1-00aa00476da6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "back", "forward", "go"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * backupfile (Transact-SQL)
     * @remarks
     * RESTORE VERIFYONLY FROM *backup_device* WITH LOADHISTORY populates the columns of the **backupmediaset** table with the appropriate values from the media-set header.  
     *   
     *  To reduce the number of rows in this table and in other backup and history tables, execute the [sp_delete_backuphistory](../../relational-databases/system-stored-procedures/sp-delete-backuphistory-transact-sql.md) stored procedure.
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/system-tables/backupfile-transact-sql
     */
    back(pvargdistance) {
        result := ComCall(8, this, "ptr", pvargdistance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    forward(pvargdistance) {
        result := ComCall(9, this, "ptr", pvargdistance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    go(pvargdistance) {
        result := ComCall(10, this, "ptr", pvargdistance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
