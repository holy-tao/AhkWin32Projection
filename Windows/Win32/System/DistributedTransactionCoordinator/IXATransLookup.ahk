#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransaction.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IXATransLookup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXATransLookup
     * @type {Guid}
     */
    static IID => Guid("{f3b1f131-eeda-11ce-aed4-00aa0051e2c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lookup"]

    /**
     * Accepts the name of a system and an account as input. It retrieves a security identifier (SID) for the account and the name of the domain on which the account was found. (Unicode)
     * @remarks
     * The <b>LookupAccountName</b> function attempts to find a SID for the specified name by first checking a list of well-known SIDs. If the name does not correspond to a well-known SID, the function checks built-in and administratively defined local accounts. Next, the function checks the primary domain. If the name is not found there, trusted domains are checked.
     * 
     * Use fully qualified account names (for example, domain_name\user_name) instead of isolated names (for example, user_name). Fully qualified names are unambiguous and provide better performance when the lookup is performed. This function also supports fully qualified DNS names (for example, example.example.com\user_name) and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal names</a> (UPN) (for example, someone@example.com).
     * 
     * In addition to looking up local accounts, local domain accounts, and explicitly trusted domain accounts, <b>LookupAccountName</b> can look up the name for any account in any domain in the forest.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines LookupAccountName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {ITransaction} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-lookupaccountnamew
     */
    Lookup() {
        result := ComCall(3, this, "ptr*", &ppTransaction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITransaction(ppTransaction)
    }
}
