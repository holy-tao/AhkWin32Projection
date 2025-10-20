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
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iconnectionpoint
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IConnectionPoint extends IUnknown{
    /**
     * The interface identifier for IConnectionPoint
     * @type {Guid}
     */
    static IID => Guid("{b196b286-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pIID 
     * @returns {HRESULT} 
     */
    GetConnectionInterface(pIID) {
        result := ComCall(3, this, "ptr", pIID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IConnectionPointContainer>} ppCPC 
     * @returns {HRESULT} 
     */
    GetConnectionPointContainer(ppCPC) {
        result := ComCall(4, this, "ptr", ppCPC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkSink 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    Advise(pUnkSink, pdwCookie) {
        result := ComCall(5, this, "ptr", pUnkSink, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumConnections>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumConnections(ppEnum) {
        result := ComCall(7, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
