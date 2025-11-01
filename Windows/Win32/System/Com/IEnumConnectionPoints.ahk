#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} cConnections 
     * @param {Pointer<IConnectionPoint>} ppCP 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnectionpoints-next
     */
    Next(cConnections, ppCP, pcFetched) {
        result := ComCall(3, this, "uint", cConnections, "ptr*", ppCP, "uint*", pcFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cConnections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnectionpoints-skip
     */
    Skip(cConnections) {
        result := ComCall(4, this, "uint", cConnections, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnectionpoints-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumConnectionPoints>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnectionpoints-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
