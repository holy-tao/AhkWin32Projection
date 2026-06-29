#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TSPUB_PLUGIN_PD_RESOLUTION_TYPE.ahk" { TSPUB_PLUGIN_PD_RESOLUTION_TYPE }
#Import ".\ItsPubPlugin.ahk" { ItsPubPlugin }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE.ahk" { TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\pluginResource2.ahk" { pluginResource2 }

/**
 * Specifies methods that provide information about resources available to users of RemoteApp and Desktop Connections.
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nn-tspubplugin2com-itspubplugin2
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ItsPubPlugin2 extends ItsPubPlugin {
    /**
     * The interface identifier for ItsPubPlugin2
     * @type {Guid}
     */
    static IID := Guid("{fa4ce418-aad7-4ec6-bad1-0a321ba465d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ItsPubPlugin2 interfaces
    */
    struct Vtbl extends ItsPubPlugin.Vtbl {
        GetResource2List                : IntPtr
        GetResource2                    : IntPtr
        ResolvePersonalDesktop          : IntPtr
        DeletePersonalDesktopAssignment : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ItsPubPlugin2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a list of resources assigned to the specified user. (ItsPubPlugin2.GetResource2List)
     * @param {PWSTR} userID A null-terminated string that contains the security identifier (SID) of the user. If this parameter is <b>NULL</b>, this method should return the resources for all users.
     * @param {Pointer<Integer>} pceAppListSize The address of a <b>LONG</b> variable that receives the number of elements in the <i>resourceList</i> array.
     * @param {Pointer<Pointer<pluginResource2>>} resourceList The address of an array of <a href="https://docs.microsoft.com/windows/win32/api/tspubplugin2com/ns-tspubplugin2com-pluginresource2">pluginResource2</a> structures that contains the resources for the specified user. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function to allocate this memory. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-getresource2list
     */
    GetResource2List(userID, pceAppListSize, resourceList) {
        userID := userID is String ? StrPtr(userID) : userID

        pceAppListSizeMarshal := pceAppListSize is VarRef ? "int*" : "ptr"
        resourceListMarshal := resourceList is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", userID, pceAppListSizeMarshal, pceAppListSize, resourceListMarshal, resourceList, "HRESULT")
        return result
    }

    /**
     * This method is reserved and should always return E_NOTIMPL. (ItsPubPlugin2.GetResource2)
     * @param {PWSTR} alias This parameter is reserved.
     * @param {Integer} flags This parameter is reserved.
     * @returns {pluginResource2} This parameter is reserved.
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-getresource2
     */
    GetResource2(alias, flags) {
        alias := alias is String ? StrPtr(alias) : alias

        resource := pluginResource2()
        result := ComCall(10, this, "ptr", alias, "int", flags, pluginResource2.Ptr, resource, "HRESULT")
        return resource
    }

    /**
     * Called to resolve a mapping between the specified user and a virtual machine in a personal virtual desktop collection.
     * @remarks
     * <b>MAX_ENDPOINT_SIZE</b> is declared as follows:
     * 
     * <c>#define MAX_ENDPOINT_SIZE 256</c>
     * @param {PWSTR} userId A null-terminated string that contains the security identifier (SID) of the user.
     * @param {PWSTR} poolId A null-terminated string that contains the identifier of the collection to obtain the personal desktop from or create the personal desktop in.
     * @param {TSPUB_PLUGIN_PD_RESOLUTION_TYPE} ePdResolutionType A value of the <a href="https://docs.microsoft.com/windows/win32/api/tspubplugin2com/ne-tspubplugin2com-tspub_plugin_pd_resolution_type">TSPUB_PLUGIN_PD_RESOLUTION_TYPE</a> enumeration that specifies the type of resolution being requested.
     * @param {PWSTR} endPointName A null-terminated string that receives the name of the end point for the desktop. The length of this string is limited to <b>MAX_ENDPOINT_SIZE</b> characters, including the terminating <b>NULL</b> character.
     * @returns {TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE} A value of the <a href="https://docs.microsoft.com/windows/win32/api/tspubplugin2com/ne-tspubplugin2com-tspub_plugin_pd_assignment_type">TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE</a> enumeration that specifies what type of assignment was made for the personal desktop.
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-resolvepersonaldesktop
     */
    ResolvePersonalDesktop(userId, poolId, ePdResolutionType, endPointName) {
        userId := userId is String ? StrPtr(userId) : userId
        poolId := poolId is String ? StrPtr(poolId) : poolId
        endPointName := endPointName is String ? StrPtr(endPointName) : endPointName

        result := ComCall(11, this, "ptr", userId, "ptr", poolId, TSPUB_PLUGIN_PD_RESOLUTION_TYPE, ePdResolutionType, "int*", &pPdAssignmentType := 0, "ptr", endPointName, "HRESULT")
        return pPdAssignmentType
    }

    /**
     * Called to delete a mapping between the specified user and a virtual machine in a personal virtual desktop collection.
     * @param {PWSTR} userId A null-terminated string that contains the security identifier (SID) of the user.
     * @param {PWSTR} poolId A null-terminated string that contains the identifier of the collection that the personal desktop exists in.
     * @param {PWSTR} endpointName A null-terminated string that contains the name of the desktop end point to be deleted.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-deletepersonaldesktopassignment
     */
    DeletePersonalDesktopAssignment(userId, poolId, endpointName) {
        userId := userId is String ? StrPtr(userId) : userId
        poolId := poolId is String ? StrPtr(poolId) : poolId
        endpointName := endpointName is String ? StrPtr(endpointName) : endpointName

        result := ComCall(12, this, "ptr", userId, "ptr", poolId, "ptr", endpointName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ItsPubPlugin2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResource2List := CallbackCreate(GetMethod(implObj, "GetResource2List"), flags, 4)
        this.vtbl.GetResource2 := CallbackCreate(GetMethod(implObj, "GetResource2"), flags, 4)
        this.vtbl.ResolvePersonalDesktop := CallbackCreate(GetMethod(implObj, "ResolvePersonalDesktop"), flags, 6)
        this.vtbl.DeletePersonalDesktopAssignment := CallbackCreate(GetMethod(implObj, "DeletePersonalDesktopAssignment"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResource2List)
        CallbackFree(this.vtbl.GetResource2)
        CallbackFree(this.vtbl.ResolvePersonalDesktop)
        CallbackFree(this.vtbl.DeletePersonalDesktopAssignment)
    }
}
