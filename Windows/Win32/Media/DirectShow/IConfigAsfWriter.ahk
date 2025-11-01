#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IConfigAsfWriter interface configures the WM ASF Writer filter.
 * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nn-dshowasf-iconfigasfwriter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigAsfWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConfigAsfWriter
     * @type {Guid}
     */
    static IID => Guid("{45086030-f7e4-486a-b504-826bb5792a3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigureFilterUsingProfileId", "GetCurrentProfileId", "ConfigureFilterUsingProfileGuid", "GetCurrentProfileGuid", "ConfigureFilterUsingProfile", "GetCurrentProfile", "SetIndexMode", "GetIndexMode"]

    /**
     * 
     * @param {Integer} dwProfileId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter-configurefilterusingprofileid
     */
    ConfigureFilterUsingProfileId(dwProfileId) {
        result := ComCall(3, this, "uint", dwProfileId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwProfileId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter-getcurrentprofileid
     */
    GetCurrentProfileId(pdwProfileId) {
        pdwProfileIdMarshal := pdwProfileId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwProfileIdMarshal, pdwProfileId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter-configurefilterusingprofileguid
     */
    ConfigureFilterUsingProfileGuid(guidProfile) {
        result := ComCall(5, this, "ptr", guidProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pProfileGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter-getcurrentprofileguid
     */
    GetCurrentProfileGuid(pProfileGuid) {
        result := ComCall(6, this, "ptr", pProfileGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMProfile} pProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter-configurefilterusingprofile
     */
    ConfigureFilterUsingProfile(pProfile) {
        result := ComCall(7, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter-getcurrentprofile
     */
    GetCurrentProfile(ppProfile) {
        result := ComCall(8, this, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bIndexFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter-setindexmode
     */
    SetIndexMode(bIndexFile) {
        result := ComCall(9, this, "int", bIndexFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIndexFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter-getindexmode
     */
    GetIndexMode(pbIndexFile) {
        result := ComCall(10, this, "ptr", pbIndexFile, "HRESULT")
        return result
    }
}
