#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ISurfacePresenterFlipBuffer extends IUnknown{
    /**
     * The interface identifier for ISurfacePresenterFlipBuffer
     * @type {Guid}
     */
    static IID => Guid("{e43f4a08-8bbc-4665-ac92-c55ce61fd7e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppBuffer 
     * @returns {HRESULT} 
     */
    BeginDraw(riid, ppBuffer) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDraw() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
