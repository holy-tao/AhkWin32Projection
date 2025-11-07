#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IQueryContinue.ahk

/**
 * Exposes methods that provide a standard mechanism for credential providers to call QueryContinue while attempting to connect to the network to determine if they should continue these attempts.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iquerycontinue">IQueryContinue</a> interface, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-iquerycontinuewithstatus
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IQueryContinueWithStatus extends IQueryContinue{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryContinueWithStatus
     * @type {Guid}
     */
    static IID => Guid("{9090be5b-502b-41fb-bccc-0049a6c7254b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStatusMessage"]

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-iquerycontinuewithstatus-setstatusmessage
     */
    SetStatusMessage(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(4, this, "ptr", psz, "HRESULT")
        return result
    }
}
