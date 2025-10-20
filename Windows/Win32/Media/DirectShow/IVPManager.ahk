#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVPManager interface is implemented on the Video Port Manager (VPM).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivpmanager
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPManager extends IUnknown{
    /**
     * The interface identifier for IVPManager
     * @type {Guid}
     */
    static IID => Guid("{aac18c18-e186-46d2-825d-a1f8dc8e395a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwVideoPortIndex 
     * @returns {HRESULT} 
     */
    SetVideoPortIndex(dwVideoPortIndex) {
        result := ComCall(3, this, "uint", dwVideoPortIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVideoPortIndex 
     * @returns {HRESULT} 
     */
    GetVideoPortIndex(pdwVideoPortIndex) {
        result := ComCall(4, this, "uint*", pdwVideoPortIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
