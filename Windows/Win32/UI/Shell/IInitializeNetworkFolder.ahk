#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that initializes the network data source CLSID_NetworkPlaces as specified.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iinitializenetworkfolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInitializeNetworkFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeNetworkFolder
     * @type {Guid}
     */
    static IID => Guid("{6e0f9881-42a8-4f2a-97f8-8af4e026d92d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a network folder, as specified.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The Shell namespace location for this data source, as an IDList.
     * @param {Pointer<ITEMIDLIST>} pidlTarget Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The target namespace location, as an IDList. This is used when the data source is aliased into the namespace. This parameter specifies the location of the network item that the data source will represent. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipersistfolder3-initializeex">InitializeEx</a> and in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info">PERSIST_FOLDER_TARGET_INFO</a> see the <i>pidlTargetFolder</i>   definition for more information.
     * @param {Integer} uDisplayType Type: <b>UINT</b>
     * 
     * The display type of the network resource this data source will represent. This is one of the RESOURCEDISPLAYTYPE_XXX values found in winnetwk.h.
     * @param {PWSTR} pszResName Type: <b>LPCWSTR</b>
     * 
     * The network resource name. for example, \\server or \\server\share. this is passed to the WNet in the <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a>.<i>lpRemoteName</i> field.
     * @param {PWSTR} pszProvider Type: <b>LPCWSTR</b>
     * 
     * Optional network provider, as in the <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a>.<i>lpProvider</i> field.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iinitializenetworkfolder-initialize
     */
    Initialize(pidl, pidlTarget, uDisplayType, pszResName, pszProvider) {
        pszResName := pszResName is String ? StrPtr(pszResName) : pszResName
        pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

        result := ComCall(3, this, "ptr", pidl, "ptr", pidlTarget, "uint", uDisplayType, "ptr", pszResName, "ptr", pszProvider, "HRESULT")
        return result
    }
}
