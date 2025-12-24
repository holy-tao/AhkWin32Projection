#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumConnectionPoints.ahk
#Include .\IUnknown.ahk

/**
 * Enumerates connection points.
 * @remarks
 * 
 * Connectable objects support the following features: 
 * 
 * 
 * 
 * <ul>
 * <li>Outgoing interfaces, such as event sets
 * </li>
 * <li>The ability to enumerate the IIDs of the outgoing interfaces
 * </li>
 * <li>The ability to connect and disconnect sinks to the object for those outgoing IIDs
 * </li>
 * <li>The ability to enumerate the connections that exist to a particular outgoing interface
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ienumconnectionpoints
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumConnectionPoints extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumConnectionPoints
     * @type {Guid}
     */
    static IID => Guid("{b196b285-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Retrieves the specified number of items in the enumeration sequence.
     * @param {Integer} cConnections The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
     * @param {Pointer<IConnectionPoint>} ppCP An array of enumerated items.
     * 
     * The enumerator is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>, and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> through each pointer enumerated. If <i>cConnections</i> is greater than 1, the caller must also pass a non-NULL pointer passed to <i>lpcFetched</i> to know how many pointers to release.
     * @param {Pointer<Integer>} pcFetched The number of items that were retrieved. This parameter is always less than or equal to the number of items requested.
     * @returns {HRESULT} If the method retrieves the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ienumconnectionpoints-next
     */
    Next(cConnections, ppCP, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cConnections, "ptr*", ppCP, pcFetchedMarshal, pcFetched, "int")
        return result
    }

    /**
     * Skips over the specified number of items in the enumeration sequence.
     * @param {Integer} cConnections The number of items to be skipped.
     * @returns {HRESULT} If the method skips the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ienumconnectionpoints-skip
     */
    Skip(cConnections) {
        result := ComCall(4, this, "uint", cConnections, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning.
     * @returns {HRESULT} The return value is S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ienumconnectionpoints-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumConnectionPoints} A pointer to the cloned enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ienumconnectionpoints-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumConnectionPoints(ppEnum)
    }
}
