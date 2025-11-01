#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Retrieves information about a content group.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxcontentgroup
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxContentGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxContentGroup
     * @type {Guid}
     */
    static IID => Guid("{328f6468-c04f-4e3c-b6fa-6b8d27f3003a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetFiles"]

    /**
     * 
     * @param {Pointer<PWSTR>} groupName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroup-getname
     */
    GetName(groupName) {
        result := ComCall(3, this, "ptr", groupName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxContentGroupFilesEnumerator>} enumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroup-getfiles
     */
    GetFiles(enumerator) {
        result := ComCall(4, this, "ptr*", enumerator, "HRESULT")
        return result
    }
}
