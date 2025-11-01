#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQManagement.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueueManagement extends IMSMQManagement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQueueManagement
     * @type {Guid}
     */
    static IID => Guid("{7fbe7759-5760-444d-b8a5-5e7ab9a84cce}")

    /**
     * The class identifier for MSMQQueueManagement
     * @type {Guid}
     */
    static CLSID => Guid("{33b6d07e-f27d-42fa-b2d7-bf82e11e9374}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_JournalMessageCount", "get_BytesInJournal", "EodGetReceiveInfo"]

    /**
     * 
     * @param {Pointer<Integer>} plJournalMessageCount 
     * @returns {HRESULT} 
     */
    get_JournalMessageCount(plJournalMessageCount) {
        plJournalMessageCountMarshal := plJournalMessageCount is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, plJournalMessageCountMarshal, plJournalMessageCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvBytesInJournal 
     * @returns {HRESULT} 
     */
    get_BytesInJournal(pvBytesInJournal) {
        result := ComCall(17, this, "ptr", pvBytesInJournal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvCollection 
     * @returns {HRESULT} 
     */
    EodGetReceiveInfo(pvCollection) {
        result := ComCall(18, this, "ptr", pvCollection, "HRESULT")
        return result
    }
}
