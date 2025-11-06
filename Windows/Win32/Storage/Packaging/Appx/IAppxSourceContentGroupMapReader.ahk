#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxContentGroup.ahk
#Include .\IAppxContentGroupsEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Gets information about the source content group map.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxsourcecontentgroupmapreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxSourceContentGroupMapReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxSourceContentGroupMapReader
     * @type {Guid}
     */
    static IID => Guid("{f329791d-540b-4a9f-bc75-3282b7d73193}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRequiredGroup", "GetAutomaticGroups"]

    /**
     * 
     * @returns {IAppxContentGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxsourcecontentgroupmapreader-getrequiredgroup
     */
    GetRequiredGroup() {
        result := ComCall(3, this, "ptr*", &requiredGroup := 0, "HRESULT")
        return IAppxContentGroup(requiredGroup)
    }

    /**
     * 
     * @returns {IAppxContentGroupsEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxsourcecontentgroupmapreader-getautomaticgroups
     */
    GetAutomaticGroups() {
        result := ComCall(4, this, "ptr*", &automaticGroupsEnumerator := 0, "HRESULT")
        return IAppxContentGroupsEnumerator(automaticGroupsEnumerator)
    }
}
