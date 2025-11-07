#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IHTMLPersistData extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["save", "load", "queryType"]

    /**
     * 
     * @param {IUnknown} pUnk 
     * @param {Integer} lType 
     * @returns {VARIANT_BOOL} 
     */
    save(pUnk, lType) {
        result := ComCall(3, this, "ptr", pUnk, "int", lType, "short*", &fContinueBroacast := 0, "HRESULT")
        return fContinueBroacast
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @param {Integer} lType 
     * @returns {VARIANT_BOOL} 
     */
    load(pUnk, lType) {
        result := ComCall(4, this, "ptr", pUnk, "int", lType, "short*", &fDoDefault := 0, "HRESULT")
        return fDoDefault
    }

    /**
     * 
     * @param {Integer} lType 
     * @returns {VARIANT_BOOL} 
     */
    queryType(lType) {
        result := ComCall(5, this, "int", lType, "short*", &pfSupportsType := 0, "HRESULT")
        return pfSupportsType
    }
}
