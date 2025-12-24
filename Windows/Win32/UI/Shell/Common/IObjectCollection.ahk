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
     * Adds a single object to the collection.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the object to be added to the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//objectarray/nf-objectarray-iobjectcollection-addobject
     */
    AddObject(punk) {
        result := ComCall(5, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Adds the objects contained in an IObjectArray to the collection.
     * @param {IObjectArray} poaSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a> whose contents are to be added to the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//objectarray/nf-objectarray-iobjectcollection-addfromarray
     */
    AddFromArray(poaSource) {
        result := ComCall(6, this, "ptr", poaSource, "HRESULT")
        return result
    }

    /**
     * Removes a single, specified object from the collection.
     * @param {Integer} uiIndex Type: <b>UINT*</b>
     * 
     * A pointer to the index of the object within the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//objectarray/nf-objectarray-iobjectcollection-removeobjectat
     */
    RemoveObjectAt(uiIndex) {
        result := ComCall(7, this, "uint", uiIndex, "HRESULT")
        return result
    }

    /**
     * Removes all objects from the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//objectarray/nf-objectarray-iobjectcollection-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
