#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the content groups from a content group map.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxcontentgroupsenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxContentGroupsEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxContentGroupsEnumerator
     * @type {Guid}
     */
    static IID => Guid("{3264e477-16d1-4d63-823e-7d2984696634}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrent", "GetHasCurrent", "MoveNext"]

    /**
     * 
     * @param {Pointer<IAppxContentGroup>} stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroupsenumerator-getcurrent
     */
    GetCurrent(stream) {
        result := ComCall(3, this, "ptr*", stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroupsenumerator-gethascurrent
     */
    GetHasCurrent(hasCurrent) {
        result := ComCall(4, this, "ptr", hasCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroupsenumerator-movenext
     */
    MoveNext(hasNext) {
        result := ComCall(5, this, "ptr", hasNext, "HRESULT")
        return result
    }
}
