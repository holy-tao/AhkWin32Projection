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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVideoPortIndex", "GetVideoPortIndex"]

    /**
     * The SetVideoPortIndex method instructs the Video Port Manager (VPM) to connect to the specified video port.
     * @param {Integer} dwVideoPortIndex Double word containing the video port index.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivpmanager-setvideoportindex
     */
    SetVideoPortIndex(dwVideoPortIndex) {
        result := ComCall(3, this, "uint", dwVideoPortIndex, "HRESULT")
        return result
    }

    /**
     * The GetVideoPortIndex method returns the current video port index being used by the Video Port Manager (VPM).
     * @returns {Integer} Pointer to a double word containing the index of the video port that the VPM is currently connected to.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivpmanager-getvideoportindex
     */
    GetVideoPortIndex() {
        result := ComCall(4, this, "uint*", &pdwVideoPortIndex := 0, "HRESULT")
        return pdwVideoPortIndex
    }
}
