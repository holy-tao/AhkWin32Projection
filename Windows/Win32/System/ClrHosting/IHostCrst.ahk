#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostCrst extends IUnknown{
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
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Enter(option) {
        result := ComCall(3, this, "uint", option, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Leave() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @param {Pointer<BOOL>} pbSucceeded 
     * @returns {HRESULT} 
     */
    TryEnter(option, pbSucceeded) {
        result := ComCall(5, this, "uint", option, "ptr", pbSucceeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSpinCount 
     * @returns {HRESULT} 
     */
    SetSpinCount(dwSpinCount) {
        result := ComCall(6, this, "uint", dwSpinCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
