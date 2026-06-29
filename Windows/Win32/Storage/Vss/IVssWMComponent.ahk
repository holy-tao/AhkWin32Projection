#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVssWMDependency.ahk" { IVssWMDependency }
#Import ".\VSS_COMPONENTINFO.ahk" { VSS_COMPONENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IVssWMFiledesc.ahk" { IVssWMFiledesc }

/**
 * The IVssWMComponent is a C++ (not COM) interface that allows access to component information stored in a Writer Metadata Document.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivsswmcomponent
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssWMComponent extends IUnknown {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssWMComponent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetComponentInfo   : IntPtr
        FreeComponentInfo  : IntPtr
        GetFile            : IntPtr
        GetDatabaseFile    : IntPtr
        GetDatabaseLogFile : IntPtr
        GetDependency      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssWMComponent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetComponentInfo method obtains basic information about the specified writer metadata component.
     * @remarks
     * The caller is responsible for freeing the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> structure by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-freecomponentinfo">IVssWMComponent::FreeComponentInfo</a>.
     * @returns {Pointer<VSS_COMPONENTINFO>} Doubly indirect pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> structure containing the returned component information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivsswmcomponent-getcomponentinfo
     */
    GetComponentInfo() {
        result := ComCall(3, this, "ptr*", &ppInfo := 0, "HRESULT")
        return ppInfo
    }

    /**
     * The FreeComponentInfo method deallocates system resources devoted to the specified component information.
     * @param {Pointer<VSS_COMPONENTINFO>} pInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> structure that contains the component information.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully freed the component information data.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivsswmcomponent-freecomponentinfo
     */
    FreeComponentInfo(pInfo) {
        result := ComCall(4, this, VSS_COMPONENTINFO.Ptr, pInfo, "HRESULT")
        return result
    }

    /**
     * The GetFile method obtains a file descriptor associated with a file group.
     * @remarks
     * The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release system resources held by the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object.
     * @param {Integer} iFile Offset between 0 and <i>n</i>-1, where <i>n</i> is the number of files in the file group as specified by the <b>cFileCount</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> object returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getcomponentinfo">IVssWMComponent::GetComponentInfo</a>.
     * @returns {IVssWMFiledesc} Doubly indirect pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object containing the returned file descriptor information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivsswmcomponent-getfile
     */
    GetFile(iFile) {
        result := ComCall(5, this, "uint", iFile, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    /**
     * The GetDatabaseFile method obtains an IVssWMFiledesc object containing information about the specified database backup component file.
     * @remarks
     * The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release system resources held by the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object.
     * @param {Integer} iDBFile Offset between 0 and <i>n</i>-1, where <i>n</i> is the number of database files as specified by the <b>cDatabases</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> object returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getcomponentinfo">IVssWMComponent::GetComponentInfo</a>.
     * @returns {IVssWMFiledesc} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object containing the returned file descriptor information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivsswmcomponent-getdatabasefile
     */
    GetDatabaseFile(iDBFile) {
        result := ComCall(6, this, "uint", iDBFile, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    /**
     * The GetDatabaseLogFile method obtains a file descriptor for the log file associated with the specified database backup component.
     * @remarks
     * The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release system resources held by the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object.
     * @param {Integer} iDbLogFile Offset between 0 and <i>n</i>-1, where <i>n</i> is the number of database log files as specified by the <b>cLogFiles</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> object returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getcomponentinfo">IVssWMComponent::GetComponentInfo</a>.
     * @returns {IVssWMFiledesc} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object containing the returned file descriptor information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivsswmcomponent-getdatabaselogfile
     */
    GetDatabaseLogFile(iDbLogFile) {
        result := ComCall(7, this, "uint", iDbLogFile, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    /**
     * The GetDependency method returns an instance of the IVssWMDependency interface containing accessors for obtaining information about explicit writer-component dependencies of one of the current components.
     * @remarks
     * The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release system resources held by the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object.
     * @param {Integer} iDependency Offset between 0 and <i>n</i>-1, where <i>n</i> is the number of dependencies associated with this component as specified by the <b>cDependencies</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> object returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getcomponentinfo">IVssWMComponent::GetComponentInfo</a>.
     * @returns {IVssWMDependency} Doubly indirect pointer to an instance of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmdependency">IVssWMDependency</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivsswmcomponent-getdependency
     */
    GetDependency(iDependency) {
        result := ComCall(8, this, "uint", iDependency, "ptr*", &ppDependency := 0, "HRESULT")
        return IVssWMDependency(ppDependency)
    }

    Query(iid) {
        if (IVssWMComponent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetComponentInfo := CallbackCreate(GetMethod(implObj, "GetComponentInfo"), flags, 2)
        this.vtbl.FreeComponentInfo := CallbackCreate(GetMethod(implObj, "FreeComponentInfo"), flags, 2)
        this.vtbl.GetFile := CallbackCreate(GetMethod(implObj, "GetFile"), flags, 3)
        this.vtbl.GetDatabaseFile := CallbackCreate(GetMethod(implObj, "GetDatabaseFile"), flags, 3)
        this.vtbl.GetDatabaseLogFile := CallbackCreate(GetMethod(implObj, "GetDatabaseLogFile"), flags, 3)
        this.vtbl.GetDependency := CallbackCreate(GetMethod(implObj, "GetDependency"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetComponentInfo)
        CallbackFree(this.vtbl.FreeComponentInfo)
        CallbackFree(this.vtbl.GetFile)
        CallbackFree(this.vtbl.GetDatabaseFile)
        CallbackFree(this.vtbl.GetDatabaseLogFile)
        CallbackFree(this.vtbl.GetDependency)
    }
}
