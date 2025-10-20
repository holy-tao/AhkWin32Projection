#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ISurfacePresenterFlip extends IUnknown{
    /**
     * The interface identifier for ISurfacePresenterFlip
     * @type {Guid}
     */
    static IID => Guid("{30510848-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Present() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} backBufferIndex 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppBuffer 
     * @returns {HRESULT} 
     */
    GetBuffer(backBufferIndex, riid, ppBuffer) {
        result := ComCall(4, this, "uint", backBufferIndex, "ptr", riid, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
