#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumConnectionPoints.ahk
#Include .\IConnectionPoint.ahk
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
     * Creates an enumerator object to iterate through all the connection points supported in the connectable object, one connection point per outgoing IID.
     * @returns {IEnumConnectionPoints} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ienumconnectionpoints">IEnumConnectionPoints</a> interface pointer variable that receives the pointer to the newly created enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iconnectionpointcontainer-enumconnectionpoints
     */
    EnumConnectionPoints() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumConnectionPoints(ppEnum)
    }

    /**
     * Returns a pointer to the IConnectionPoint interface of a connection point for a specified IID, if that IID describes a supported outgoing interface.
     * @param {Pointer<Guid>} riid Interface identifier of the outgoing interface whose connection point object is being requested.
     * @returns {IConnectionPoint} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iconnectionpoint">IConnectionPoint</a> interface pointer variable that receives the pointer to the connection point that supports the <i>riid</i> interface. If an error occurs, the implementation sets the value to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint
     */
    FindConnectionPoint(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppCP := 0, "HRESULT")
        return IConnectionPoint(ppCP)
    }
}
