#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\pluginResource2.ahk
#Include .\ItsPubPlugin.ahk

/**
 * Specifies methods that provide information about resources available to users of RemoteApp and Desktop Connections.
 * @see https://docs.microsoft.com/windows/win32/api//tspubplugin2com/nn-tspubplugin2com-itspubplugin2
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ItsPubPlugin2 extends ItsPubPlugin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ItsPubPlugin2
     * @type {Guid}
     */
    static IID => Guid("{fa4ce418-aad7-4ec6-bad1-0a321ba465d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResource2List", "GetResource2", "ResolvePersonalDesktop", "DeletePersonalDesktopAssignment"]

    /**
     * Retrieves a list of resources assigned to the specified user.
     * @param {PWSTR} userID A null-terminated string that contains the security identifier (SID) of the user. If this parameter is <b>NULL</b>, this method should return the resources for all users.
     * @param {Pointer<Integer>} pceAppListSize The address of a <b>LONG</b> variable that receives the number of elements in the <i>resourceList</i> array.
     * @param {Pointer<Pointer<pluginResource2>>} resourceList The address of an array of <a href="https://docs.microsoft.com/windows/win32/api/tspubplugin2com/ns-tspubplugin2com-pluginresource2">pluginResource2</a> structures that contains the resources for the specified user. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function to allocate this memory. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tspubplugin2com/nf-tspubplugin2com-itspubplugin2-getresource2list
     */
    GetResource2List(userID, pceAppListSize, resourceList) {
        userID := userID is String ? StrPtr(userID) : userID

        pceAppListSizeMarshal := pceAppListSize is VarRef ? "int*" : "ptr"
        resourceListMarshal := resourceList is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", userID, pceAppListSizeMarshal, pceAppListSize, resourceListMarshal, resourceList, "HRESULT")
        return result
    }

    /**
     * This method is reserved and should always return E_NOTIMPL.
     * @param {PWSTR} alias This parameter is reserved.
     * @param {Integer} flags This parameter is reserved.
     * @returns {pluginResource2} This parameter is reserved.
     * @see https://docs.microsoft.com/windows/win32/api//tspubplugin2com/nf-tspubplugin2com-itspubplugin2-getresource2
     */
    GetResource2(alias, flags) {
        alias := alias is String ? StrPtr(alias) : alias

        resource := pluginResource2()
        result := ComCall(10, this, "ptr", alias, "int", flags, "ptr", resource, "HRESULT")
        return resource
    }

    /**
     * Called to resolve a mapping between the specified user and a virtual machine in a personal virtual desktop collection.
     * @param {PWSTR} userId A null-terminated string that contains the security identifier (SID) of the user.
     * @param {PWSTR} poolId A null-terminated string that contains the identifier of the collection to obtain the personal desktop from or create the personal desktop in.
     * @param {Integer} ePdResolutionType A value of the <a href="https://docs.microsoft.com/windows/win32/api/tspubplugin2com/ne-tspubplugin2com-tspub_plugin_pd_resolution_type">TSPUB_PLUGIN_PD_RESOLUTION_TYPE</a> enumeration that specifies the type of resolution being requested.
     * @param {PWSTR} endPointName A null-terminated string that receives the name of the end point for the desktop. The length of this string is limited to <b>MAX_ENDPOINT_SIZE</b> characters, including the terminating <b>NULL</b> character.
     * @returns {Integer} A value of the <a href="https://docs.microsoft.com/windows/win32/api/tspubplugin2com/ne-tspubplugin2com-tspub_plugin_pd_assignment_type">TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE</a> enumeration that specifies what type of assignment was made for the personal desktop.
     * @see https://docs.microsoft.com/windows/win32/api//tspubplugin2com/nf-tspubplugin2com-itspubplugin2-resolvepersonaldesktop
     */
    ResolvePersonalDesktop(userId, poolId, ePdResolutionType, endPointName) {
        userId := userId is String ? StrPtr(userId) : userId
        poolId := poolId is String ? StrPtr(poolId) : poolId
        endPointName := endPointName is String ? StrPtr(endPointName) : endPointName

        result := ComCall(11, this, "ptr", userId, "ptr", poolId, "int", ePdResolutionType, "int*", &pPdAssignmentType := 0, "ptr", endPointName, "HRESULT")
        return pPdAssignmentType
    }

    /**
     * Called to delete a mapping between the specified user and a virtual machine in a personal virtual desktop collection.
     * @param {PWSTR} userId A null-terminated string that contains the security identifier (SID) of the user.
     * @param {PWSTR} poolId A null-terminated string that contains the identifier of the collection that the personal desktop exists in.
     * @param {PWSTR} endpointName A null-terminated string that contains the name of the desktop end point to be deleted.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tspubplugin2com/nf-tspubplugin2com-itspubplugin2-deletepersonaldesktopassignment
     */
    DeletePersonalDesktopAssignment(userId, poolId, endpointName) {
        userId := userId is String ? StrPtr(userId) : userId
        poolId := poolId is String ? StrPtr(poolId) : poolId
        endpointName := endpointName is String ? StrPtr(endpointName) : endpointName

        result := ComCall(12, this, "ptr", userId, "ptr", poolId, "ptr", endpointName, "HRESULT")
        return result
    }
}
