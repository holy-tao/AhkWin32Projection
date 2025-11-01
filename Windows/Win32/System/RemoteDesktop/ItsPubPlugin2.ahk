#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {PWSTR} userID 
     * @param {Pointer<Integer>} pceAppListSize 
     * @param {Pointer<Pointer<pluginResource2>>} resourceList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-getresource2list
     */
    GetResource2List(userID, pceAppListSize, resourceList) {
        userID := userID is String ? StrPtr(userID) : userID

        pceAppListSizeMarshal := pceAppListSize is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", userID, pceAppListSizeMarshal, pceAppListSize, "ptr*", resourceList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} alias 
     * @param {Integer} flags 
     * @param {Pointer<pluginResource2>} resource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-getresource2
     */
    GetResource2(alias, flags, resource) {
        alias := alias is String ? StrPtr(alias) : alias

        result := ComCall(10, this, "ptr", alias, "int", flags, "ptr", resource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} userId 
     * @param {PWSTR} poolId 
     * @param {Integer} ePdResolutionType 
     * @param {Pointer<Integer>} pPdAssignmentType 
     * @param {PWSTR} endPointName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-resolvepersonaldesktop
     */
    ResolvePersonalDesktop(userId, poolId, ePdResolutionType, pPdAssignmentType, endPointName) {
        userId := userId is String ? StrPtr(userId) : userId
        poolId := poolId is String ? StrPtr(poolId) : poolId
        endPointName := endPointName is String ? StrPtr(endPointName) : endPointName

        pPdAssignmentTypeMarshal := pPdAssignmentType is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", userId, "ptr", poolId, "int", ePdResolutionType, pPdAssignmentTypeMarshal, pPdAssignmentType, "ptr", endPointName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} userId 
     * @param {PWSTR} poolId 
     * @param {PWSTR} endpointName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-deletepersonaldesktopassignment
     */
    DeletePersonalDesktopAssignment(userId, poolId, endpointName) {
        userId := userId is String ? StrPtr(userId) : userId
        poolId := poolId is String ? StrPtr(poolId) : poolId
        endpointName := endpointName is String ? StrPtr(endpointName) : endpointName

        result := ComCall(12, this, "ptr", userId, "ptr", poolId, "ptr", endpointName, "HRESULT")
        return result
    }
}
