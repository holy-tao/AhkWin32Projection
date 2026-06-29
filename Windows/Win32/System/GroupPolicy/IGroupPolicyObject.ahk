#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\GPO_OPTIONS.ahk" { GPO_OPTIONS }
#Import "..\Registry\HKEY.ahk" { HKEY }
#Import ".\GPO_SECTION.ahk" { GPO_SECTION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GROUP_POLICY_OBJECT_TYPE.ahk" { GROUP_POLICY_OBJECT_TYPE }
#Import "..\..\UI\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\GPO_OPEN_FLAGS.ahk" { GPO_OPEN_FLAGS }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IGroupPolicyObject interface provides methods to create and modify a GPO directly, without using the Group Policy Object Editor.
 * @remarks
 * For methods that Microsoft Management Console (MMC) extension snap-ins can use to communicate with the Group Policy Object Editor, see the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nn-gpedit-igpeinformation">IGPEInformation</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/gpedit/nn-gpedit-igrouppolicyobject
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGroupPolicyObject extends IUnknown {
    /**
     * The interface identifier for IGroupPolicyObject
     * @type {Guid}
     */
    static IID := Guid("{ea502723-a23d-11d1-a7d3-0000f87571e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGroupPolicyObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        New                   : IntPtr
        OpenDSGPO             : IntPtr
        OpenLocalMachineGPO   : IntPtr
        OpenRemoteMachineGPO  : IntPtr
        Save                  : IntPtr
        Delete                : IntPtr
        GetName               : IntPtr
        GetDisplayName        : IntPtr
        SetDisplayName        : IntPtr
        GetPath               : IntPtr
        GetDSPath             : IntPtr
        GetFileSysPath        : IntPtr
        GetRegistryKey        : IntPtr
        GetOptions            : IntPtr
        SetOptions            : IntPtr
        GetType               : IntPtr
        GetMachineName        : IntPtr
        GetPropertySheetPages : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGroupPolicyObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The New method creates a new GPO in the Active Directory with the specified display name. The method opens the GPO using the OpenDSGPO method.
     * @remarks
     * To open a GPO that already exists, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-opendsgpo">OpenDSGPO</a> method.
     * @param {PWSTR} pszDomainName Specifies the Active Directory path of the object to create. If the path specifies a domain controller, the GPO is created on that DC. Otherwise, the system will select a DC on the caller's behalf.
     * @param {PWSTR} pszDisplayName Specifies the display name of the object to create.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-new
     */
    New(pszDomainName, pszDisplayName, dwFlags) {
        pszDomainName := pszDomainName is String ? StrPtr(pszDomainName) : pszDomainName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        result := ComCall(3, this, "ptr", pszDomainName, "ptr", pszDisplayName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The OpenDSGPO method opens the specified GPO and optionally loads the registry information.
     * @remarks
     * To create a new GPO in the Active Directory, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-new">New</a> method.
     * @param {PWSTR} pszPath Specifies the Active Directory path of the object to open. If the path specifies a domain controller, the GPO is created on that DC. Otherwise, the system will select a DC on the caller's behalf.
     * @param {GPO_OPEN_FLAGS} dwFlags 
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-opendsgpo
     */
    OpenDSGPO(pszPath, dwFlags) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, GPO_OPEN_FLAGS, dwFlags, "HRESULT")
        return result
    }

    /**
     * The OpenLocalMachineGPO method opens the default GPO for the computer and optionally loads the registry information.
     * @remarks
     * To open the default GPO for a remote computer, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-openremotemachinegpo">OpenRemoteMachineGPO</a> method.
     * @param {GPO_OPEN_FLAGS} dwFlags 
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-openlocalmachinegpo
     */
    OpenLocalMachineGPO(dwFlags) {
        result := ComCall(5, this, GPO_OPEN_FLAGS, dwFlags, "HRESULT")
        return result
    }

    /**
     * The OpenRemoteMachineGPO method opens the default GPO for the specified remote computer and optionally loads the registry information.
     * @remarks
     * To retrieve the computer name of a remote GPO, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-getmachinename">GetMachineName</a> method. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-openlocalmachinegpo">OpenLocalMachineGPO</a> to open the default GPO for a local computer.
     * @param {PWSTR} pszComputerName Specifies the name of the computer. The format of the name is &#92;&#92;<i>ComputerName</i>.
     * @param {GPO_OPEN_FLAGS} dwFlags 
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-openremotemachinegpo
     */
    OpenRemoteMachineGPO(pszComputerName, dwFlags) {
        pszComputerName := pszComputerName is String ? StrPtr(pszComputerName) : pszComputerName

        result := ComCall(6, this, "ptr", pszComputerName, GPO_OPEN_FLAGS, dwFlags, "HRESULT")
        return result
    }

    /**
     * The Save method saves the specified registry policy settings to disk and updates the revision number of the GPO.
     * @remarks
     * <div class="alert"><b>Note</b>  A policy refresh will be automatically triggered when the user or computer portion of the local Group Policy object is enabled or disabled using the  <b>Save</b> method.</div>
     * <div> </div>
     * @param {BOOL} bMachine Specifies the registry policy settings to be saved. If this parameter is <b>TRUE</b>, the computer policy settings are saved. Otherwise, the user policy settings are saved.
     * @param {BOOL} bAdd Specifies whether this is an add or delete operation. If this parameter is <b>FALSE</b>,  the last policy setting for the specified extension <i>pGuidExtension</i> is removed. In all other cases, this parameter is <b>TRUE</b>.
     * @param {Pointer<Guid>} pGuidExtension Specifies the GUID or unique name of the snap-in extension that will process policy. If the GPO is to be processed by the snap-in that processes .pol files, you must specify the REGISTRY_EXTENSION_GUID value.
     * @param {Pointer<Guid>} pGuid Specifies the GUID that identifies the MMC snap-in used to edit this policy. The snap-in can be a Microsoft snap-in or a third-party snap-in.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-save
     */
    Save(bMachine, bAdd, pGuidExtension, pGuid) {
        result := ComCall(7, this, BOOL, bMachine, BOOL, bAdd, Guid.Ptr, pGuidExtension, Guid.Ptr, pGuid, "HRESULT")
        return result
    }

    /**
     * The Delete method deletes the GPO.
     * @remarks
     * After calling this method, you cannot call other methods of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nn-gpedit-igrouppolicyobject">IGroupPolicyObject</a> interface because all data has been deleted for the GPO.
     * 
     * <div class="alert"><b>Note</b>  A policy refresh will not automatically be triggered when the local Group Policy object is deleted using the <b>Delete</b> method.</div>
     * <div> </div>
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-delete
     */
    Delete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The GetName method retrieves the unique GPO name.
     * @remarks
     * To retrieve the display name for a GPO, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-getdisplayname">GetDisplayName</a> method.
     * @param {PWSTR} pszName Pointer to a buffer that receives the GPO name.
     * @param {Integer} cchMaxLength Specifies the size, in characters, of the <i>pszName</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getname
     */
    GetName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * The GetDisplayName method retrieves the display name for the GPO. (IGroupPolicyObject.GetDisplayName)
     * @remarks
     * To set the display name for a GPO, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-setdisplayname">SetDisplayName</a> method. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-getname">GetName</a> to retrieve the unique name for a GPO, which is a GUID for an Active Directory object.
     * @param {PWSTR} pszName Pointer to a buffer that receives the display name.
     * @param {Integer} cchMaxLength Specifies the size, in characters, of the <i>pszName</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getdisplayname
     */
    GetDisplayName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(10, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * The SetDisplayName method sets the display name for the GPO.
     * @remarks
     * To retrieve the display name for a GPO, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-getdisplayname">GetDisplayName</a> method.
     * @param {PWSTR} pszName Specifies the new display name.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-setdisplayname
     */
    SetDisplayName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(11, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * The GetPath method retrieves the path to the GPO.
     * @param {PWSTR} pszPath Pointer to a buffer that receives the path. If the GPO is an Active Directory object, the path is in ADSI name format. If the GPO is a computer object, this parameter receives a file system path.
     * @param {Integer} cchMaxLength Specifies the maximum number of characters that can be stored in the <i>pszPath</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getpath
     */
    GetPath(pszPath, cchMaxLength) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(12, this, "ptr", pszPath, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * The GetDSPath method retrieves the Active Directory path to the root of the specified GPO section.
     * @remarks
     * If you call the 
     * <b>GetDSPath</b> method and specify a computer GPO, the method succeeds, but on return, the <i>pszPath</i> parameter contains an empty string. This is because computer GPOs do not have Active Directory storage; they have only file system storage.
     * 
     * To retrieve the file system path to the root of a GPO section, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-getfilesyspath">GetFileSysPath</a> method.
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath Pointer to a buffer that receives the path, in ADSI format (LDAP://cn=<i>user</i>, ou=<i>users</i>, dc=<i>coname</i>, dc=<i>com</i>).
     * @param {Integer} cchMaxPath Specifies the maximum number of characters that can be stored in the <i>pszPath</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getdspath
     */
    GetDSPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(13, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "HRESULT")
        return result
    }

    /**
     * The GetFileSysPath method retrieves the file system path to the root of the specified GPO section. The path is in UNC format.
     * @remarks
     * To retrieve the Active Directory path to the root of a GPO section, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-getdspath">GetDSPath</a> method.
     * @param {Integer} dwSection 
     * @param {PWSTR} pszPath Pointer to a buffer that receives the path.
     * @param {Integer} cchMaxPath Specifies the maximum number of characters that can be stored in the <i>pszPath</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getfilesyspath
     */
    GetFileSysPath(dwSection, pszPath, cchMaxPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(14, this, "uint", dwSection, "ptr", pszPath, "int", cchMaxPath, "HRESULT")
        return result
    }

    /**
     * The GetRegistryKey method retrieves a handle to the root of the registry key for the specified GPO section.
     * @remarks
     * The registry handle is a handle to the root of the registry key. To get or set values in the 
     * Policies key, first call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeya">RegOpenKey</a> function to open the <b>Software</b>\
     * Policies key.
     * 
     * When you have finished using the registry handle, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function to close the handle.
     * @param {GPO_SECTION} dwSection 
     * @param {Pointer<HKEY>} _hKey Receives a handle to the registry key. This handle is opened with all access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h. If the registry information is not loaded, the method returns <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getregistrykey
     */
    GetRegistryKey(dwSection, _hKey) {
        result := ComCall(15, this, GPO_SECTION, dwSection, HKEY.Ptr, _hKey, "HRESULT")
        return result
    }

    /**
     * The GetOptions method retrieves the options for the GPO.
     * @remarks
     * To set the options for a GPO, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-setoptions">SetOptions</a> method.
     * @param {Pointer<GPO_OPTIONS>} dwOptions Receives the options. This parameter can be one or more of the following options.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getoptions
     */
    GetOptions(dwOptions) {
        dwOptionsMarshal := dwOptions is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, dwOptionsMarshal, dwOptions, "HRESULT")
        return result
    }

    /**
     * The SetOptions method sets the options for the GPO.
     * @remarks
     * <div class="alert"><b>Note</b>  A policy refresh will be automatically triggered when the user or computer portion of the local Group Policy object is enabled or disabled using the  <b>SetOptions</b> method.</div>
     * <div> </div>
     * To change an option, you must set the appropriate flag in the <i>dwMask</i> parameter. If the flag is set, then the system reads the <i>dwOptions</i> parameter to set the new state. For example, to disable the user portion of a GPO, and leave the computer portion unchanged, call the 
     * <b>SetOptions</b> method as follows:
     * 
     * 
     * ```cpp
     * SetOptions(GPO_OPTION_DISABLE_USER, GPO_OPTION_DISABLE_USER)
     * ```
     * 
     * 
     * To enable the user portion and disable the computer portion, call the 
     * <b>SetOptions</b> method as follows:
     * 
     * 
     * ```cpp
     * SetOptions(GPO_OPTION_DISABLE_MACHINE, GPO_OPTION_DISABLE_USER | GPO_OPTION_DISABLE_MACHINE)
     * ```
     * 
     * 
     * To retrieve the options for a GPO, you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpedit/nf-gpedit-igrouppolicyobject-getoptions">GetOptions</a> method.
     * @param {GPO_OPTIONS} dwOptions Specifies the new option values. This parameter can be one or more of the following options. For more information, see the following Remarks section.
     * @param {Integer} dwMask Specifies the options to change. This parameter can be one or more of the following options. For more information, see the following Remarks section.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-setoptions
     */
    SetOptions(dwOptions, dwMask) {
        result := ComCall(17, this, GPO_OPTIONS, dwOptions, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * The GetType method retrieves type information for the GPO being edited. (IGroupPolicyObject.GetType)
     * @param {Pointer<GROUP_POLICY_OBJECT_TYPE>} gpoType 
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-gettype
     */
    GetType(gpoType) {
        gpoTypeMarshal := gpoType is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, gpoTypeMarshal, gpoType, "HRESULT")
        return result
    }

    /**
     * The GetMachineName method retrieves the computer name of the remote GPO. This is the name specified by the OpenRemoteMachineGPO method.
     * @param {PWSTR} pszName Pointer to a buffer that receives the computer name.
     * @param {Integer} cchMaxLength Specifies the size, in characters, of the <i>pszName</i> buffer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getmachinename
     */
    GetMachineName(pszName, cchMaxLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(19, this, "ptr", pszName, "int", cchMaxLength, "HRESULT")
        return result
    }

    /**
     * The GetPropertySheetPages method retrieves the property sheet pages associated with the GPO.
     * @remarks
     * This method allocates memory for the array with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> function. When you are finished with the property sheet pages, free the array using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @param {Pointer<Pointer<HPROPSHEETPAGE>>} hPages Address of the pointer to an array of property sheet pages.
     * @param {Pointer<Integer>} uPageCount Receives the number of pages in the property sheet array.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the method returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-igrouppolicyobject-getpropertysheetpages
     */
    GetPropertySheetPages(hPages, uPageCount) {
        hPagesMarshal := hPages is VarRef ? "ptr*" : "ptr"
        uPageCountMarshal := uPageCount is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, hPagesMarshal, hPages, uPageCountMarshal, uPageCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGroupPolicyObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.New := CallbackCreate(GetMethod(implObj, "New"), flags, 4)
        this.vtbl.OpenDSGPO := CallbackCreate(GetMethod(implObj, "OpenDSGPO"), flags, 3)
        this.vtbl.OpenLocalMachineGPO := CallbackCreate(GetMethod(implObj, "OpenLocalMachineGPO"), flags, 2)
        this.vtbl.OpenRemoteMachineGPO := CallbackCreate(GetMethod(implObj, "OpenRemoteMachineGPO"), flags, 3)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 5)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 3)
        this.vtbl.GetDisplayName := CallbackCreate(GetMethod(implObj, "GetDisplayName"), flags, 3)
        this.vtbl.SetDisplayName := CallbackCreate(GetMethod(implObj, "SetDisplayName"), flags, 2)
        this.vtbl.GetPath := CallbackCreate(GetMethod(implObj, "GetPath"), flags, 3)
        this.vtbl.GetDSPath := CallbackCreate(GetMethod(implObj, "GetDSPath"), flags, 4)
        this.vtbl.GetFileSysPath := CallbackCreate(GetMethod(implObj, "GetFileSysPath"), flags, 4)
        this.vtbl.GetRegistryKey := CallbackCreate(GetMethod(implObj, "GetRegistryKey"), flags, 3)
        this.vtbl.GetOptions := CallbackCreate(GetMethod(implObj, "GetOptions"), flags, 2)
        this.vtbl.SetOptions := CallbackCreate(GetMethod(implObj, "SetOptions"), flags, 3)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.GetMachineName := CallbackCreate(GetMethod(implObj, "GetMachineName"), flags, 3)
        this.vtbl.GetPropertySheetPages := CallbackCreate(GetMethod(implObj, "GetPropertySheetPages"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.New)
        CallbackFree(this.vtbl.OpenDSGPO)
        CallbackFree(this.vtbl.OpenLocalMachineGPO)
        CallbackFree(this.vtbl.OpenRemoteMachineGPO)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetDisplayName)
        CallbackFree(this.vtbl.SetDisplayName)
        CallbackFree(this.vtbl.GetPath)
        CallbackFree(this.vtbl.GetDSPath)
        CallbackFree(this.vtbl.GetFileSysPath)
        CallbackFree(this.vtbl.GetRegistryKey)
        CallbackFree(this.vtbl.GetOptions)
        CallbackFree(this.vtbl.SetOptions)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetMachineName)
        CallbackFree(this.vtbl.GetPropertySheetPages)
    }
}
