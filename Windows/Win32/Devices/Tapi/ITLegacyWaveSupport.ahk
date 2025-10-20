#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITLegacyWaveSupport interface allows an application to discover whether a terminal created by a legacy TSP (pre-TAPI 3) can be controlled using the Wave API.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlegacywavesupport
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyWaveSupport extends IDispatch{
    /**
     * The interface identifier for ITLegacyWaveSupport
     * @type {Guid}
     */
    static IID => Guid("{207823ea-e252-11d2-b77e-0080c7135381}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pSupport 
     * @returns {HRESULT} 
     */
    IsFullDuplex(pSupport) {
        result := ComCall(7, this, "int*", pSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
