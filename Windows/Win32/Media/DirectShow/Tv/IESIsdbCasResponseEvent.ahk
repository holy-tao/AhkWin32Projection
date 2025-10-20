#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IESEvent.ahk

/**
 * Implements methods that get information from a Protected Broadcast Driver Architecture (PBDA) IsdbCasResponse event.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESIsdbCasResponseEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesisdbcasresponseevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESIsdbCasResponseEvent extends IESEvent{
    /**
     * The interface identifier for IESIsdbCasResponseEvent
     * @type {Guid}
     */
    static IID => Guid("{2017cb03-dc0f-4c24-83ca-36307b2cd19f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<UInt32>} pRequestId 
     * @returns {HRESULT} 
     */
    GetRequestId(pRequestId) {
        result := ComCall(8, this, "uint*", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(9, this, "uint*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pRequestLength 
     * @returns {HRESULT} 
     */
    GetDataLength(pRequestLength) {
        result := ComCall(10, this, "uint*", pRequestLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pbData 
     * @returns {HRESULT} 
     */
    GetResponseData(pbData) {
        result := ComCall(11, this, "ptr", pbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
