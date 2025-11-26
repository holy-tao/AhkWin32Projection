#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IItemEnumerator.ahk
#Include ..\..\Foundation\HMODULE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the offline target information, specifically, file and registry locations as well as wow64 information.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-itargetinfo
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ITargetInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetInfo
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bb8-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTargetMode", "SetTargetMode", "GetTemporaryStoreLocation", "SetTemporaryStoreLocation", "GetTargetID", "SetTargetID", "GetTargetProcessorArchitecture", "SetTargetProcessorArchitecture", "GetProperty", "SetProperty", "GetEnumerator", "ExpandTarget", "ExpandTargetPath", "SetModulePath", "LoadModule", "SetWow64Context", "TranslateWow64", "SetSchemaHiveLocation", "GetSchemaHiveLocation", "SetSchemaHiveMountName", "GetSchemaHiveMountName"]

    /**
     * Gets the current target mode.
     * @returns {Integer} The current target mode. The target mode identifies the way in which the redirections from the target are handled.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-gettargetmode
     */
    GetTargetMode() {
        result := ComCall(3, this, "int*", &TargetMode := 0, "HRESULT")
        return TargetMode
    }

    /**
     * Sets the target mode.
     * @param {Integer} TargetMode The target mode.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-settargetmode
     */
    SetTargetMode(TargetMode) {
        result := ComCall(4, this, "int", TargetMode, "HRESULT")
        return result
    }

    /**
     * Gets the current temporary store location.
     * @returns {BSTR} The current temporary store location.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-gettemporarystorelocation
     */
    GetTemporaryStoreLocation() {
        TemporaryStoreLocation := BSTR()
        result := ComCall(5, this, "ptr", TemporaryStoreLocation, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-settemporarystorelocation
     */
    SetTemporaryStoreLocation(TemporaryStoreLocation) {
        TemporaryStoreLocation := TemporaryStoreLocation is String ? StrPtr(TemporaryStoreLocation) : TemporaryStoreLocation

        result := ComCall(6, this, "ptr", TemporaryStoreLocation, "HRESULT")
        return result
    }

    /**
     * Gets the unique identifier associated with the current target.
     * @returns {BSTR} The unique identifier associated with the current target.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-gettargetid
     */
    GetTargetID() {
        TargetID := BSTR()
        result := ComCall(7, this, "ptr", TargetID, "HRESULT")
        return TargetID
    }

    /**
     * Sets the unique identifier associated with current target.
     * @param {Guid} TargetID The unique identifier associated with current target.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-settargetid
     */
    SetTargetID(TargetID) {
        result := ComCall(8, this, "ptr", TargetID, "HRESULT")
        return result
    }

    /**
     * Gets processor architecture associated with the current target.
     * @returns {BSTR} The processor architecture associated with the current target.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-gettargetprocessorarchitecture
     */
    GetTargetProcessorArchitecture() {
        ProcessorArchitecture := BSTR()
        result := ComCall(9, this, "ptr", ProcessorArchitecture, "HRESULT")
        return ProcessorArchitecture
    }

    /**
     * Sets the processor architecture associated with the current target.
     * @param {PWSTR} ProcessorArchitecture The processor architecture associated with the current target.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. Returns <b>HRESULT_FROM_WIN32</b> (<b>ERROR_INVALID_OPERATION</b>) if the target processor architecture has been set. May return <b>E_OUTOFMEMORY</b> if system resources are low.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-settargetprocessorarchitecture
     */
    SetTargetProcessorArchitecture(ProcessorArchitecture) {
        ProcessorArchitecture := ProcessorArchitecture is String ? StrPtr(ProcessorArchitecture) : ProcessorArchitecture

        result := ComCall(10, this, "ptr", ProcessorArchitecture, "HRESULT")
        return result
    }

    /**
     * Gets a property value for the offline installation location.
     * @param {BOOL} Offline <b>True</b> if the installation location is offline.
     * @param {PWSTR} Property The name of the property.
     * @returns {BSTR} The value of the property.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-getproperty
     */
    GetProperty(Offline, Property) {
        Property := Property is String ? StrPtr(Property) : Property

        Value := BSTR()
        result := ComCall(11, this, "int", Offline, "ptr", Property, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * Sets a property value for the offline installation location.
     * @param {BOOL} Offline <b>True</b> if installation location is offline.
     * @param {PWSTR} Property The name of the property.
     * @param {PWSTR} Value The value of the property.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-setproperty
     */
    SetProperty(Offline, Property, Value) {
        Property := Property is String ? StrPtr(Property) : Property
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(12, this, "int", Offline, "ptr", Property, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Gets the enumerator used to access the collection of offline properties.
     * @returns {IItemEnumerator} A pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that provides access to  the collection of offline properties.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-getenumerator
     */
    GetEnumerator() {
        result := ComCall(13, this, "ptr*", &Enumerator := 0, "HRESULT")
        return IItemEnumerator(Enumerator)
    }

    /**
     * Expands a location string to indicate the offline installation location.
     * @param {BOOL} Offline <b>True</b> if the installation location is offline.
     * @param {PWSTR} Location The location string.
     * @returns {BSTR} The expanded location string.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-expandtarget
     */
    ExpandTarget(Offline, Location) {
        Location := Location is String ? StrPtr(Location) : Location

        ExpandedLocation := BSTR()
        result := ComCall(14, this, "int", Offline, "ptr", Location, "ptr", ExpandedLocation, "HRESULT")
        return ExpandedLocation
    }

    /**
     * Expands a location string to indicate the offline installation location.
     * @param {BOOL} Offline <b>True</b> if the installation location is offline.
     * @param {PWSTR} Location The location string.
     * @returns {BSTR} The expanded location target path.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-expandtargetpath
     */
    ExpandTargetPath(Offline, Location) {
        Location := Location is String ? StrPtr(Location) : Location

        ExpandedLocation := BSTR()
        result := ComCall(15, this, "int", Offline, "ptr", Location, "ptr", ExpandedLocation, "HRESULT")
        return ExpandedLocation
    }

    /**
     * Sets the module path for the offline installation location.
     * @param {PWSTR} Module The name of the module.
     * @param {PWSTR} Path The module path.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-setmodulepath
     */
    SetModulePath(Module, Path) {
        Module := Module is String ? StrPtr(Module) : Module
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(16, this, "ptr", Module, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * Loads the module from the offline installation location.
     * @param {PWSTR} Module The name of the module.
     * @returns {HMODULE} The module handle.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-loadmodule
     */
    LoadModule(Module) {
        Module := Module is String ? StrPtr(Module) : Module

        ModuleHandle := HMODULE()
        result := ComCall(17, this, "ptr", Module, "ptr", ModuleHandle, "HRESULT")
        return ModuleHandle
    }

    /**
     * Sets an opaque context object for wow64 redirection.
     * @param {PWSTR} InstallerModule The name of the installer module.
     * @param {Pointer<Integer>} Wow64Context The opaque context object for wow64 redirection.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-setwow64context
     */
    SetWow64Context(InstallerModule, Wow64Context) {
        InstallerModule := InstallerModule is String ? StrPtr(InstallerModule) : InstallerModule

        Wow64ContextMarshal := Wow64Context is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "ptr", InstallerModule, Wow64ContextMarshal, Wow64Context, "HRESULT")
        return result
    }

    /**
     * Translates paths for wow64 redirection.
     * @param {PWSTR} ClientArchitecture The name of the client architecture.
     * @param {PWSTR} Value The original path value.
     * @returns {BSTR} The translated path value.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-translatewow64
     */
    TranslateWow64(ClientArchitecture, Value) {
        ClientArchitecture := ClientArchitecture is String ? StrPtr(ClientArchitecture) : ClientArchitecture
        Value := Value is String ? StrPtr(Value) : Value

        TranslatedValue := BSTR()
        result := ComCall(19, this, "ptr", ClientArchitecture, "ptr", Value, "ptr", TranslatedValue, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-setschemahivelocation
     */
    SetSchemaHiveLocation(pwzHiveDir) {
        pwzHiveDir := pwzHiveDir is String ? StrPtr(pwzHiveDir) : pwzHiveDir

        result := ComCall(20, this, "ptr", pwzHiveDir, "HRESULT")
        return result
    }

    /**
     * Get the location of the schema hive.
     * @returns {BSTR} A pointer to the schema hive location.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-getschemahivelocation
     */
    GetSchemaHiveLocation() {
        pHiveLocation := BSTR()
        result := ComCall(21, this, "ptr", pHiveLocation, "HRESULT")
        return pHiveLocation
    }

    /**
     * Sets the name of the mount location of the schema hive.
     * @param {PWSTR} pwzMountName The mount location of the schema hive.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. May return <b>E_OUTOFMEMORY</b> if the system is low on resources.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-setschemahivemountname
     */
    SetSchemaHiveMountName(pwzMountName) {
        pwzMountName := pwzMountName is String ? StrPtr(pwzMountName) : pwzMountName

        result := ComCall(22, this, "ptr", pwzMountName, "HRESULT")
        return result
    }

    /**
     * Gets the name of the mount location of the schema hive.
     * @returns {BSTR} The name of the mount location of the schema hive. The value of <i>pMountName</i> is <b>NULL</b>  on return if the default name is to be used.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-itargetinfo-getschemahivemountname
     */
    GetSchemaHiveMountName() {
        pMountName := BSTR()
        result := ComCall(23, this, "ptr", pMountName, "HRESULT")
        return pMountName
    }
}
