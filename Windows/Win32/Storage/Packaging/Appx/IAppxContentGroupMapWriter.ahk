#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for a content group map.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxcontentgroupmapwriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxContentGroupMapWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxContentGroupMapWriter
     * @type {Guid}
     */
    static IID => Guid("{d07ab776-a9de-4798-8c14-3db31e687c78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAutomaticGroup", "AddAutomaticFile", "Close"]

    /**
     * 
     * @param {PWSTR} groupName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroupmapwriter-addautomaticgroup
     */
    AddAutomaticGroup(groupName) {
        groupName := groupName is String ? StrPtr(groupName) : groupName

        result := ComCall(3, this, "ptr", groupName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroupmapwriter-addautomaticfile
     */
    AddAutomaticFile(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(4, this, "ptr", fileName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
