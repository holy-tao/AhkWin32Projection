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
     * 
     * @param {Integer} dwProfileId 
     * @returns {HRESULT} 
     */
    ConfigureFilterUsingProfileId(dwProfileId) {
        result := ComCall(3, this, "uint", dwProfileId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwProfileId 
     * @returns {HRESULT} 
     */
    GetCurrentProfileId(pdwProfileId) {
        result := ComCall(4, this, "uint*", pdwProfileId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProfile 
     * @returns {HRESULT} 
     */
    ConfigureFilterUsingProfileGuid(guidProfile) {
        result := ComCall(5, this, "ptr", guidProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pProfileGuid 
     * @returns {HRESULT} 
     */
    GetCurrentProfileGuid(pProfileGuid) {
        result := ComCall(6, this, "ptr", pProfileGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMProfile>} pProfile 
     * @returns {HRESULT} 
     */
    ConfigureFilterUsingProfile(pProfile) {
        result := ComCall(7, this, "ptr", pProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    GetCurrentProfile(ppProfile) {
        result := ComCall(8, this, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bIndexFile 
     * @returns {HRESULT} 
     */
    SetIndexMode(bIndexFile) {
        result := ComCall(9, this, "int", bIndexFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIndexFile 
     * @returns {HRESULT} 
     */
    GetIndexMode(pbIndexFile) {
        result := ComCall(10, this, "ptr", pbIndexFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
