#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetView extends IUnknown{
    /**
     * The interface identifier for IRowsetView
     * @type {Guid}
     */
    static IID => Guid("{0c733a99-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppView 
     * @returns {HRESULT} 
     */
    CreateView(pUnkOuter, riid, ppView) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr", ppView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<UIntPtr>} phChapterSource 
     * @param {Pointer<IUnknown>} ppView 
     * @returns {HRESULT} 
     */
    GetView(hChapter, riid, phChapterSource, ppView) {
        result := ComCall(4, this, "ptr", hChapter, "ptr", riid, "ptr*", phChapterSource, "ptr", ppView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
