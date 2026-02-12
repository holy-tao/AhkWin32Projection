#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GameListEntry.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class IGameListStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameListStatics2
     * @type {Guid}
     */
    static IID => Guid("{395f2098-ea1a-45aa-9268-a83905686f27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MergeEntriesAsync", "UnmergeEntryAsync"]

    /**
     * 
     * @param {GameListEntry} left 
     * @param {GameListEntry} right 
     * @returns {IAsyncOperation<GameListEntry>} 
     */
    MergeEntriesAsync(left, right) {
        result := ComCall(6, this, "ptr", left, "ptr", right, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameListEntry, operation)
    }

    /**
     * 
     * @param {GameListEntry} mergedEntry 
     * @returns {IAsyncOperation<IVectorView<GameListEntry>>} 
     */
    UnmergeEntryAsync(mergedEntry) {
        result := ComCall(7, this, "ptr", mergedEntry, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, GameListEntry), operation)
    }
}
