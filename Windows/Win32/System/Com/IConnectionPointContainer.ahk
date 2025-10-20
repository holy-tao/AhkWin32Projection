#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Supports connection points for connectable objects.
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
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iconnectionpointcontainer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IConnectionPointContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionPointContainer
     * @type {Guid}
     */
    static IID => Guid("{b196b284-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumConnectionPoints", "FindConnectionPoint"]

    /**
     * 
     * @param {Pointer<IEnumConnectionPoints>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-enumconnectionpoints
     */
    EnumConnectionPoints(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IConnectionPoint>} ppCP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint
     */
    FindConnectionPoint(riid, ppCP) {
        result := ComCall(4, this, "ptr", riid, "ptr*", ppCP, "HRESULT")
        return result
    }
}
