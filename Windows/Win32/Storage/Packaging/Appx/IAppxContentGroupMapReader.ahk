#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxContentGroup.ahk
#Include .\IAppxContentGroupsEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Gets information about a content group map.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxcontentgroupmapreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxContentGroupMapReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxContentGroupMapReader
     * @type {Guid}
     */
    static IID => Guid("{418726d8-dd99-4f5d-9886-157add20de01}")

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
     * Gets the required content group from the content group map.
     * @returns {IAppxContentGroup} The required content group.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxcontentgroupmapreader-getrequiredgroup
     */
    GetRequiredGroup() {
        result := ComCall(3, this, "ptr*", &requiredGroup := 0, "HRESULT")
        return IAppxContentGroup(requiredGroup)
    }

    /**
     * Gets the automatic content group(s) from the content group map.
     * @returns {IAppxContentGroupsEnumerator} An enumerator for the automatic content group(s).
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxcontentgroupmapreader-getautomaticgroups
     */
    GetAutomaticGroups() {
        result := ComCall(4, this, "ptr*", &automaticGroupsEnumerator := 0, "HRESULT")
        return IAppxContentGroupsEnumerator(automaticGroupsEnumerator)
    }
}
