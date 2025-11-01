#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IViewChapter extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSpecification", "OpenViewChapter"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    GetSpecification(riid, ppRowset) {
        result := ComCall(3, this, "ptr", riid, "ptr*", ppRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hSource 
     * @param {Pointer<Pointer>} phViewChapter 
     * @returns {HRESULT} 
     */
    OpenViewChapter(hSource, phViewChapter) {
        phViewChapterMarshal := phViewChapter is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", hSource, phViewChapterMarshal, phViewChapter, "HRESULT")
        return result
    }
}
