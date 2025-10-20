#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Gets information about a content group map.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxcontentgroupmapreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxContentGroupMapReader extends IUnknown{
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
     * 
     * @param {Pointer<IAppxContentGroup>} requiredGroup 
     * @returns {HRESULT} 
     */
    GetRequiredGroup(requiredGroup) {
        result := ComCall(3, this, "ptr", requiredGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxContentGroupsEnumerator>} automaticGroupsEnumerator 
     * @returns {HRESULT} 
     */
    GetAutomaticGroups(automaticGroupsEnumerator) {
        result := ComCall(4, this, "ptr", automaticGroupsEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
