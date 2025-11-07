#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumConnections.ahk
#Include .\IUnknown.ahk

/**
 * Enumerates the current connections for a connectable object.
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
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ienumconnections
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumConnections extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumConnections
     * @type {Guid}
     */
    static IID => Guid("{b196b287-bab4-101a-b69c-00aa00341d07}")

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
     * @param {Pointer<CONNECTDATA>} rgcd 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnections-next
     */
    Next(cConnections, rgcd, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cConnections, "ptr", rgcd, pcFetchedMarshal, pcFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cConnections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnections-skip
     */
    Skip(cConnections) {
        result := ComCall(4, this, "uint", cConnections, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnections-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumConnections} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumconnections-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumConnections(ppEnum)
    }
}
