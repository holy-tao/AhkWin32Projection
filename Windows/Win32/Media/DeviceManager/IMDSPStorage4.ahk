#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage3.ahk

/**
 * The IMDSPStorage4 interface extends IMDSPStorage3 for supporting virtual storages (such as playlists and albums) and metadata.Note  Unless the service provider has added the device parameter UseExtendedWmdm with a value of 1, Windows Media Device Manager will not call this interface. See Device Parameters for more information about this. .
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorage4
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage4 extends IMDSPStorage3{
    /**
     * The interface identifier for IMDSPStorage4
     * @type {Guid}
     */
    static IID => Guid("{3133b2c4-515c-481b-b1ce-39327ecb4f74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Integer} dwRefs 
     * @param {Pointer<IMDSPStorage>} ppISPStorage 
     * @returns {HRESULT} 
     */
    SetReferences(dwRefs, ppISPStorage) {
        result := ComCall(19, this, "uint", dwRefs, "ptr", ppISPStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRefs 
     * @param {Pointer<IMDSPStorage>} pppISPStorage 
     * @returns {HRESULT} 
     */
    GetReferences(pdwRefs, pppISPStorage) {
        result := ComCall(20, this, "uint*", pdwRefs, "ptr", pppISPStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {PWSTR} pwszName 
     * @param {Pointer<IWMDMMetaData>} pMetadata 
     * @param {Integer} qwFileSize 
     * @param {Pointer<IMDSPStorage>} ppNewStorage 
     * @returns {HRESULT} 
     */
    CreateStorageWithMetadata(dwAttributes, pwszName, pMetadata, qwFileSize, ppNewStorage) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(21, this, "uint", dwAttributes, "ptr", pwszName, "ptr", pMetadata, "uint", qwFileSize, "ptr", ppNewStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PWSTR>} ppwszPropNames 
     * @param {Pointer<IWMDMMetaData>} pMetadata 
     * @returns {HRESULT} 
     */
    GetSpecifiedMetadata(cProperties, ppwszPropNames, pMetadata) {
        result := ComCall(22, this, "uint", cProperties, "ptr", ppwszPropNames, "ptr", pMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID 
     * @param {Pointer<IMDSPStorage>} ppStorage 
     * @returns {HRESULT} 
     */
    FindStorage(findScope, pwszUniqueID, ppStorage) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(23, this, "int", findScope, "ptr", pwszUniqueID, "ptr", ppStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Pointer<IMDSPStorage>} ppStorage 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the window is a child window, the return value is a handle to the parent window. If the window is a top-level window with the <b>WS_POPUP</b> style, the return value is a handle to the owner window. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * This function typically fails for one of the following reasons:
     * 
     * 
     * <ul>
     * <li>The window is a top-level window that is unowned or does not have the <b>WS_POPUP</b> style. </li>
     * <li>The owner window has <b>WS_POPUP</b> style.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(ppStorage) {
        result := ComCall(24, this, "ptr", ppStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
