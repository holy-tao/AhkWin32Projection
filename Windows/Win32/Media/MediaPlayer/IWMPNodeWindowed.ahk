#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNodeWindowed extends IUnknown{
    /**
     * The interface identifier for IWMPNodeWindowed
     * @type {Guid}
     */
    static IID => Guid("{96740bfa-c56a-45d1-a3a4-762914d4ade9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} hwnd 
     * @returns {HRESULT} 
     */
    SetOwnerWindow(hwnd) {
        result := ComCall(3, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} phwnd 
     * @returns {HRESULT} 
     */
    GetOwnerWindow(phwnd) {
        result := ComCall(4, this, "ptr*", phwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
