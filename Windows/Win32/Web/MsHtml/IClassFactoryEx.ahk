#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IClassFactory.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IClassFactoryEx extends IClassFactory{
    /**
     * The interface identifier for IClassFactoryEx
     * @type {Guid}
     */
    static IID => Guid("{342d1ea0-ae25-11d1-89c5-006008c3fbfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<IUnknown>} punkContext 
     * @param {Pointer<IUnknown>} punkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateInstanceWithContext(punkContext, punkOuter, riid, ppv) {
        result := ComCall(5, this, "ptr", punkContext, "ptr", punkOuter, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
