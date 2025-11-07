#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that provide information about the creation or closing of sessions for a connection.
 * @remarks
 * 
 * Your authorization plug-in can use this interface to retrieve useful information about clients, client  computers, and remote sessions. For example, your plug-in can track the amount of time that a client is connected and the amount of data transferred during that session.
 * 
 * For a sample that uses the <b>ITSGAccountingEngine</b> interface, see the [Remote Desktop Gateway Pluggable Authentication and Authorization](https://github.com/microsoftarchive/msdn-code-gallery-community-m-r/tree/master/Remote%20Desktop%20Gateway%20Pluggable%20Authentication%20and%20Authorization%20Sample) sample.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tsgpolicyengine/nn-tsgpolicyengine-itsgaccountingengine
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITSGAccountingEngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITSGAccountingEngine
     * @type {Guid}
     */
    static IID => Guid("{4ce2a0c9-e874-4f1a-86f4-06bbb9115338}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoAccounting"]

    /**
     * 
     * @param {Integer} accountingDataType 
     * @param {AAAccountingData} accountingData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgaccountingengine-doaccounting
     */
    DoAccounting(accountingDataType, accountingData) {
        result := ComCall(3, this, "int", accountingDataType, "ptr", accountingData, "HRESULT")
        return result
    }
}
