#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetView extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateView", "GetView"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    CreateView(pUnkOuter, riid) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", &ppView := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppView)
    }

    /**
     * The GetViewportExtEx function retrieves the x-extent and y-extent of the current viewport for the specified device context.
     * @param {Pointer} hChapter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer>} phChapterSource 
     * @param {Pointer<IUnknown>} ppView 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getviewportextex
     */
    GetView(hChapter, riid, phChapterSource, ppView) {
        phChapterSourceMarshal := phChapterSource is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", hChapter, "ptr", riid, phChapterSourceMarshal, phChapterSource, "ptr*", ppView, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
