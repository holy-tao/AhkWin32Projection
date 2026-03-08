#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods for receiving event notifications.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IRowsetEvents</b> if your provider needs to receive notifications of rowset events. <b>IRowsetEvents</b> exposes methods for receiving event notifications, and must be implemented to receive the following notifications on events: <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">OnChangedItem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-ondeleteditem">OnDeletedItem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onnewitem">OnNewItem</a> and <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onrowsetevent">OnRowsetEvent</a>. The <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_itemstate">ROWSETEVENT_ITEMSTATE</a> and <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-rowsetevent_type">ROWSETEVENT_TYPE</a> enumerators capture the item state and rowset event, respectively. 
 * 
 * Indexer eventing is a new feature for Windows 7 that allows providers to receive notifications on their rowsets. Providers can use eventing to maintain their rowsets in such a way that they behave akin to actual file system locations.
 * 
 * The <b>IRowsetEvents</b> interface is registered by connection point with an open indexer rowset.
 * 
 * <b>DBPROP_ENABLEROWSETEVENTS</b> must be set to <b>TRUE</b> with the OLE DB <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms711497(v=vs.85)">ICommandProperties::SetProperties</a> method prior to executing the query in order to use rowset eventing.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-irowsetevents
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRow extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRow
     * @type {Guid}
     */
    static IID => Guid("{0c733ab4-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColumns", "GetSourceRowset", "Open"]

    /**
     * 
     * @param {Pointer} cColumns 
     * @param {Pointer<DBCOLUMNACCESS>} rgColumns 
     * @returns {HRESULT} 
     */
    GetColumns(cColumns, rgColumns) {
        result := ComCall(3, this, "ptr", cColumns, "ptr", rgColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppRowset 
     * @param {Pointer<Pointer>} phRow 
     * @returns {HRESULT} 
     */
    GetSourceRowset(riid, ppRowset, phRow) {
        phRowMarshal := phRow is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", riid, "ptr*", ppRowset, phRowMarshal, phRow, "HRESULT")
        return result
    }

    /**
     * Opens a handle to a backup event log created by the BackupEventLog function. (ANSI)
     * @remarks
     * If the backup filename specifies a remote server, the <i>lpUNCServerName</i> parameter must be <b>NULL</b>.
     * 
     * When this function is used on Windows Vista and later computers, only backup event logs that were saved with the <b>BackupEventLog</b> function on Windows Vista and later computers can be opened.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines OpenBackupEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pColumnID 
     * @param {Pointer<Guid>} rguidColumnType 
     * @param {Integer} dwBindFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openbackupeventloga
     */
    Open(pUnkOuter, pColumnID, rguidColumnType, dwBindFlags, riid) {
        result := ComCall(5, this, "ptr", pUnkOuter, "ptr", pColumnID, "ptr", rguidColumnType, "uint", dwBindFlags, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
