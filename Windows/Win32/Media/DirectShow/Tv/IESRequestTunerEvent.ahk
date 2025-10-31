#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IESEvent.ahk

/**
 * Contains methods that enable a Protected Broadcast Driver Architecture (PBDA)-supported device to get exclusive access to a tuner and its Conditional Access Services (CAS).
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESRequestTunerEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesrequesttunerevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESRequestTunerEvent extends IESEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESRequestTunerEvent
     * @type {Guid}
     */
    static IID => Guid("{54c7a5e8-c3bb-4f51-af14-e0e2c0e34c6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPriority", "GetReason", "GetConsequences", "GetEstimatedTime"]

    /**
     * 
     * @param {Pointer<Integer>} pbyPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesrequesttunerevent-getpriority
     */
    GetPriority(pbyPriority) {
        result := ComCall(8, this, "char*", pbyPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbyReason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesrequesttunerevent-getreason
     */
    GetReason(pbyReason) {
        result := ComCall(9, this, "char*", pbyReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbyConsequences 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesrequesttunerevent-getconsequences
     */
    GetConsequences(pbyConsequences) {
        result := ComCall(10, this, "char*", pbyConsequences, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwEstimatedTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesrequesttunerevent-getestimatedtime
     */
    GetEstimatedTime(pdwEstimatedTime) {
        result := ComCall(11, this, "uint*", pdwEstimatedTime, "HRESULT")
        return result
    }
}
