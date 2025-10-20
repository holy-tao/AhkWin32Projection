#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostCrst extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostCrst
     * @type {Guid}
     */
    static IID => Guid("{6df710a6-26a4-4a65-8cd5-7237b8bda8dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enter", "Leave", "TryEnter", "SetSpinCount"]

    /**
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Enter(option) {
        result := ComCall(3, this, "uint", option, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Leave() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @param {Pointer<BOOL>} pbSucceeded 
     * @returns {HRESULT} 
     */
    TryEnter(option, pbSucceeded) {
        result := ComCall(5, this, "uint", option, "ptr", pbSucceeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSpinCount 
     * @returns {HRESULT} 
     */
    SetSpinCount(dwSpinCount) {
        result := ComCall(6, this, "uint", dwSpinCount, "HRESULT")
        return result
    }
}
