#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxContentGroupFilesEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Retrieves information about a content group.
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxcontentgroup
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
     * Gets the name of the content group.
     * @returns {PWSTR} The content group name.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxcontentgroup-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &groupName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return groupName
    }

    /**
     * Gets files from a content group.
     * @returns {IAppxContentGroupFilesEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxcontentgroup-getfiles
     */
    GetFiles() {
        result := ComCall(4, this, "ptr*", &enumerator_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxContentGroupFilesEnumerator(enumerator_)
    }
}
