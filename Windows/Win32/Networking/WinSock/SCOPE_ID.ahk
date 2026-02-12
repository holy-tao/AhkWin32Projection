#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * SCOPE_IDENTITY (Transact-SQL)
 * @remarks
 * SCOPE_IDENTITY, IDENT_CURRENT, and @@IDENTITY are similar functions because they return values that are inserted into identity columns.  
 *   
 *  IDENT_CURRENT is not limited by scope and session; it is limited to a specified table. IDENT_CURRENT returns the value generated for a specific table in any session and any scope. For more information, see [IDENT_CURRENT &#40;Transact-SQL&#41;](../../t-sql/functions/ident-current-transact-sql.md).  
 *   
 *  SCOPE_IDENTITY and @@IDENTITY return the last identity values that are generated in any table in the current session. However, SCOPE_IDENTITY returns values inserted only within the current scope; @@IDENTITY is not limited to a specific scope.  
 *   
 *  For example, there are two tables, T1 and T2, and an INSERT trigger is defined on T1. When a row is inserted to T1, the trigger fires and inserts a row in T2. This scenario illustrates two scopes: the insert on T1, and the insert on T2 by the trigger.  
 *   
 *  Assuming that both T1 and T2 have identity columns, @@IDENTITY and SCOPE_IDENTITY return different values at the end of an INSERT statement on T1. @@IDENTITY returns the last identity column value inserted across any scope in the current session. This is the value inserted in T2. SCOPE_IDENTITY() returns the IDENTITY value inserted in T1. This was the last insert that occurred in the same scope. The SCOPE_IDENTITY() function returns the null value if the function is invoked before any INSERT statements into an identity column occur in the scope.  
 *   
 *  Failed statements and transactions can change the current identity for a table and create gaps in the identity column values. The identity value is never rolled back even though the transaction that tried to insert the value into the table is not committed. For example, if an INSERT statement fails because of an IGNORE_DUP_KEY violation, the current identity value for the table is still incremented.
 * @see https://learn.microsoft.com/sql/ocs/docs/t-sql/functions/scope-identity-transact-sql
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SCOPE_ID extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Zone
     * - Level
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Zone {
        get => (this._bitfield >> 0) & 0xFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Level {
        get => (this._bitfield >> 28) & 0xF
        set => this._bitfield := ((value & 0xF) << 28) | (this._bitfield & ~(0xF << 28))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
