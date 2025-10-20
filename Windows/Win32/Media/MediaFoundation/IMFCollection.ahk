#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a generic collection of IUnknown pointers.
 * @remarks
 * 
  * To create an empty collection object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatecollection">MFCreateCollection</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfcollection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCollection extends IUnknown{
    /**
     * The interface identifier for IMFCollection
     * @type {Guid}
     */
    static IID => Guid("{5bc8a76b-869a-46a3-9b03-fa218a66aebe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcElements 
     * @returns {HRESULT} 
     */
    GetElementCount(pcElements) {
        result := ComCall(3, this, "uint*", pcElements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwElementIndex 
     * @param {Pointer<IUnknown>} ppUnkElement 
     * @returns {HRESULT} 
     */
    GetElement(dwElementIndex, ppUnkElement) {
        result := ComCall(4, this, "uint", dwElementIndex, "ptr", ppUnkElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkElement 
     * @returns {HRESULT} 
     */
    AddElement(pUnkElement) {
        result := ComCall(5, this, "ptr", pUnkElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwElementIndex 
     * @param {Pointer<IUnknown>} ppUnkElement 
     * @returns {HRESULT} 
     */
    RemoveElement(dwElementIndex, ppUnkElement) {
        result := ComCall(6, this, "uint", dwElementIndex, "ptr", ppUnkElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IUnknown>} pUnknown 
     * @returns {HRESULT} 
     */
    InsertElementAt(dwIndex, pUnknown) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", pUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllElements() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
