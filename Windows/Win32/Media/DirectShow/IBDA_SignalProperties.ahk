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
     * 
     * @param {Pointer<Guid>} guidNetworkType 
     * @returns {HRESULT} 
     */
    PutNetworkType(guidNetworkType) {
        result := ComCall(3, this, "ptr", guidNetworkType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidNetworkType 
     * @returns {HRESULT} 
     */
    GetNetworkType(pguidNetworkType) {
        result := ComCall(4, this, "ptr", pguidNetworkType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSignalSource 
     * @returns {HRESULT} 
     */
    PutSignalSource(ulSignalSource) {
        result := ComCall(5, this, "uint", ulSignalSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulSignalSource 
     * @returns {HRESULT} 
     */
    GetSignalSource(pulSignalSource) {
        result := ComCall(6, this, "uint*", pulSignalSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTuningSpace 
     * @returns {HRESULT} 
     */
    PutTuningSpace(guidTuningSpace) {
        result := ComCall(7, this, "ptr", guidTuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTuingSpace 
     * @returns {HRESULT} 
     */
    GetTuningSpace(pguidTuingSpace) {
        result := ComCall(8, this, "ptr", pguidTuingSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
