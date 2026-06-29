#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IItemEnumerator.ahk" { IItemEnumerator }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WcmTargetMode.ahk" { WcmTargetMode }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines the offline target information, specifically, file and registry locations as well as wow64 information.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nn-wcmconfig-itargetinfo
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct ITargetInfo extends IUnknown {
    /**
     * The interface identifier for ITargetInfo
     * @type {Guid}
     */
    static IID := Guid("{9f7d7bb8-20b3-11da-81a5-0030f1642e3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITargetInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTargetMode                  : IntPtr
        SetTargetMode                  : IntPtr
        GetTemporaryStoreLocation      : IntPtr
        SetTemporaryStoreLocation      : IntPtr
        GetTargetID                    : IntPtr
        SetTargetID                    : IntPtr
        GetTargetProcessorArchitecture : IntPtr
        SetTargetProcessorArchitecture : IntPtr
        GetProperty                    : IntPtr
        SetProperty                    : IntPtr
        GetEnumerator                  : IntPtr
        ExpandTarget                   : IntPtr
        ExpandTargetPath               : IntPtr
        SetModulePath                  : IntPtr
        LoadModule                     : IntPtr
        SetWow64Context                : IntPtr
        TranslateWow64                 : IntPtr
        SetSchemaHiveLocation          : IntPtr
        GetSchemaHiveLocation          : IntPtr
        SetSchemaHiveMountName         : IntPtr
        GetSchemaHiveMountName         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITargetInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the current target mode.
     * @returns {WcmTargetMode} The current target mode. The target mode identifies the way in which the redirections from the target are handled.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-gettargetmode
     */
    GetTargetMode() {
        result := ComCall(3, this, "int*", &TargetMode := 0, "HRESULT")
        return TargetMode
    }

    /**
     * Sets the target mode.
     * @param {WcmTargetMode} TargetMode The target mode.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-settargetmode
     */
    SetTargetMode(TargetMode) {
        result := ComCall(4, this, WcmTargetMode, TargetMode, "HRESULT")
        return result
    }

    /**
     * Gets the current temporary store location.
     * @returns {BSTR} The current temporary store location.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-gettemporarystorelocation
     */
    GetTemporaryStoreLocation() {
        TemporaryStoreLocation := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, TemporaryStoreLocation, "HRESULT")
        return TemporaryStoreLocation
    }

    /**
     * Sets the current temporary store location.
     * @param {PWSTR} TemporaryStoreLocation The current temporary store location.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32 (ERROR_INVALID_OPERATION)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the target processor architecture has already been set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that system resources are low.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-settemporarystorelocation
     */
    SetTemporaryStoreLocation(TemporaryStoreLocation) {
        TemporaryStoreLocation := TemporaryStoreLocation is String ? StrPtr(TemporaryStoreLocation) : TemporaryStoreLocation

        result := ComCall(6, this, "ptr", TemporaryStoreLocation, "HRESULT")
        return result
    }

    /**
     * Gets the unique identifier associated with the current target.
     * @returns {BSTR} The unique identifier associated with the current target.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-gettargetid
     */
    GetTargetID() {
        TargetID := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, TargetID, "HRESULT")
        return TargetID
    }

    /**
     * Sets the unique identifier associated with current target.
     * @param {Guid} TargetID The unique identifier associated with current target.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-settargetid
     */
    SetTargetID(TargetID) {
        result := ComCall(8, this, Guid, TargetID, "HRESULT")
        return result
    }

    /**
     * Gets processor architecture associated with the current target.
     * @returns {BSTR} The processor architecture associated with the current target.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-gettargetprocessorarchitecture
     */
    GetTargetProcessorArchitecture() {
        ProcessorArchitecture := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, ProcessorArchitecture, "HRESULT")
        return ProcessorArchitecture
    }

    /**
     * Sets the processor architecture associated with the current target.
     * @param {PWSTR} ProcessorArchitecture The processor architecture associated with the current target.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. Returns <b>HRESULT_FROM_WIN32</b> (<b>ERROR_INVALID_OPERATION</b>) if the target processor architecture has been set. May return <b>E_OUTOFMEMORY</b> if system resources are low.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-settargetprocessorarchitecture
     */
    SetTargetProcessorArchitecture(ProcessorArchitecture) {
        ProcessorArchitecture := ProcessorArchitecture is String ? StrPtr(ProcessorArchitecture) : ProcessorArchitecture

        result := ComCall(10, this, "ptr", ProcessorArchitecture, "HRESULT")
        return result
    }

    /**
     * Gets a property value for the offline installation location.
     * @param {BOOL} Offline <b>True</b> if the installation location is offline.
     * @param {PWSTR} _Property The name of the property.
     * @returns {BSTR} The value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-getproperty
     */
    GetProperty(Offline, _Property) {
        _Property := _Property is String ? StrPtr(_Property) : _Property

        Value := BSTR.Owned()
        result := ComCall(11, this, BOOL, Offline, "ptr", _Property, BSTR.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * Sets a property value for the offline installation location.
     * @param {BOOL} Offline <b>True</b> if installation location is offline.
     * @param {PWSTR} _Property The name of the property.
     * @param {PWSTR} Value The value of the property.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setproperty
     */
    SetProperty(Offline, _Property, Value) {
        _Property := _Property is String ? StrPtr(_Property) : _Property
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(12, this, BOOL, Offline, "ptr", _Property, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Gets the enumerator used to access the collection of offline properties.
     * @remarks
     * <div class="alert"><b>Note</b>   This method is not implemented.</div>
     * <div> </div>
     * @returns {IItemEnumerator} A pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that provides access to  the collection of offline properties.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-getenumerator
     */
    GetEnumerator() {
        result := ComCall(13, this, "ptr*", &_Enumerator := 0, "HRESULT")
        return IItemEnumerator(_Enumerator)
    }

    /**
     * Expands a location string to indicate the offline installation location. (ITargetInfo.ExpandTarget)
     * @param {BOOL} Offline <b>True</b> if the installation location is offline.
     * @param {PWSTR} _Location The location string.
     * @returns {BSTR} The expanded location string.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-expandtarget
     */
    ExpandTarget(Offline, _Location) {
        _Location := _Location is String ? StrPtr(_Location) : _Location

        ExpandedLocation := BSTR.Owned()
        result := ComCall(14, this, BOOL, Offline, "ptr", _Location, BSTR.Ptr, ExpandedLocation, "HRESULT")
        return ExpandedLocation
    }

    /**
     * Expands a location string to indicate the offline installation location. (ITargetInfo.ExpandTargetPath)
     * @param {BOOL} Offline <b>True</b> if the installation location is offline.
     * @param {PWSTR} _Location The location string.
     * @returns {BSTR} The expanded location target path.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-expandtargetpath
     */
    ExpandTargetPath(Offline, _Location) {
        _Location := _Location is String ? StrPtr(_Location) : _Location

        ExpandedLocation := BSTR.Owned()
        result := ComCall(15, this, BOOL, Offline, "ptr", _Location, BSTR.Ptr, ExpandedLocation, "HRESULT")
        return ExpandedLocation
    }

    /**
     * Sets the module path for the offline installation location.
     * @param {PWSTR} Module The name of the module.
     * @param {PWSTR} _Path The module path.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setmodulepath
     */
    SetModulePath(Module, _Path) {
        Module := Module is String ? StrPtr(Module) : Module
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(16, this, "ptr", Module, "ptr", _Path, "HRESULT")
        return result
    }

    /**
     * Loads the module from the offline installation location.
     * @param {PWSTR} Module The name of the module.
     * @returns {HMODULE} The module handle.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-loadmodule
     */
    LoadModule(Module) {
        Module := Module is String ? StrPtr(Module) : Module

        ModuleHandle := HMODULE.Owned()
        result := ComCall(17, this, "ptr", Module, HMODULE.Ptr, ModuleHandle, "HRESULT")
        return ModuleHandle
    }

    /**
     * Sets an opaque context object for wow64 redirection.
     * @remarks
     * <div class="alert"><b>Note</b>  This method is for internal use.</div>
     * <div> </div>
     * @param {PWSTR} InstallerModule The name of the installer module.
     * @param {Pointer<Integer>} Wow64Context The opaque context object for wow64 redirection.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setwow64context
     */
    SetWow64Context(InstallerModule, Wow64Context) {
        InstallerModule := InstallerModule is String ? StrPtr(InstallerModule) : InstallerModule

        Wow64ContextMarshal := Wow64Context is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "ptr", InstallerModule, Wow64ContextMarshal, Wow64Context, "HRESULT")
        return result
    }

    /**
     * Translates paths for wow64 redirection.
     * @remarks
     * <div class="alert"><b>Note</b>  This method is for internal use.</div>
     * <div> </div>
     * @param {PWSTR} ClientArchitecture The name of the client architecture.
     * @param {PWSTR} Value The original path value.
     * @returns {BSTR} The translated path value.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-translatewow64
     */
    TranslateWow64(ClientArchitecture, Value) {
        ClientArchitecture := ClientArchitecture is String ? StrPtr(ClientArchitecture) : ClientArchitecture
        Value := Value is String ? StrPtr(Value) : Value

        TranslatedValue := BSTR.Owned()
        result := ComCall(19, this, "ptr", ClientArchitecture, "ptr", Value, BSTR.Ptr, TranslatedValue, "HRESULT")
        return TranslatedValue
    }

    /**
     * Sets the location of the schema hive.
     * @param {PWSTR} pwzHiveDir A pointer to the location of the schema hive.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the system is low on resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the location <i>pwzHiveDir</i> is not a directory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setschemahivelocation
     */
    SetSchemaHiveLocation(pwzHiveDir) {
        pwzHiveDir := pwzHiveDir is String ? StrPtr(pwzHiveDir) : pwzHiveDir

        result := ComCall(20, this, "ptr", pwzHiveDir, "HRESULT")
        return result
    }

    /**
     * Get the location of the schema hive.
     * @returns {BSTR} A pointer to the schema hive location.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-getschemahivelocation
     */
    GetSchemaHiveLocation() {
        pHiveLocation := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pHiveLocation, "HRESULT")
        return pHiveLocation
    }

    /**
     * Sets the name of the mount location of the schema hive.
     * @param {PWSTR} pwzMountName The mount location of the schema hive.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. May return <b>E_OUTOFMEMORY</b> if the system is low on resources.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setschemahivemountname
     */
    SetSchemaHiveMountName(pwzMountName) {
        pwzMountName := pwzMountName is String ? StrPtr(pwzMountName) : pwzMountName

        result := ComCall(22, this, "ptr", pwzMountName, "HRESULT")
        return result
    }

    /**
     * Gets the name of the mount location of the schema hive.
     * @returns {BSTR} The name of the mount location of the schema hive. The value of <i>pMountName</i> is <b>NULL</b>  on return if the default name is to be used.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-getschemahivemountname
     */
    GetSchemaHiveMountName() {
        pMountName := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pMountName, "HRESULT")
        return pMountName
    }

    Query(iid) {
        if (ITargetInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTargetMode := CallbackCreate(GetMethod(implObj, "GetTargetMode"), flags, 2)
        this.vtbl.SetTargetMode := CallbackCreate(GetMethod(implObj, "SetTargetMode"), flags, 2)
        this.vtbl.GetTemporaryStoreLocation := CallbackCreate(GetMethod(implObj, "GetTemporaryStoreLocation"), flags, 2)
        this.vtbl.SetTemporaryStoreLocation := CallbackCreate(GetMethod(implObj, "SetTemporaryStoreLocation"), flags, 2)
        this.vtbl.GetTargetID := CallbackCreate(GetMethod(implObj, "GetTargetID"), flags, 2)
        this.vtbl.SetTargetID := CallbackCreate(GetMethod(implObj, "SetTargetID"), flags, 2)
        this.vtbl.GetTargetProcessorArchitecture := CallbackCreate(GetMethod(implObj, "GetTargetProcessorArchitecture"), flags, 2)
        this.vtbl.SetTargetProcessorArchitecture := CallbackCreate(GetMethod(implObj, "SetTargetProcessorArchitecture"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 4)
        this.vtbl.GetEnumerator := CallbackCreate(GetMethod(implObj, "GetEnumerator"), flags, 2)
        this.vtbl.ExpandTarget := CallbackCreate(GetMethod(implObj, "ExpandTarget"), flags, 4)
        this.vtbl.ExpandTargetPath := CallbackCreate(GetMethod(implObj, "ExpandTargetPath"), flags, 4)
        this.vtbl.SetModulePath := CallbackCreate(GetMethod(implObj, "SetModulePath"), flags, 3)
        this.vtbl.LoadModule := CallbackCreate(GetMethod(implObj, "LoadModule"), flags, 3)
        this.vtbl.SetWow64Context := CallbackCreate(GetMethod(implObj, "SetWow64Context"), flags, 3)
        this.vtbl.TranslateWow64 := CallbackCreate(GetMethod(implObj, "TranslateWow64"), flags, 4)
        this.vtbl.SetSchemaHiveLocation := CallbackCreate(GetMethod(implObj, "SetSchemaHiveLocation"), flags, 2)
        this.vtbl.GetSchemaHiveLocation := CallbackCreate(GetMethod(implObj, "GetSchemaHiveLocation"), flags, 2)
        this.vtbl.SetSchemaHiveMountName := CallbackCreate(GetMethod(implObj, "SetSchemaHiveMountName"), flags, 2)
        this.vtbl.GetSchemaHiveMountName := CallbackCreate(GetMethod(implObj, "GetSchemaHiveMountName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTargetMode)
        CallbackFree(this.vtbl.SetTargetMode)
        CallbackFree(this.vtbl.GetTemporaryStoreLocation)
        CallbackFree(this.vtbl.SetTemporaryStoreLocation)
        CallbackFree(this.vtbl.GetTargetID)
        CallbackFree(this.vtbl.SetTargetID)
        CallbackFree(this.vtbl.GetTargetProcessorArchitecture)
        CallbackFree(this.vtbl.SetTargetProcessorArchitecture)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.GetEnumerator)
        CallbackFree(this.vtbl.ExpandTarget)
        CallbackFree(this.vtbl.ExpandTargetPath)
        CallbackFree(this.vtbl.SetModulePath)
        CallbackFree(this.vtbl.LoadModule)
        CallbackFree(this.vtbl.SetWow64Context)
        CallbackFree(this.vtbl.TranslateWow64)
        CallbackFree(this.vtbl.SetSchemaHiveLocation)
        CallbackFree(this.vtbl.GetSchemaHiveLocation)
        CallbackFree(this.vtbl.SetSchemaHiveMountName)
        CallbackFree(this.vtbl.GetSchemaHiveMountName)
    }
}
