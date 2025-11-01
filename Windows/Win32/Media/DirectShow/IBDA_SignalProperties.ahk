#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_SignalProperties)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_signalproperties
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_SignalProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_SignalProperties
     * @type {Guid}
     */
    static IID => Guid("{d2f1644b-b409-11d2-bc69-00a0c9ee9e16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PutNetworkType", "GetNetworkType", "PutSignalSource", "GetSignalSource", "PutTuningSpace", "GetTuningSpace"]

    /**
     * 
     * @param {Pointer<Guid>} guidNetworkType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-putnetworktype
     */
    PutNetworkType(guidNetworkType) {
        result := ComCall(3, this, "ptr", guidNetworkType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidNetworkType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-getnetworktype
     */
    GetNetworkType(pguidNetworkType) {
        result := ComCall(4, this, "ptr", pguidNetworkType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulSignalSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-putsignalsource
     */
    PutSignalSource(ulSignalSource) {
        result := ComCall(5, this, "uint", ulSignalSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulSignalSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-getsignalsource
     */
    GetSignalSource(pulSignalSource) {
        result := ComCall(6, this, "uint*", pulSignalSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTuningSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-puttuningspace
     */
    PutTuningSpace(guidTuningSpace) {
        result := ComCall(7, this, "ptr", guidTuningSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTuingSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalproperties-gettuningspace
     */
    GetTuningSpace(pguidTuingSpace) {
        result := ComCall(8, this, "ptr", pguidTuingSpace, "HRESULT")
        return result
    }
}
