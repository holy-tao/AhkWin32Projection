#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IViewChapter extends IUnknown{
    /**
     * The interface identifier for IViewChapter
     * @type {Guid}
     */
    static IID => Guid("{0c733a98-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    GetSpecification(riid, ppRowset) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppRowset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hSource 
     * @param {Pointer<UIntPtr>} phViewChapter 
     * @returns {HRESULT} 
     */
    OpenViewChapter(hSource, phViewChapter) {
        result := ComCall(4, this, "ptr", hSource, "ptr*", phViewChapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
