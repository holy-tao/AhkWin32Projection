#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNodeWindowed extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOwnerWindow", "GetOwnerWindow"]

    /**
     * 
     * @param {Pointer} hwnd 
     * @returns {HRESULT} 
     */
    SetOwnerWindow(hwnd) {
        result := ComCall(3, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} phwnd 
     * @returns {HRESULT} 
     */
    GetOwnerWindow(phwnd) {
        phwndMarshal := phwnd is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, phwndMarshal, phwnd, "HRESULT")
        return result
    }
}
