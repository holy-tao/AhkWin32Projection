#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This feature is expected to be available on a future version of the Windows operating system.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IRegisterTuner)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iregistertuner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IRegisterTuner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegisterTuner
     * @type {Guid}
     */
    static IID => Guid("{359b3901-572c-4854-bb49-cdef66606a25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Unregister"]

    /**
     * 
     * @param {ITuner} pTuner 
     * @param {IGraphBuilder} pGraph 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iregistertuner-register
     */
    Register(pTuner, pGraph) {
        result := ComCall(3, this, "ptr", pTuner, "ptr", pGraph, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iregistertuner-unregister
     */
    Unregister() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
