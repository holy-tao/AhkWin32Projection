#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITipTransaction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITipTransaction
     * @type {Guid}
     */
    static IID => Guid("{17cf72d0-bac5-11d1-b1bf-00c04fc2f3ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Push", "GetTransactionUrl"]

    /**
     * Explicitly invalidates this channel. Any notifications pushed to this channel after this method is called are not delivered.
     * @remarks
     * After it has been closed, the channel can never be used again. Channels that are closed through this method are no different than channels that have expired. To resume sending push notifications to this app, the app must request a new channel.
     * 
     * Calling Close on a channel invalidates the underlying URI as well as any non-expired, non-closed URIs previously created for the app.
     * @param {Pointer<Integer>} i_pszRemoteTmUrl 
     * @returns {PSTR} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationchannel.close
     */
    Push(i_pszRemoteTmUrl) {
        i_pszRemoteTmUrlMarshal := i_pszRemoteTmUrl is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, i_pszRemoteTmUrlMarshal, i_pszRemoteTmUrl, "ptr*", &o_ppszRemoteTxUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return o_ppszRemoteTxUrl
    }

    /**
     * 
     * @returns {PSTR} 
     */
    GetTransactionUrl() {
        result := ComCall(4, this, "ptr*", &o_ppszLocalTxUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return o_ppszLocalTxUrl
    }
}
