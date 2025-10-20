#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IHTMLPersistData extends IUnknown{
    /**
     * The interface identifier for IHTMLPersistData
     * @type {Guid}
     */
    static IID => Guid("{3050f4c5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @param {Integer} lType 
     * @param {Pointer<VARIANT_BOOL>} fContinueBroacast 
     * @returns {HRESULT} 
     */
    save(pUnk, lType, fContinueBroacast) {
        result := ComCall(3, this, "ptr", pUnk, "int", lType, "ptr", fContinueBroacast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @param {Integer} lType 
     * @param {Pointer<VARIANT_BOOL>} fDoDefault 
     * @returns {HRESULT} 
     */
    load(pUnk, lType, fDoDefault) {
        result := ComCall(4, this, "ptr", pUnk, "int", lType, "ptr", fDoDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lType 
     * @param {Pointer<VARIANT_BOOL>} pfSupportsType 
     * @returns {HRESULT} 
     */
    queryType(lType, pfSupportsType) {
        result := ComCall(5, this, "int", lType, "ptr", pfSupportsType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
