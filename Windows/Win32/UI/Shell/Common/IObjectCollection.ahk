#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IObjectArray.ahk

/**
 * Extends the IObjectArray interface by providing methods that enable clients to add and remove objects that support IUnknown in a collection.
 * @remarks
 * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Use this interface to interact with a collection of generic objects.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objectarray/nn-objectarray-iobjectcollection
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class IObjectCollection extends IObjectArray{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectCollection
     * @type {Guid}
     */
    static IID => Guid("{5632b1a4-e38a-400a-928a-d4cd63230295}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddObject", "AddFromArray", "RemoveObjectAt", "Clear"]

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectcollection-addobject
     */
    AddObject(punk) {
        result := ComCall(5, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IObjectArray} poaSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectcollection-addfromarray
     */
    AddFromArray(poaSource) {
        result := ComCall(6, this, "ptr", poaSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectcollection-removeobjectat
     */
    RemoveObjectAt(uiIndex) {
        result := ComCall(7, this, "uint", uiIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objectarray/nf-objectarray-iobjectcollection-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
